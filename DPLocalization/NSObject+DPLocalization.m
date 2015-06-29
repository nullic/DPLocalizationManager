//
//  NSObject+DPLocalization.m
//  DP Commons
//
//  Created by dmitriy.petrusevich on 21.08.13.
//  Copyright (c) 2013 Dmitriy Petrusevich. All rights reserved.
//

#import "NSObject+DPLocalization.h"
#import "NSAttributedString+DPLocalization.h"
#import "DPLocalizationManager.h"
#import <objc/runtime.h>

static NSString * const kAutolocKeyPathKey = @"autolocKeyPathKey";
static NSString * const kAutolocKeyKey = @"autolocKeyKey";
static NSString * const kAutolocImageNameKey = @"autolocImageNameKey";
static NSString * const kAutolocArgsKey = @"autolocArgsKey";
static NSString * const kAutolocOnDeallocBlockKey = @"autolocOnDeallocBlockKey";
static NSString * const kAutolocAttributedFlagKey = @"autolocAttributedFlag";


@interface __AutolocOnDeallocContainer__ : NSObject
@property (nonatomic, copy) void(^deallocBlock)();
@end

@implementation __AutolocOnDeallocContainer__

- (id)initWithBlock:(void(^)())block {
    self = [super init];
    if (self) {
        self.deallocBlock = block;
    }
    return self;
}

- (void)dealloc {
    if (self.deallocBlock) {
        self.deallocBlock();
    }
}

@end


@implementation NSObject (DPLocalization)

#pragma mark - Setup

- (void)setupAutolocalizationWithKey:(NSString *)key keyPath:(NSString *)keyPath {
    [self setupAutolocalizationWithKey:key keyPath:keyPath arguments:nil];
}

- (void)setupAutolocalizationWithKey:(NSString *)key keyPath:(NSString *)keyPath arguments:(NSArray *)arguments {
    if (key == nil) {
        if (self.autolocKeyPath) {
            [self setValue:nil forKeyPath:self.autolocKeyPath];
        }
        else if (keyPath) {
            [self setValue:nil forKeyPath:keyPath];
        }
        [self removeAutolocalization];
    }
    else {
        NSParameterAssert(key != nil);
        NSParameterAssert(keyPath != nil);

        [self addLanguageDidChangeObserver];

        self.autolocKey = key;
        self.autolocKeyPath = keyPath;
        self.autolocArgs = arguments;
        [self localize];
    }
}

- (void)removeAutolocalization {
    [self removeLanguageDidChangeObserver];
    self.autolocKey = nil;
    self.autolocKeyPath = nil;
    self.autolocArgs = nil;
}

- (BOOL)isAutolocalizationEnabled {
    return (self.autolocKey && self.autolocKeyPath);
}

- (void)updateAutolocalizationArguments:(NSArray *)arguments {
    self.autolocArgs = arguments;
    [self localize];
}

#pragma mark - Observation

