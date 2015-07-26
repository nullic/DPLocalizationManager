//
//  NSAttributedString+DPLocalization.h
//  DP Commons
//
//  Created by dmitriy.petrusevich on 03.11.14.
//  Copyright (c) 2014 Dmitriy Petrusevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPLocalizationPlatforms.h"

@interface NSAttributedString (DPLocalization)
+ (NSAttributedString *)dp_attibutedStringWithString:(NSString *)string font:(DPFont *)font textColor:(DPColor *)textColor;
@end
