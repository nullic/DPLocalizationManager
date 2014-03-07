//
//  DPAutolocalizationProxy.m
//  LocalizationDemo
//
//  Created by dmitriy.petrusevich on 07.03.14.
//  Copyright (c) 2014 Dmitriy Petrusevich. All rights reserved.
//

#import "DPAutolocalizationProxy.h"
#import "DPLocalizationManager.h"


static NSString * const kLocalizationKeyKey = @"localizationKey";
static NSString * const kLocalizationImageNameKey = @"localizationImageName";

@interface DPAutolocalizationProxy ()
@property (nonatomic, strong) id surrogate;
@property (nonatomic, copy) NSDictionary *localizationOptions;
@end

#pragma mark - Concrete -

@interface DPAutolocalizingString : DPAutolocalizationProxy
@end

@implementation DPAutolocalizingString

- (id)surrogate {
    if (![super surrogate]) {
        self.surrogate = DPLocalizedString(self.localizationOptions[kLocalizationKeyKey], nil);
    }
    return [super surrogate];
}

@end

#pragma mark -

@interface DPAutolocalizingImage : DPAutolocalizationProxy
@end

@implementation DPAutolocalizingImage

- (id)surrogate {
    if (![super surrogate]) {
        self.surrogate = [UIImage localizedImageNamed:self.localizationOptions[kLocalizationImageNameKey]];
    }
    return [super surrogate];
}

@end


#pragma mark - Abstract -

@implementation DPAutolocalizationProxy

+ (NSString *)autolocalizingStringWithLocalizationKey:(NSString *)localizationKey {
    NSParameterAssert(localizationKey != nil);
    DPAutolocalizationProxy *string = [DPAutolocalizingString alloc];
    string.localizationOptions = @{kLocalizationKeyKey : localizationKey};
    return (NSString *)string;
}

+ (UIImage *)autolocalizingImageNamed:(NSString *)imageName {
    NSParameterAssert(imageName != nil);
    DPAutolocalizationProxy *image = [DPAutolocalizingImage alloc];
    image.localizationOptions = @{kLocalizationImageNameKey : imageName};
    return (UIImage *)image;
}

#pragma mark -

+ (instancetype)alloc {
    DPAutolocalizationProxy *result = [super alloc];
    if (result) {
        [[NSNotificationCenter defaultCenter] addObserver:result selector:@selector(languageDidChangeNotification:) name:DPLanguageDidChangeNotification object:nil];
    }
    return result;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -

- (NSString *)description {
    return [self.surrogate description];
}

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"%@ {locale = \"%@\"; value = \"%@\"}", [super description], dp_get_current_language(), [self.surrogate debugDescription]];
}

- (BOOL)isKindOfClass:(Class)aClass {
    return [self.surrogate isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass {
    return [self.surrogate isMemberOfClass:aClass];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    invocation.target = self.surrogate;
    [invocation invoke];
}

- (BOOL)respondsToSelector:(SEL)selector {
    return [self.surrogate respondsToSelector:selector];
}

- (NSMethodSignature*)methodSignatureForSelector:(SEL)selector {
    return [self.surrogate methodSignatureForSelector:selector];
}

#pragma mark - Notifications

- (void)languageDidChangeNotification:(NSNotification *)notification {
    self.surrogate = nil;
}

#pragma mark - Copying

- (id)copy {
    return [self copyWithZone:nil];
}

- (id)copyWithZone:(NSZone *)zone {
    typeof(self) result = [[self class] alloc];
    result.localizationOptions = [self.localizationOptions copy];
    return result;
}

@end