- (void)addLanguageDidChangeObserver {
    void (^deallocBlock)() = objc_getAssociatedObject(self, (__bridge const void *)(kAutolocOnDeallocBlockKey));
    if (!deallocBlock) {
        NSObject * __unsafe_unretained selfWeak = self;
        id observer = [[NSNotificationCenter defaultCenter] addObserverForName:DPLanguageDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
            __strong NSObject *selfStrong = selfWeak;
            [selfStrong localize];
        }];

        __AutolocOnDeallocContainer__ *action = [[__AutolocOnDeallocContainer__ alloc] initWithBlock:^{
            [[NSNotificationCenter defaultCenter] removeObserver:observer];
        }];
        objc_setAssociatedObject(self, (__bridge void *)(kAutolocOnDeallocBlockKey), action, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)removeLanguageDidChangeObserver {
    objc_setAssociatedObject(self, (__bridge void *)(kAutolocOnDeallocBlockKey), nil, 0);
}

#pragma mark - Localization flow

- (void)localize {
    if (self.autolocKey && self.autolocKeyPath) {
        [self localizeWithLocalizationKey:self.autolocKey arguments:self.autolocArgs keyPath:self.autolocKeyPath];
    }
}

- (void)localizeWithLocalizationKey:(NSString *)key arguments:(NSArray *)arguments keyPath:(NSString *)keyPath {
    NSString *resultString = [[DPLocalizationManager currentManager] localizedStringForKey:key table:nil arguments:arguments];
    [self setLocalizedValue:resultString forKeyPath:keyPath];
}

- (void)setLocalizedValue:(NSString *)value forKeyPath:(NSString *)keyPath {
    [self setValue:value forKeyPath:keyPath];
}

#pragma mark - Access Keys

- (void)setAutolocKey:(NSString *)key {
    objc_setAssociatedObject(self, (__bridge void *)(kAutolocKeyKey), key, OBJC_ASSOCIATION_COPY);
}

- (NSString *)autolocKey {
    return objc_getAssociatedObject(self, (__bridge const void *)(kAutolocKeyKey));
}

- (void)setAutolocKeyPath:(NSString *)keyPath {
    objc_setAssociatedObject(self, (__bridge void *)(kAutolocKeyPathKey), keyPath, OBJC_ASSOCIATION_COPY);
}

- (NSString *)autolocKeyPath {
    return objc_getAssociatedObject(self, (__bridge const void *)(kAutolocKeyPathKey));
}

- (void)setAutolocArgs:(NSArray *)args {
    objc_setAssociatedObject(self, (__bridge void *)(kAutolocArgsKey), args, OBJC_ASSOCIATION_COPY);
}

- (NSArray *)autolocArgs {
    return objc_getAssociatedObject(self, (__bridge const void *)(kAutolocArgsKey));
}

@end

#if DPLocalization_UIKit
#pragma mark - UIKit Additions -
#pragma mark UILabel

@implementation UILabel (DPLocalization)

- (void)setIsAttributedKey:(BOOL)isAttributedKey {
    objc_setAssociatedObject(self, (__bridge void *)(kAutolocAttributedFlagKey), @(isAttributedKey), OBJC_ASSOCIATION_RETAIN);
    [self localize];
}

- (BOOL)isAttributedKey {
    return [objc_getAssociatedObject(self, (__bridge const void *)(kAutolocAttributedFlagKey)) boolValue];
}

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"text"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

- (void)setLocalizedValue:(id)value forKeyPath:(NSString *)keyPath {
    if ([self isAttributedKey]) {
        self.attributedText = [NSAttributedString dp_attibutedStringWithString:value font:self.font textColor:self.textColor];
    }
    else {
        [super setLocalizedValue:value forKeyPath:keyPath];
    }
}

@end


#pragma mark UIButton

@implementation UIButton (DPLocalization)

- (void)setIsAttributedKey:(BOOL)isAttributedKey {
    objc_setAssociatedObject(self, (__bridge void *)(kAutolocAttributedFlagKey), @(isAttributedKey), OBJC_ASSOCIATION_RETAIN);
    [self localize];
}

- (BOOL)isAttributedKey {
    return [objc_getAssociatedObject(self, (__bridge const void *)(kAutolocAttributedFlagKey)) boolValue];
}

- (void)setAutolocalizationTitle:(NSString *)title {
    if ([self isAttributedKey]) {
        NSAttributedString *string = [NSAttributedString dp_attibutedStringWithString:title font:self.titleLabel.font textColor:[self titleColorForState:UIControlStateNormal]];
        [self setAttributedTitle:string forState:UIControlStateNormal];
    }
    else {
        [self setTitle:title forState:UIControlStateNormal];
    }
}

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"autolocalizationTitle"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

@end


#pragma mark UIBarItem

@implementation UIBarItem (DPLocalization)

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"title"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

@end


#pragma mark UITextField

@implementation UITextField (DPLocalization)

- (void)setIsAttributedKey:(BOOL)isAttributedKey {
    objc_setAssociatedObject(self, (__bridge void *)(kAutolocAttributedFlagKey), @(isAttributedKey), OBJC_ASSOCIATION_RETAIN);
    [self localize];
}

- (BOOL)isAttributedKey {
    return [objc_getAssociatedObject(self, (__bridge const void *)(kAutolocAttributedFlagKey)) boolValue];
}

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"placeholder"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

- (void)setLocalizedValue:(id)value forKeyPath:(NSString *)keyPath {
    if ([self isAttributedKey]) {
        self.attributedPlaceholder = [NSAttributedString dp_attibutedStringWithString:value font:self.font textColor:self.textColor];
    }
    else {
        [super setLocalizedValue:value forKeyPath:keyPath];
    }
}

@end


#pragma mark UITextView

@implementation UITextView (DPLocalization)

- (void)setIsAttributedKey:(BOOL)isAttributedKey {
    objc_setAssociatedObject(self, (__bridge void *)(kAutolocAttributedFlagKey), @(isAttributedKey), OBJC_ASSOCIATION_RETAIN);
    [self localize];
}

- (BOOL)isAttributedKey {
    return [objc_getAssociatedObject(self, (__bridge const void *)(kAutolocAttributedFlagKey)) boolValue];
}

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"text"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

- (void)setLocalizedValue:(id)value forKeyPath:(NSString *)keyPath {
    if ([self isAttributedKey]) {
        NSMutableAttributedString *attrStr = [[NSAttributedString dp_attibutedStringWithString:value font:self.font textColor:self.textColor] mutableCopy];

        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.alignment = self.textAlignment;
        [attrStr addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, attrStr.length)];

        self.attributedText = attrStr;
    }
    else {
        [super setLocalizedValue:value forKeyPath:keyPath];
    }
}

