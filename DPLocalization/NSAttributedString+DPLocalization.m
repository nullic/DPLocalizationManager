//
//  NSAttributedString+DPLocalization.m
//  DP Commons
//
//  Created by dmitriy.petrusevich on 03.11.14.
//  Copyright (c) 2014 Dmitriy Petrusevich. All rights reserved.
//

#import "NSAttributedString+DPLocalization.h"

@implementation NSAttributedString (DPLocalization)

+ (NSAttributedString *)dp_attibutedStringWithString:(NSString *)string font:(UIFont *)font textColor:(UIColor *)textColor {
    NSMutableAttributedString *attrsString = nil;

    if (string) {
        NSRegularExpression *tagRegExp = [NSRegularExpression regularExpressionWithPattern:@"<([^<]*?)>\\{(.*?)\\}" options:NSRegularExpressionDotMatchesLineSeparators error:nil];
        NSArray *tags = [tagRegExp matchesInString:string options:kNilOptions range:NSMakeRange(0, string.length)];

        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        [attrs setValue:font forKey:NSFontAttributeName];
        [attrs setValue:textColor forKey:NSForegroundColorAttributeName];

        attrsString = [[NSMutableAttributedString alloc] initWithString:string attributes:attrs];

        [tags enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSTextCheckingResult *match, NSUInteger idx, BOOL *stop) {

            NSString *textString = [string substringWithRange:[match rangeAtIndex:2]];
            NSString *styleString = [string substringWithRange:[match rangeAtIndex:1]];

            NSMutableDictionary *tagAttrs = [attrs mutableCopy];
            [tagAttrs setValuesForKeysWithDictionary:[self stylesFromSting:styleString font:font]];

            NSAttributedString *replaceString = [[NSAttributedString alloc] initWithString:textString attributes:tagAttrs];
            [attrsString replaceCharactersInRange:match.range withAttributedString:replaceString];
        }];
    }
    
    return attrsString;
}

+ (NSDictionary *)stylesFromSting:(NSString *)styleString font:(UIFont *)font {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];

    static NSRegularExpression *nameExp = nil;
    static NSRegularExpression *colorExp = nil;
    static NSRegularExpression *sizeExp = nil;
    static NSRegularExpression *traitsExp = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        nameExp = [NSRegularExpression regularExpressionWithPattern:@"name=\"(.+?)\"" options:NSRegularExpressionCaseInsensitive error:nil];
        colorExp = [NSRegularExpression regularExpressionWithPattern:@"color=([0-9]{1,3}),([0-9]{1,3}),([0-9]{1,3})(,[0-9]{1,3})?" options:NSRegularExpressionCaseInsensitive error:nil];
        traitsExp = [NSRegularExpression regularExpressionWithPattern:@"traits=([buis]+)" options:NSRegularExpressionCaseInsensitive error:nil];
        sizeExp = [NSRegularExpression regularExpressionWithPattern:@"size=([0-9.]+)" options:NSRegularExpressionCaseInsensitive error:nil];
    });

    NSRange allStringRange = NSMakeRange(0, styleString.length);

    NSString *fontName = font.fontName;
    CGFloat fontSize = font.pointSize;

    NSTextCheckingResult *sizeCheck = [sizeExp firstMatchInString:styleString options:kNilOptions range:allStringRange];
    if (sizeCheck) fontSize = [[styleString substringWithRange:[sizeCheck rangeAtIndex:1]] floatValue];

    NSTextCheckingResult *nameCheck = [nameExp firstMatchInString:styleString options:kNilOptions range:allStringRange];
    if (nameCheck) fontName = [styleString substringWithRange:[nameCheck rangeAtIndex:1]];

    NSTextCheckingResult *colorCheck = [colorExp firstMatchInString:styleString options:kNilOptions range:allStringRange];
    if (colorCheck) {
        CGFloat r = [[styleString substringWithRange:[colorCheck rangeAtIndex:1]] floatValue] / 255.0;
        CGFloat g = [[styleString substringWithRange:[colorCheck rangeAtIndex:2]] floatValue] / 255.0;
        CGFloat b = [[styleString substringWithRange:[colorCheck rangeAtIndex:3]] floatValue] / 255.0;
        CGFloat a = ([colorCheck rangeAtIndex:4].location != NSNotFound) ? ([[[styleString substringWithRange:[colorCheck rangeAtIndex:4]] substringFromIndex:1] floatValue] / 255.0) : 1.0;
        [attrs setValue:[UIColor colorWithRed:r green:g blue:b alpha:a] forKey:NSForegroundColorAttributeName];
    }

    UIFont *styleFont = [UIFont fontWithName:fontName size:fontSize];
    if (NSFoundationVersionNumber < NSFoundationVersionNumber_iOS_7_0) {
        [attrs setValue:styleFont forKey:NSFontAttributeName];
    }
    else {
        NSTextCheckingResult *traitsCheck = [traitsExp firstMatchInString:styleString options:kNilOptions range:allStringRange];
        if (traitsCheck) {
            NSString *traitsString = [styleString substringWithRange:[traitsCheck rangeAtIndex:1]];
            UIFontDescriptorSymbolicTraits traits = [[styleFont fontDescriptor] symbolicTraits];

            if ([traitsString rangeOfString:@"b"].location != NSNotFound) traits |= UIFontDescriptorTraitBold;
            if ([traitsString rangeOfString:@"u"].location != NSNotFound) [attrs setValue:@YES forKey:NSUnderlineStyleAttributeName];
            if ([traitsString rangeOfString:@"i"].location != NSNotFound) traits |= UIFontDescriptorTraitItalic;
            if ([traitsString rangeOfString:@"s"].location != NSNotFound) [attrs setValue:@YES forKey:NSStrikethroughStyleAttributeName];

            UIFontDescriptor *fontDescriptor = [[styleFont fontDescriptor] fontDescriptorWithSymbolicTraits:traits];
            [attrs setValue:[UIFont fontWithDescriptor:fontDescriptor size:fontSize] forKey:NSFontAttributeName];
        }
        else {
            [attrs setValue:styleFont forKey:NSFontAttributeName];
        }
    }

    return attrs;
}

@end
