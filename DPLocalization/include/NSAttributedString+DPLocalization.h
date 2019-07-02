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
+ (NSAttributedString *_Nullable)dp_attibutedStringWithString:(NSString *_Nullable)string font:(DPFont *_Nullable)font textColor:(DPColor *_Nullable)textColor;
+ (NSAttributedString *_Nullable)dp_attibutedStringWithString:(NSString *_Nullable)string font:(DPFont *_Nullable)font textColor:(DPColor *_Nullable)textColor paragraphStyle:(NSParagraphStyle *_Nullable)paragraphStyle;
@end