@end


#pragma mark UISearchBar

@implementation UISearchBar (DPLocalization)

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"placeholder"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

@end


#pragma mark UIImageView

@implementation UIImageView (DPLocalization)

- (void)setAutolocalizationImageName:(NSString *)name {
    objc_setAssociatedObject(self, (__bridge void *)(kAutolocImageNameKey), name, OBJC_ASSOCIATION_COPY);
    if ([name length]) {
        [self addLanguageDidChangeObserver];
        [self localize];
    }
    else {
        [self removeLanguageDidChangeObserver];
    }
}

- (NSString *)autolocalizationImageName {
    return objc_getAssociatedObject(self, (__bridge const void *)(kAutolocImageNameKey));
}

- (void)localize {
    if (self.autolocalizationImageName) {
        [self setImage:[UIImage localizedImageNamed:self.autolocalizationImageName]];
    }
}

@end


#pragma mark UIViewController

@implementation UIViewController (DPLocalization)

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"title"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

@end

#endif


#if DPLocalization_AppKit
#pragma mark - AppKit Additions -
#pragma mark NSMenuItem

@implementation NSMenuItem (DPLocalization)

- (void)setIsAttributedKey:(BOOL)isAttributedKey {
    objc_setAssociatedObject(self, (__bridge void *)(kAutolocAttributedFlagKey), @(isAttributedKey), OBJC_ASSOCIATION_RETAIN);
    [self localize];
}

- (BOOL)isAttributedKey {
    return [objc_getAssociatedObject(self, (__bridge const void *)(kAutolocAttributedFlagKey)) boolValue];
}

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"title"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

- (void)setLocalizedValue:(id)value forKeyPath:(NSString *)keyPath {
    if ([self isAttributedKey]) {
        self.attributedTitle = [NSAttributedString dp_attibutedStringWithString:value font:[NSFont menuBarFontOfSize:0] textColor:nil];
    }
    else {
        [super setLocalizedValue:value forKeyPath:keyPath];
    }
}

@end


#pragma mark NSMenu

@implementation NSMenu (DPLocalization)

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"title"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

@end


#pragma mark NSButton

@implementation NSButton (DPLocalization)

- (void)setIsAttributedKey:(BOOL)isAttributedKey {
    objc_setAssociatedObject(self, (__bridge void *)(kAutolocAttributedFlagKey), @(isAttributedKey), OBJC_ASSOCIATION_RETAIN);
    [self localize];
}

- (BOOL)isAttributedKey {
    return [objc_getAssociatedObject(self, (__bridge const void *)(kAutolocAttributedFlagKey)) boolValue];
}

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"title"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

