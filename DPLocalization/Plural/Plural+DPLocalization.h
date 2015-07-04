//
//  Plural+DPLocalization.h
//  DP Commons
//
//  Created by Dmitriy Petrusevich on 25/06/15.
//  Copyright (c) 2015 Dmitriy Petrusevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPFormattedValue.h"
#import "dp_gen_plural.h"


NSString *dp_key_from_pluralrule(enum DPPluralRule rule);
dp_plural_rules_func dp_plural_rules_for_lang_code(NSString *lang_code);


@interface NSNumber (DPLocalization_Plural)
- (enum DPPluralRule)pluralRuleWithLanguage:(NSString *)language;
- (enum DPPluralRule)pluralRuleWithRules:(dp_plural_rules_func)rules;
@end

@interface DPFormattedValue (DPLocalization_Plural)
- (enum DPPluralRule)pluralRuleWithLanguage:(NSString *)language;
- (enum DPPluralRule)pluralRuleWithRules:(dp_plural_rules_func)rules;
@end
