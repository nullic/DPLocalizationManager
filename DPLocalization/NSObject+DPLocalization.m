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

        self.autolocKey = key;
        self.autolocKeyPath = keyPath;
        [self localize];
    }
}

- (void)removeAutolocalization {
    objc_setAssociatedObject(self, (__bridge void *)(kAutolocOnDeallocBlockKey), nil, 0);
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

- (void)localize {
    if (self.autolocKey && self.autolocKeyPath) {
        NSString *resultString = DPLocalizedString(self.autolocKey, nil);
        NSArray *args = self.autolocArgs;

        if (resultString && args.count) {
            void *argList = (void *)malloc(args.count * sizeof(id));
            [args getObjects:(id __unsafe_unretained *)argList range:NSMakeRange(0, args.count)];
            resultString = [[NSString alloc] initWithFormat:resultString arguments:argList];
            free(argList);
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

@end

#pragma mark - Core Foundation Additions -

@implementation NSBundle (DPLocalization)

- (NSString *)localizedPathForResource:(NSString *)name ofType:(NSString *)ext {
    return [[DPLocalizationManager currentManager] localizedPathForResource:name ofType:ext bundle:self];
}

@end