- (void)setLocalizedValue:(id)value forKeyPath:(NSString *)keyPath {
    if ([self isAttributedKey]) {
        self.attributedTitle = [NSAttributedString dp_attibutedStringWithString:value font:self.font textColor:nil];
    }
    else {
        [super setLocalizedValue:value forKeyPath:keyPath];
    }
}

@end


#pragma mark NSControl

@implementation NSControl (DPLocalization)

- (void)setIsAttributedKey:(BOOL)isAttributedKey {
    objc_setAssociatedObject(self, (__bridge void *)(kAutolocAttributedFlagKey), @(isAttributedKey), OBJC_ASSOCIATION_RETAIN);
    [self localize];
}

- (BOOL)isAttributedKey {
    return [objc_getAssociatedObject(self, (__bridge const void *)(kAutolocAttributedFlagKey)) boolValue];
}

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"stringValue"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

- (void)setLocalizedValue:(id)value forKeyPath:(NSString *)keyPath {
    if ([self isAttributedKey]) {
        self.attributedStringValue = [NSAttributedString dp_attibutedStringWithString:value font:self.font textColor:nil];
    }
    else {
        [super setLocalizedValue:value forKeyPath:keyPath];
    }
}

@end


#pragma mark NSTextField

@implementation NSTextField (DPLocalization)

- (void)setPlaceholderAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"placeholderString"];
}

- (NSString *)placeholderAutolocalizationKey {
    return [self autolocKey];
}

- (void)setLocalizedValue:(id)value forKeyPath:(NSString *)keyPath {
    if ([keyPath isEqualToString:@"stringValue"] && [self isAttributedKey]) {
        self.attributedStringValue = [NSAttributedString dp_attibutedStringWithString:value font:self.font textColor:self.textColor];
    }
    else if ([keyPath isEqualToString:@"placeholderString"] && [self isAttributedKey]) {
        self.placeholderAttributedString = [NSAttributedString dp_attibutedStringWithString:value font:self.font textColor:self.textColor];
    }
    else {
        [super setLocalizedValue:value forKeyPath:keyPath];
    }
}

@end


#pragma mark NSText

@implementation NSText (DPLocalization)

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"string"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}
@end


#pragma mark NSWindow

@implementation NSWindow (DPLocalization)

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"title"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

@end


#pragma mark NSImageView

@implementation NSImageView (DPLocalization)

- (void)setAutolocalizationImageName:(NSString *)name {
    objc_setAssociatedObject(self, (__bridge void *)(kAutolocImageNameKey), name, OBJC_ASSOCIATION_COPY);
    if ([name length]) {
        [self addLanguageDidChangeObserver];
        [self localize];
    }
    else {
        [self removeLanguageDidChangeObserver];
    }
}

- (NSString *)autolocalizationImageName {
    return objc_getAssociatedObject(self, (__bridge const void *)(kAutolocImageNameKey));
}

- (void)localize {
    if (self.autolocalizationImageName) {
        [self setImage:[NSImage localizedImageNamed:self.autolocalizationImageName]];
    }
}

@end

#endif


#pragma mark - Core Foundation Additions -
#pragma mark NSBundle

@implementation NSBundle (DPLocalization)

- (NSString *)localizedPathForResource:(NSString *)name ofType:(NSString *)ext {
    return [[DPLocalizationManager currentManager] localizedPathForResource:name ofType:ext bundle:self];
}

- (NSString *)autolocalizingPathForResource:(NSString *)name ofType:(NSString *)extension {
    return [DPAutolocalizationProxy autolocalizingPathForResource:name ofType:extension inBundle:self];
}

@end


#pragma mark NSString

@implementation NSString (DPLocalization)

+ (NSString *)autolocalizingStringWithLocalizationKey:(NSString *)localizationKey {
    return [DPAutolocalizationProxy autolocalizingStringWithLocalizationKey:localizationKey];
}

@end


#pragma mark UIImage / NSImage

@implementation DPImage (DPLocalization)

+ (DPImage *)localizedImageNamed:(NSString *)name {
    return [[DPLocalizationManager currentManager] localizedImageNamed:name];
}

+ (DPImage *)autolocalizingImageNamed:(NSString *)name {
    return [DPAutolocalizationProxy autolocalizingImageNamed:name];
}

@end
