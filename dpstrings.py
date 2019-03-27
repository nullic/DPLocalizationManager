import io
import argparse
import codecs
import os
import re

class DPStringExtractor:
    pattern_src_1 = re.compile("(?<=DPLocalizedString\(@\").*?(?=\")")
    pattern_src_2 = re.compile(".*?\.autolocalizationKey\s*=\s*@?\"(.*?)\"")
    pattern_src_3 = re.compile("\[.*?\ssetAutolocalizationKey:\s*@\"(.*?)\"\]")
    pattern_src_4 = re.compile(".*?\sautolocalizationKey\s*=\s*@?\"(.*?)\"")
    pattern_src_5 = re.compile("(?<=DPLocalizedString\(\").*?(?=\")")

    pattern_xib_1 = re.compile(
        "<string\skey=\"keyPath\">autolocalizationKey</string>\s*<string\skey=\"value\">(.*?)</string>")
    pattern_xib_2 = re.compile(
        "<userDefinedRuntimeAttribute\stype=\"string\"\skeyPath=\"autolocalizationKey\"\svalue=\"(.*?)\"/>")

    @staticmethod
    def is_source_file(filename):
        extension = os.path.splitext(filename)[1].lower()
        return extension == ".m" or extension == ".mm" or extension == ".swift"

    @staticmethod
    def is_xib_file(filename):
        extension = os.path.splitext(filename)[1].lower()
        return extension == ".xib" or extension == ".storyboard"

    def __init__(self):
        self.strings_info = {}

    def add_strings(self, strings, path):
        for string in strings:
            if not self.strings_info.has_key(string):
                self.strings_info[string] = []
            self.strings_info[string].append(path)

    def extract_strings(self, path, patterns):
        all_results = []
        text = codecs.open(path, encoding='utf-8').read()
        for pattern in patterns:
            result = pattern.findall(text)
            if len(result):
                all_results.extend(result)
        self.add_strings(all_results, path)

    def scan_dir(self, dir_path):
        files = os.listdir(dir_path)

        for filename in files:
            full_path = os.path.join(dir_path, filename)
            if os.path.isfile(full_path):
                patterns = None
                if DPStringExtractor.is_source_file(filename):
                    patterns = [self.pattern_src_1, self.pattern_src_2, self.pattern_src_3, self.pattern_src_4, self.pattern_src_5]
                elif DPStringExtractor.is_xib_file(filename):
                    patterns = [self.pattern_xib_1, self.pattern_xib_2]

                if patterns is not None:
                    self.extract_strings(full_path, patterns)
            else:
                self.scan_dir(full_path)

        return self.strings_info


class DPLocalizableStringsParser:
    localizable_str_1 = re.compile("\"(.*?)\"\s*=\s*\"(.*?)\";")

    @staticmethod
    def is_strings_file(filename):
        return filename == "Localizable.strings"
        #extension = os.path.splitext(filename)[1].lower()
        #return extension == ".strings"

    def __init__(self):
        self.strings_info = {}

    def extract_strings(self, path, patterns, nil=None):
        locale_pattern = re.compile("(?<=/)[a-zA-Z_]*(?=\.lproj/)")
        locale = locale_pattern.findall(path)[0]

        try:
            text = io.open(path, 'r', encoding = 'utf-8').read()
        except UnicodeDecodeError:
            text = None

        if text == None:
            try:
                text = io.open(path, 'r', encoding = 'utf-16').read()
            except UnicodeError:
                text = None
                print u"WARNING: File \"{0}\" contains non UTF-8/UTF-16 characters, and will be ignored".format(path)

        if text != None:
            for pattern in patterns:
                result = pattern.findall(text)
                for kv_tuple in result:
                    if len(kv_tuple) == 2:
                        key, value = kv_tuple

                        if not self.strings_info.has_key(key):
                            self.strings_info[key] = {}

                        if not self.strings_info[key].has_key(locale):
                            self.strings_info[key][locale] = value
                        else:
                            print u"WARNING: Duplicate key: \"{0} in file \"{1}\"".format(key, path)




    def scan_dir(self, dir_path):
        files = os.listdir(dir_path)

        for filename in files:
            full_path = os.path.join(dir_path, filename)
            if os.path.isfile(full_path):
                patterns = None
                if DPLocalizableStringsParser.is_strings_file(filename):
                    patterns = [self.localizable_str_1]
                if patterns is not None:
                    self.extract_strings(full_path, patterns)
            else:
                self.scan_dir(full_path)

        return self.strings_info


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='''Usage example: dpstrings.py -p "./Project" -l "en;ru;"''')
    parser.add_argument("-l", help='''List of localizations (i.e. ru, en, fr, de) separated by ';'. Default value is "en"''', default="en")
    parser.add_argument("-p", help='''Search path. Default value is "./"''', default="./")
    args = parser.parse_args()

    search_path = args.p
    locales = set()
    for loc in args.l.split(";"):
        loc = loc.strip()
        if len(loc):
            locales.add(loc)

    used_strings = DPStringExtractor().scan_dir(search_path)
    local_strings = DPLocalizableStringsParser().scan_dir(search_path)

    sorted_keys = sorted(local_strings)
    sorted_used_strings = sorted(used_strings)

    for key in sorted_keys:
        string_info = local_strings[key]
        string_locales = string_info.keys()
        if not locales.issubset(string_locales):
            print u"WARNING: Not enough localizations for key: {0}. Exist locales: {1}".format(key, string_info.keys())

    for key in sorted_keys:
        if not used_strings.has_key(key):
            print u"WARNING: Not used key: \"{0}\"".format(key)

    for key in sorted_used_strings:
        if not local_strings.has_key(key):
            paths = u"; ".join(set(used_strings[key]))
            print u"WARNING: No localization for key: \"{0}\" in {1}".format(key, paths)
