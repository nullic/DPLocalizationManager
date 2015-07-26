//
//  DPAutolocalizationProxy.m
//  LocalizationDemo
//
//  Created by dmitriy.petrusevich on 07.03.14.
//  Copyright (c) 2014 Dmitriy Petrusevich. All rights reserved.
//

#import "DPAutolocalizationProxy.h"
#import "DPLocalizationManager.h"


static NSString * const kLocalizationKeyKey = @"key";
static NSString * const kLocalizationTableKey = @"table";
static NSString * const kLocalizationImageNameKey = @"imageName";
static NSString * const kLocalizationResourseNameKey = @"resourseName";
static NSString * const kLocalizationResourseTypeKey = @"resourseType";
static NSString * const kLocalizationBundleKey = @"bundle";

@interface DPAutolocalizationProxy () {
@protected
    id surrogate;
    NSString *locale;
}
@property (nonatomic, copy) NSDictionary *options;
@end


#pragma mark - Concrete -

@interface DPAutolocalizingString : DPAutolocalizationProxy
@end

@implementation DPAutolocalizingString

- (id)surrogate {
    @synchronized(self) {
        if (!self->surrogate) {
            self->surrogate = DPLocalizedStringFromTable(self.options[kLocalizationKeyKey], self.options[kLocalizationTableKey], nil);
        }
        return self->surrogate;
    }
}

@end

#pragma mark -

@interface DPAutolocalizingPath : DPAutolocalizationProxy
@end

@implementation DPAutolocalizingPath

- (id)surrogate {
    @synchronized(self) {
        if (!self->surrogate) {
            self->surrogate = [[DPLocalizationManager currentManager] localizedPathForResource:self.options[kLocalizationResourseNameKey] ofType:self.options[kLocalizationResourseTypeKey] bundle:self.options[kLocalizationBundleKey]];
        }
        return self->surrogate;
    }
}

@end

#pragma mark -

@interface DPAutolocalizingImage : DPAutolocalizationProxy
@end

@implementation DPAutolocalizingImage

- (id)surrogate {
    @synchronized(self) {
        if (!self->surrogate) {
            self->surrogate = [[DPLocalizationManager currentManager] localizedImageNamed:self.options[kLocalizationImageNameKey]];
        }
        return self->surrogate;
    }
}

@end


#pragma mark - Abstract -

@implementation DPAutolocalizationProxy

+ (NSNotificationCenter *)notificationCenter {
    static dispatch_once_t onceToken;
    static NSNotificationCenter *notificationCenter = nil;
    dispatch_once(&onceToken, ^{
        notificationCenter = [[NSNotificationCenter alloc] init];
    });
    return notificationCenter;
}

#pragma mark -

+ (NSString *)autolocalizingStringWithLocalizationKey:(NSString *)localizationKey {
    return [self autolocalizingStringWithLocalizationKey:localizationKey tableName:nil];
}

+ (NSString *)autolocalizingStringWithLocalizationKey:(NSString *)localizationKey tableName:(NSString *)tableName {
    NSParameterAssert(localizationKey != nil);

    NSMutableDictionary *options = [NSMutableDictionary dictionaryWithCapacity:2];
    [options setValue:localizationKey forKey:kLocalizationKeyKey];
    [options setValue:tableName forKey:kLocalizationTableKey];

    return (NSString *)[[DPAutolocalizingString alloc] initWithOptions:options];
}

+ (NSString *)autolocalizingPathForResource:(NSString *)name ofType:(NSString *)ext inBundle:(NSBundle *)bundle {
    NSParameterAssert(!(name == nil && ext == nil));

    NSMutableDictionary *opts = [NSMutableDictionary dictionary];
    [opts setValue:name forKey:kLocalizationResourseNameKey];
    [opts setValue:ext forKey:kLocalizationResourseTypeKey];
    [opts setValue:bundle forKey:kLocalizationBundleKey];

    return (NSString *)[[DPAutolocalizingPath alloc] initWithOptions:opts];
}

+ (DPImage *)autolocalizingImageNamed:(NSString *)imageName {
    NSParameterAssert(imageName != nil);
    return (DPImage *)[[DPAutolocalizingImage alloc] initWithOptions:@{kLocalizationImageNameKey : imageName}];
}

#pragma mark -

+ (instancetype)alloc {
    DPAutolocalizationProxy *result = [super alloc];
    if (result) {
        [[self notificationCenter] addObserver:result selector:@selector(languageDidChangeNotification:) name:DPLanguageDidChangeNotification object:nil];
    }
    return result;
}

- (instancetype)initWithOptions:(NSDictionary *)options {
    NSParameterAssert([options count] != 0);

    self.options = options;
    self.surrogate = nil;

    return self;
}

- (void)dealloc {
    [[[self class] notificationCenter] removeObserver:self];
}

#pragma mark -

- (NSString *)description {
    return [self.surrogate description];
}

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"%@ {locale = \"%@\"; value = \"%@\"}", [super description], self->locale, [self.surrogate debugDescription]];
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

#pragma mark - Properties

- (void)setSurrogate:(id)aSurrogate {
    @synchronized(self) {
        self->surrogate = aSurrogate;
        self->locale = dp_get_current_language();
    }
}

- (id)surrogate {
    @synchronized(self) {
        return self->surrogate;
    }
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
    result.options = [self.options copy];
    return result;
}

@end
