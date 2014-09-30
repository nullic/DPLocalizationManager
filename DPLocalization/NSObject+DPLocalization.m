//
//  NSObject+DPLocalization.m
//  DP Commons
//
//  Created by dmitriy.petrusevich on 21.08.13.
//  Copyright (c) 2013 Dmitriy Petrusevich. All rights reserved.
//

#import "NSObject+DPLocalization.h"
#import "DPLocalizationManager.h"
#import <objc/runtime.h>

static NSString * const kAutolocKeyPathKey = @"autolocKeyPathKey";
static NSString * const kAutolocKeyKey = @"autolocKeyKey";
static NSString * const kAutolocImageNameKey = @"autolocImageNameKey";
static NSString * const kAutolocArgsKey = @"autolocArgsKey";
static NSString * const kAutolocOnDeallocBlockKey = @"autolocOnDeallocBlockKey";


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

#pragma mark -

- (void)addLanguageDidChangeObserver {
    void (^deallocBlock)() = objc_getAssociatedObject(self, (__bridge const void *)(kAutolocOnDeallocBlockKey));
    if (!deallocBlock) {
        NSObject * __weak selfWeak = self;
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

#pragma mark -

- (void)localize {
    if (self.autolocKey && self.autolocKeyPath) {
        NSString *resultString = DPLocalizedString(self.autolocKey, nil);
        NSArray *args = self.autolocArgs;

        if (resultString && args.count) {
            static NSRegularExpression *regexp = nil;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                regexp = [NSRegularExpression regularExpressionWithPattern:@"%([0-9]+\\$)??@" options:kNilOptions error:nil];
            });

            NSArray *matches = [regexp matchesInString:resultString options:kNilOptions range:NSMakeRange(0, resultString.length)];
            NSMutableString *mutableStr = [resultString mutableCopy];
            [matches enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSTextCheckingResult *match, NSUInteger idx, BOOL *stop) {
                NSUInteger usedIndex = idx;
                if (match.range.length > 2) {
                    NSString *index = [resultString substringWithRange:NSMakeRange(match.range.location + 1, match.range.length - 3)];
                    usedIndex = ([index integerValue] - 1);
                }

                id subs = args.count > idx ? args[usedIndex] : nil;
                [mutableStr replaceCharactersInRange:match.range withString:[subs description]];
            }];

            resultString = mutableStr;

//            void *argList = (void *)malloc(args.count * sizeof(id));
//            [args getObjects:(id __unsafe_unretained *)argList range:NSMakeRange(0, args.count)];
//
//            resultString = [[NSString alloc] initWithFormat:resultString arguments:argList];
//            free(argList);
        }
        [self setValue:resultString forKeyPath:self.autolocKeyPath];
    }
}

#pragma mark -

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

#pragma mark - UIKit Additions -

@implementation UILabel (DPLocalization)

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"text"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

@end


@implementation UIButton (DPLocalization)

- (void)setAutolocalizationTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"autolocalizationTitle"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

@end


@implementation UIBarButtonItem (DPLocalization)

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"title"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

@end


@implementation UITextField (DPLocalization)

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"placeholder"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

@end


@implementation UITextView (DPLocalization)

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"text"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

@end


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


@implementation UIViewController (DPLocalization)

- (void)setAutolocalizationKey:(NSString *)autolocalizationKey {
    [self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"title"];
}

- (NSString *)autolocalizationKey {
    return [self autolocKey];
}

@end


@implementation UIImage (DPLocalization)

+ (UIImage *)localizedImageNamed:(NSString *)name {
    return [[DPLocalizationManager currentManager] localizedImageNamed:name];
}

+ (UIImage *)autolocalizingImageNamed:(NSString *)name {
    return [DPAutolocalizationProxy autolocalizingImageNamed:name];
}

@end

#pragma mark - Core Foundation Additions -

@implementation NSBundle (DPLocalization)

- (NSString *)localizedPathForResource:(NSString *)name ofType:(NSString *)ext {
    return [[DPLocalizationManager currentManager] localizedPathForResource:name ofType:ext bundle:self];
}

- (NSString *)autolocalizingPathForResource:(NSString *)name ofType:(NSString *)extension {
    return [DPAutolocalizationProxy autolocalizingPathForResource:name ofType:extension inBundle:self];
}

@end


@implementation NSString (DPLocalization)

+ (NSString *)autolocalizingStringWithLocalizationKey:(NSString *)localizationKey {
    return [DPAutolocalizationProxy autolocalizingStringWithLocalizationKey:localizationKey];
}

@end