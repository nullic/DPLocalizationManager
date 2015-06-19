//
//  NSAttributedString+DPLocalization.m
//  DP Commons
//
//  Created by dmitriy.petrusevich on 03.11.14.
//  Copyright (c) 2014 Dmitriy Petrusevich. All rights reserved.
//

#import "NSAttributedString+DPLocalization.h"

@implementation NSAttributedString (DPLocalization)

+ (NSAttributedString *)dp_attibutedStringWithString:(NSString *)string font:(DPFont *)font textColor:(DPColor *)textColor {
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

+ (NSDictionary *)stylesFromSting:(NSString *)styleString font:(DPFont *)font {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];

    static NSRegularExpression *nameExp = nil;
    static NSRegularExpression *colorExp = nil;
    static NSRegularExpression *sizeExp = nil;
    static NSRegularExpression *traitsExp = nil;
    static NSRegularExpression *linkExp = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        nameExp = [NSRegularExpression regularExpressionWithPattern:@"name=\"(.+?)\"" options:NSRegularExpressionCaseInsensitive error:nil];
        colorExp = [NSRegularExpression regularExpressionWithPattern:@"color=([0-9]{1,3}),([0-9]{1,3}),([0-9]{1,3})(,[0-9]{1,3})?" options:NSRegularExpressionCaseInsensitive error:nil];
        traitsExp = [NSRegularExpression regularExpressionWithPattern:@"traits=([!buis]+)" options:NSRegularExpressionCaseInsensitive error:nil];
        sizeExp = [NSRegularExpression regularExpressionWithPattern:@"size=([0-9.]+)" options:NSRegularExpressionCaseInsensitive error:nil];
        linkExp = [NSRegularExpression regularExpressionWithPattern:@"link=\"(.+?)\"" options:NSRegularExpressionCaseInsensitive error:nil];
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
        [attrs setValue:[DPColor colorWithRed:r green:g blue:b alpha:a] forKey:NSForegroundColorAttributeName];
    }

    DPFont *styleFont = font ? [DPFont fontWithName:fontName size:fontSize] : nil;

#if DPLocalization_UIKit
    if (NSFoundationVersionNumber < NSFoundationVersionNumber_iOS_7_0) {
        [attrs setValue:styleFont forKey:NSFontAttributeName];

        NSTextCheckingResult *traitsCheck = [traitsExp firstMatchInString:styleString options:kNilOptions range:allStringRange];
        if (traitsCheck) {
            NSString *traitsString = [styleString substringWithRange:[traitsCheck rangeAtIndex:1]];
            if ([traitsString rangeOfString:@"u"].location != NSNotFound) [attrs setValue:@(NSUnderlineStyleSingle) forKey:NSUnderlineStyleAttributeName];
            if ([traitsString rangeOfString:@"s"].location != NSNotFound) [attrs setValue:@(NSUnderlineStyleSingle) forKey:NSStrikethroughStyleAttributeName];

            // Not used - will be useful in futher releases
            if ([traitsString rangeOfString:@"!u"].location != NSNotFound) [attrs setValue:@(NSUnderlineStyleNone) forKey:NSUnderlineStyleAttributeName];
            if ([traitsString rangeOfString:@"!s"].location != NSNotFound) [attrs setValue:@(NSUnderlineStyleNone) forKey:NSStrikethroughStyleAttributeName];
        }
    }
    else
#endif
    {
        NSTextCheckingResult *linkCheck = [linkExp firstMatchInString:styleString options:kNilOptions range:allStringRange];
        if (linkCheck) {
            NSString *link = [styleString substringWithRange:[linkCheck rangeAtIndex:1]];
            NSURL *url = [NSURL URLWithString:link];
            [attrs setValue:url ? url : link forKey:NSLinkAttributeName];
        }

        NSTextCheckingResult *traitsCheck = [traitsExp firstMatchInString:styleString options:kNilOptions range:allStringRange];
        if (traitsCheck) {
            NSString *traitsString = [styleString substringWithRange:[traitsCheck rangeAtIndex:1]];
            DPFontSymbolicTraits traits = [[styleFont fontDescriptor] symbolicTraits];

            if ([traitsString rangeOfString:@"b"].location != NSNotFound) traits |= DPFontTraitBold;
            if ([traitsString rangeOfString:@"i"].location != NSNotFound) traits |= DPFontTraitItalic;
            if ([traitsString rangeOfString:@"!b"].location != NSNotFound) traits &= (~DPFontTraitBold);
            if ([traitsString rangeOfString:@"!i"].location != NSNotFound) traits &= (~DPFontTraitItalic);

            if ([traitsString rangeOfString:@"u"].location != NSNotFound) [attrs setValue:@(NSUnderlineStyleSingle) forKey:NSUnderlineStyleAttributeName];
            if ([traitsString rangeOfString:@"s"].location != NSNotFound) [attrs setValue:@(NSUnderlineStyleSingle) forKey:NSStrikethroughStyleAttributeName];

            // Not used - will be useful in futher releases
            if ([traitsString rangeOfString:@"!u"].location != NSNotFound) [attrs setValue:@(NSUnderlineStyleNone) forKey:NSUnderlineStyleAttributeName];
            if ([traitsString rangeOfString:@"!s"].location != NSNotFound) [attrs setValue:@(NSUnderlineStyleNone) forKey:NSStrikethroughStyleAttributeName];

            DPFontDescriptor *fontDescriptor = [[styleFont fontDescriptor] fontDescriptorWithSymbolicTraits:traits];
            [attrs setValue:[DPFont fontWithDescriptor:fontDescriptor size:fontSize] forKey:NSFontAttributeName];
        }
        else {
            [attrs setValue:styleFont forKey:NSFontAttributeName];
        }
    }

    return attrs;
}

@end
