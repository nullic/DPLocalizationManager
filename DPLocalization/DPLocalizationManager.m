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
@synthesize localizationFileName = _localizationFileName;

- (NSString *)currentLanguage {
    if (!_currentLanguage) {
        NSString *value = [[NSUserDefaults standardUserDefaults] objectForKey:DPLanguagePreferenceKey];
        value = ([value isKindOfClass:[NSString class]]) ? [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] : nil;
        _currentLanguage = (value.length == 0) ? nil : value;
    }
    return _currentLanguage;
}

- (void)setCurrentLanguage:(NSString *)currentLanguage {
    NSString *newLanguage = ([currentLanguage isKindOfClass:[NSString class]]) ? [currentLanguage stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] : nil;
    newLanguage = (newLanguage.length == 0) ? nil : newLanguage;

    if (newLanguage != _currentLanguage && !(newLanguage && [_currentLanguage isEqualToString:newLanguage])) {
        _currentLanguage = newLanguage;
        self.localizationStrings = nil;
        [[NSNotificationCenter defaultCenter] postNotificationName:DPLanguageDidChangeNotification object:self];

        [[NSUserDefaults standardUserDefaults] setObject:newLanguage forKey:DPLanguagePreferenceKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (NSDictionary *)localizationStrings {
    if (!_localizationStrings && self.currentLanguage) {
        NSString *localizationFileName = self.localizationFileName;
        NSString *path = [[NSBundle mainBundle] pathForResource:localizationFileName ofType:@"strings" inDirectory:nil forLocalization:self.currentLanguage];
        path = path ? path : [[NSBundle mainBundle] pathForResource:localizationFileName ofType:@"strings"];
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

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDefaultsDidChangeNotification:) name:NSUserDefaultsDidChangeNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

- (void)userDefaultsDidChangeNotification:(NSNotification *)notification {
    [self setCurrentLanguage:[[NSUserDefaults standardUserDefaults] objectForKey:DPLanguagePreferenceKey]];
}

#pragma mark - Localization

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

#pragma mark - Languages

+ (NSArray *)supportedLanguages {
    static NSArray *supportedLanguages = nil;

    if (supportedLanguages == nil) {
        NSFileManager *fileManager = [[NSFileManager alloc] init];
        NSDirectoryEnumerator *dirEnumerator = [fileManager enumeratorAtURL:[[NSBundle mainBundle] bundleURL]
                                                 includingPropertiesForKeys:@[NSURLNameKey, NSURLIsDirectoryKey]
                                                                    options:NSDirectoryEnumerationSkipsHiddenFiles
                                                               errorHandler:nil];

        NSMutableArray *result = [NSMutableArray array];
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(.+?)\\.lproj" options:0 error:nil];

        for (NSURL *theURL in dirEnumerator) {
            NSString *fileName = nil;
            NSNumber *isDirectory = nil;

            [theURL getResourceValue:&fileName forKey:NSURLNameKey error:NULL];
            [theURL getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:NULL];

            if (isDirectory.boolValue) {
                NSArray *results = [regex matchesInString:fileName options:0 range:NSMakeRange(0, fileName.length)];
                if (results.count == 1) {
                    NSTextCheckingResult *match = results[0];
                    if (match.numberOfRanges == 2) {
                        NSString *language = [fileName substringWithRange:[match rangeAtIndex:1]];
                        [result addObject:language];
                        [dirEnumerator skipDescendants];
                    }

                }
            }
        }

        supportedLanguages = result;
    }

    return supportedLanguages;
}

+ (NSString *)preferredLanguage {
    NSArray *preferredLanguages = [NSLocale preferredLanguages];
    NSArray *supportedLanguages = [self supportedLanguages];

    NSString *result = nil;
    for (NSString *language in preferredLanguages) {
        if ([supportedLanguages indexOfObject:language] != NSNotFound) {
            result = language;
            break;
        }
    }

    return result ? result : (preferredLanguages.count ? preferredLanguages[0] : nil);
}

- (void)setLocalizationFileName:(NSString *)localizationFileName
{
    _localizationFileName = localizationFileName;
    
    self.localizationStrings = nil;
    [[NSNotificationCenter defaultCenter] postNotificationName:DPLanguageDidChangeNotification object:self];
}

- (NSString *)localizationFileName
{
    if (!_localizationFileName) {
        _localizationFileName = @"Localizable";
    }
    
    return _localizationFileName;
}

@end

#pragma mark - 

NSString * DPLocalizedString(NSString *key, NSString *comment) {
    return [[DPLocalizationManager currentManager] localizedStringForKey:key];
}

NSString * dp_get_current_language() {
    return [[DPLocalizationManager currentManager] currentLanguage];
}

void dp_set_current_language(NSString *lang) {
    [[DPLocalizationManager currentManager] setCurrentLanguage:lang];
}

NSString * dp_get_language_display_name(NSString *lang) {
    return [[[[NSLocale alloc] initWithLocaleIdentifier:lang] displayNameForKey:NSLocaleIdentifier value:lang] capitalizedString];
}

NSString * dp_get_current_language_display_name() {
    return dp_get_language_display_name(dp_get_current_language());
}

NSString * dp_get_current_filename() {
    return [[DPLocalizationManager currentManager] localizationFileName];
}

void dp_set_current_filename(NSString *filename) {
    [[DPLocalizationManager currentManager] setLocalizationFileName:filename];
}