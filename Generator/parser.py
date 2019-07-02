__author__ = 'dmitriypetrusevich'

import xml.etree.ElementTree as ElementTree
import re

re_find_mod = re.compile("([a-z])\s%\s([0-9]+)")
re_find_equal = re.compile("([a-z0-9_]+?)\s=\s([0-9\.,]+)")
re_find_not_equal = re.compile("([a-z0-9_]+?)\s!=\s([0-9\.,]+)")
re_find_range = re.compile("([0-9]+)\.\.([0-9]+)")

source_header = """/*
*
*   This is generated source file from 'plural.xml'.
*   http://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html
*   http://unicode.org/cldr/trac/browser/trunk/common/supplemental/plurals.xml
*
*
*   n - absolute value of the source number (integer and decimals).
*   i - integer digits of n.
*   v - number of visible fraction digits in n, with trailing zeros.
*   w - number of visible fraction digits in n, without trailing zeros.
*   f - visible fractional digits in n, with trailing zeros.
*   t - visible fractional digits in n, without trailing zeros.
*
*/

#include <string.h>
#include "dp_gen_plural.h"


enum DPPluralRule dp_plural_rules_always_other(double n, int i, int v, int w, int f, int t) {
    return DPPluralRuleOther;
}

"""

header_header = """/*
*
*   This is generated source file from 'plural.xml'.
*   http://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html
*   http://unicode.org/cldr/trac/browser/trunk/common/supplemental/plurals.xml
*
*
*   n - absolute value of the source number (integer and decimals).
*   i - integer digits of n.
*   v - number of visible fraction digits in n, with trailing zeros.
*   w - number of visible fraction digits in n, without trailing zeros.
*   f - visible fractional digits in n, with trailing zeros.
*   t - visible fractional digits in n, without trailing zeros.
*
*/

enum DPPluralRule {
    DPPluralRuleUnknown,

    DPPluralRuleZero,
    DPPluralRuleOne,
    DPPluralRuleTwo,
    DPPluralRuleFew,
    DPPluralRuleMany,
    DPPluralRuleOther
};

typedef enum DPPluralRule(*dp_plural_rules_func)(double n, int i, int v, int w, int f, int t);

enum DPPluralRule dp_plural_rules_always_other(double n, int i, int v, int w, int f, int t);
dp_plural_rules_func dp_plural_rules_for_lang(const char *lang_code);


"""


# parse plural.xml
def parse_xml():
    root_el = ElementTree.parse('plurals.xml').getroot()

    for form in root_el.findall('plurals'):
        if form.attrib['type'] == 'cardinal':
            plural = form
            break

    collections = plural.findall('pluralRules')

    rules_by_locale = {}

    for rule_collection in collections:
        locales = rule_collection.attrib['locales'].split()
        rules = rule_collection.findall('pluralRule')
        rules_dict = {}

        for rule in rules:
            count = rule.attrib['count']

            sym_index = rule.text.find('@')
            if sym_index != -1:
                rules_dict[count] = rule.text[0:sym_index].strip()
            else:
                rules_dict[count] = rule.text.strip()

        for locale in locales:
            rules_by_locale[locale] = rules_dict

    return rules_by_locale


# generate source file
def generate_source(rules, lang_code):
    pre_calc_vars = {}

    condition_zero = generate_condition_string(rules.get('zero'), pre_calc_vars)
    condition_one = generate_condition_string(rules.get('one'), pre_calc_vars)
    condition_two = generate_condition_string(rules.get('two'), pre_calc_vars)
    condition_few = generate_condition_string(rules.get('few'), pre_calc_vars)
    condition_many = generate_condition_string(rules.get('many'), pre_calc_vars)

    decl_string = "enum DPPluralRule dp_plural_rules_" + lang_code + "(double n, int i, int v, int w, int f, int t)"
    impl_string = ""

    if condition_zero is not None:
        impl_string += "\tif (" + condition_zero + ") { // " + rules.get(
            'zero') + "\n\t\treturn DPPluralRuleZero;\n\t}\n"
    if condition_one is not None:
        impl_string += "\tif (" + condition_one + ") { // " + rules.get('one') + "\n\t\treturn DPPluralRuleOne;\n\t}\n"
    if condition_two is not None:
        impl_string += "\tif (" + condition_two + ") { // " + rules.get('two') + "\n\t\treturn DPPluralRuleTwo;\n\t}\n"
    if condition_few is not None:
        impl_string += "\tif (" + condition_few + ") { // " + rules.get('few') + "\n\t\treturn DPPluralRuleFew;\n\t}\n"
    if condition_many is not None:
        impl_string += "\tif (" + condition_many + ") { // " + rules.get(
            'many') + "\n\t\treturn DPPluralRuleMany;\n\t}\n"

    impl_string += "\treturn DPPluralRuleOther;\n}\n"

    var_str = ""
    for key in pre_calc_vars:
        var_str += ("\t" + pre_calc_vars[key] + "\n")

    impl_string = (decl_string + " {\n" + var_str + "\n" + impl_string)
    decl_string += ";"

    return decl_string, impl_string


