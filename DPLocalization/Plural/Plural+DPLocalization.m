//
//  Plural+DPLocalization.m
//  LocalizationDemo
//
//  Created by Dmitriy Petrusevich on 25/06/15.
//  Copyright (c) 2015 Dmitriy Petrusevich. All rights reserved.
//

#import "Plural+DPLocalization.h"

NSString *dp_key_from_pluralrule(enum DPPluralRule rule) {
    NSString *result = nil;
    
    switch (rule) {
        case DPPluralRuleUnknown:
            result = @"other";
            break;

        case DPPluralRuleZero:
            result = @"zero";
            break;
        case DPPluralRuleOne:
            result = @"one";
            break;
        case DPPluralRuleTwo:
            result = @"two";
            break;
        case DPPluralRuleFew:
            result = @"few";
            break;
        case DPPluralRuleMany:
            result = @"many";
            break;
        case DPPluralRuleOther:
            result = @"other";
            break;
    }

    return result;
}

dp_plural_rules_func dp_plural_rules_for_lang_code(NSString *lang_code) {
    dp_plural_rules_func ptr = dp_plural_rules_for_lang([lang_code UTF8String]);
    if (ptr == NULL) {
        NSRange sym_range = [lang_code rangeOfString:@"_"];
        if (sym_range.location != NSNotFound) {
            NSString *code = [lang_code substringToIndex:sym_range.location];
            ptr = dp_plural_rules_for_lang([code UTF8String]);
        }
    }
    
    return ptr ? ptr : dp_plural_rules_always_other;
}

#pragma mark -

@implementation NSNumber (DPLocalization_Plural)

- (enum DPPluralRule)pluralRuleWithLanguage:(NSString *)language {
    int value = ABS([self intValue]);
    dp_plural_rules_func func = dp_plural_rules_for_lang_code(language);
    return func(value, value, 0, 0, 0, 0);
}

- (enum DPPluralRule)pluralRuleWithRules:(dp_plural_rules_func)rules {
    int value = ABS([self intValue]);
    return rules(value, value, 0, 0, 0, 0);
}

@end
