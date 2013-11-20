//
//  DPLocalizationManager.m
//  DP Commons
//
//  Created by dmitriy.petrusevich on 21.08.13.
//  Copyright (c) 2013 Dmitriy Petrusevich. All rights reserved.
//

#import "DPLocalizationManager.h"


NSString * const DPLanguageDidChangeNotification = @"DPLanguageDidChangeNotification";
NSString * const DPLanguagePreferenceKey = @"DPLanguageKey";

@interface DPLocalizationManager ()
@property (nonatomic, strong) NSDictionary *localizationStrings;
@end

@implementation DPLocalizationManager

@synthesize currentLanguage = _currentLanguage;

- (NSString *)currentLanguage {
    if (!_currentLanguage) {
        _currentLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:DPLanguagePreferenceKey];
    }
    return _currentLanguage;
}

- (void)setCurrentLanguage:(NSString *)currentLanguage {
    if (_currentLanguage != currentLanguage) {
        [[NSUserDefaults standardUserDefaults] setObject:currentLanguage forKey:DPLanguagePreferenceKey];
        [[NSUserDefaults standardUserDefaults] synchronize];

        _currentLanguage = currentLanguage;
        self.localizationStrings = nil;
        [[NSNotificationCenter defaultCenter] postNotificationName:DPLanguageDidChangeNotification object:self];
    }
}

- (NSDictionary *)localizationStrings {
    if (!_localizationStrings && self.currentLanguage) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Localizable" ofType:@"strings" inDirectory:nil forLocalization:self.currentLanguage];
        path = path ? path : [[NSBundle mainBundle] pathForResource:@"Localizable" ofType:@"strings"];
        _localizationStrings = path ? [NSDictionary dictionaryWithContentsOfFile:path] : @{};
    }
    
    return _localizationStrings;
}

#pragma mark -

+ (instancetype)currentManager {
    static DPLocalizationManager *_sharedInstance = nil;
    static dispatch_once_t onceToken = 0;

    dispatch_once(&onceToken, ^{
        _sharedInstance = [[DPLocalizationManager alloc] init];
    });

    return _sharedInstance;
}

- (NSString *)localizedStringForKey:(NSString *)key {
    NSParameterAssert([key isKindOfClass:[NSString class]]);
    
    NSString *result = self.localizationStrings[key];
    return result ? result : NSLocalizedString(key, nil);
}

- (UIImage *)localizedImageNamed:(NSString *)name {
    UIImage *result = nil;
    if (name && self.currentLanguage) {
        NSString *path = [[NSString stringWithFormat:@"%@.lproj", self.currentLanguage] stringByAppendingPathComponent:name];
        result = [UIImage imageNamed:path];
    }
    return result ? result : [UIImage imageNamed:name];
}

- (NSString *)localizedPathForResource:(NSString *)name ofType:(NSString *)extension bundle:(NSBundle *)bundle {
    NSBundle *searchBundle = bundle ? bundle : [NSBundle mainBundle];
    NSString *path = [searchBundle pathForResource:name ofType:extension inDirectory:nil forLocalization:self.currentLanguage];
    path = path ? path : [searchBundle pathForResource:name ofType:extension];
    return path;
}

@end