# generate condition string from rule string and set pre-calculated variables
def generate_condition_string(rule_string, pre_calc_vars):
    if rule_string is None:
        return None

    and_idx = rule_string.find("and")
    or_idx = rule_string.find("or")

    if and_idx != -1 and or_idx != -1:
        result_string = "(" + rule_string.replace("and", "&&").replace(" or ", ") || (") + ")"
    else:
        result_string = rule_string.replace("and", "&&").replace("or", "||")

    # module (a % b)
    matches = reversed(list(re_find_mod.finditer(result_string)))
    for match in matches:
        match_range = match.regs[0]
        var_name = result_string[match.regs[1][0]:match.regs[1][1]]
        mod_value = result_string[match.regs[2][0]:match.regs[2][1]]

        gen_var_name = var_name + "_mod_" + mod_value
        pre_calc_vars[gen_var_name] = "int " + gen_var_name + " = (int)" + var_name + ' % ' + mod_value + ';'
        result_string = result_string[:match_range[0]] + gen_var_name + result_string[match_range[1]:]

    # in range (a == b..c,d..e,f)
    matches = reversed(list(re_find_equal.finditer(result_string)))
    for match in matches:
        match_range = match.span()
        var_name = match.group(1)
        vals_list = match.group(2).split(',')

        substr = ""
        for val in vals_list:
            if len(substr) != 0:
                substr += ' || '

            range_match = re_find_range.search(val)
            if range_match is None:
                substr += (var_name + " == " + val)
            else:
                val_from = range_match.group(1)
                val_to = range_match.group(2)
                substr += "(" + var_name + ' >= ' + val_from + ' && ' + var_name + ' <= ' + val_to + ")"

        if len(vals_list) > 1:
            substr = "(" + substr + ")"

        result_string = result_string[:match_range[0]] + substr + result_string[match_range[1]:]

    # not in range (a != b..c,d..e,f)
    matches = reversed(list(re_find_not_equal.finditer(result_string)))
    for match in matches:
        match_range = match.span()
        var_name = match.group(1)
        vals_list = match.group(2).split(',')

        substr = ""
        for val in vals_list:
            if len(substr) != 0:
                substr += ' && '

            range_match = re_find_range.search(val)
            if range_match is None:
                substr += (var_name + " != " + val)
            else:
                val_from = range_match.group(1)
                val_to = range_match.group(2)
                substr += "!(" + var_name + ' >= ' + val_from + ' && ' + var_name + ' <= ' + val_to + ")"

        if len(vals_list) > 1:
            substr = "(" + substr + ")"

        result_string = result_string[:match_range[0]] + substr + result_string[match_range[1]:]

    # return result string (I know, this is useless comment)
    return result_string


result = parse_xml()
codes = sorted(result.keys())

result_source_file = source_header
result_header_file = header_header

result_source_file += "dp_plural_rules_func dp_plural_rules_for_lang(const char *lang_code) {\n"
for code in codes:
    cond_str = '\tif (strncmp(lang_code, "' + code + '", ' + str(len(code)) + ') == 0) return dp_plural_rules_' + code + ';\n'
    result_source_file += cond_str

result_source_file += "\treturn NULL;\n}\n\n"

for code in codes:
    (decl, impl) = generate_source(result[code], code)
    result_source_file += (impl + '\n')
    result_header_file += (decl + '\n')

src_file = open("dp_gen_plural.h", "w")
src_file.write(result_header_file)
src_file.close()

src_file = open("dp_gen_plural.c", "w")
src_file.write(result_source_file)
src_file.close()
