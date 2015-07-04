//
//  Plural+DPLocalization.m
//  DP Commons
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

#pragma mark - NSNumber

@implementation NSNumber (DPLocalization_Plural)

- (enum DPPluralRule)pluralRuleWithLanguage:(NSString *)language {
    dp_plural_rules_func func = dp_plural_rules_for_lang_code(language);
    return [self pluralRuleWithRules:func];
}

- (enum DPPluralRule)pluralRuleWithRules:(dp_plural_rules_func)rules {
    double n = ABS([self doubleValue]);
    int i = (int)n;
    return rules(n, i, 0, 0, 0, 0);
}

@end

#pragma mark - DPFormattedValue

@implementation DPFormattedValue (DPLocalization_Plural)

- (enum DPPluralRule)pluralRuleWithLanguage:(NSString *)language {
    dp_plural_rules_func func = dp_plural_rules_for_lang_code(language);
    return [self pluralRuleWithRules:func];
}

- (enum DPPluralRule)pluralRuleWithRules:(dp_plural_rules_func)rules {
    enum DPPluralRule result = DPPluralRuleUnknown;

    if ([[self value] isKindOfClass:[NSNumber class]]) {
        NSNumber *value = [self value];

        if ([[self formatter] isKindOfClass:[NSNumberFormatter class]]) {
            NSNumberFormatter *formatter = (NSNumberFormatter *)[self formatter];
            NSString *strValue = [self description];
            NSString *decimalSeparator = [formatter decimalSeparator];
            
            double n = ABS([value doubleValue]);
            int i = (int)n;
            int v = 0, w = 0, f = 0, t = 0;
            
            NSRange separatorRange = [strValue rangeOfString:decimalSeparator];
            if (separatorRange.location != NSNotFound) {
                NSUInteger startPosition = separatorRange.location + separatorRange.length;
                NSUInteger endPosition = startPosition;
                
                for (; endPosition < strValue.length; endPosition++) {
                    unichar ch = [strValue characterAtIndex:endPosition];
                    if (ch < '0' || ch > '9') {
                        break;
                    }
                }
                
                v = (int)(endPosition - startPosition);
                NSString *fractionalPart = [strValue substringWithRange:NSMakeRange(startPosition, v)];
                f = [fractionalPart intValue];
                
                NSInteger lastNonZeroCharacterIndex = (fractionalPart.length - 1);
                for (; lastNonZeroCharacterIndex >= 0; lastNonZeroCharacterIndex--) {
                    if ([fractionalPart characterAtIndex:lastNonZeroCharacterIndex] != '0') {
                        break;
                    }
                }
                
                NSString *fractionalPartWithoutZeros = [fractionalPart substringToIndex:(lastNonZeroCharacterIndex + 1)];
                w = (int)[fractionalPartWithoutZeros length];
                t = [fractionalPartWithoutZeros intValue];
            }
            
            
            return rules(n, i, v, w, f, t);
        }
        else {
            result = [value pluralRuleWithRules:rules];
        }
    }

    return result;
}

@end
