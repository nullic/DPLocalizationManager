//
//  DPLocalizationManager.m
//  DP Commons
//
//  Created by dmitriy.petrusevich on 21.08.13.
//  Copyright (c) 2013 Dmitriy Petrusevich. All rights reserved.
//

#import "DPLocalizationManager.h"
#import "Plural+DPLocalization.h"
#import "DPAutolocalizationProxy.h"
#import "NSObject+DPLocalization.h"


NSString * const DPLanguageDidChangeNotification = @"DPLanguageDidChangeNotification";
NSString * const DPLanguagePreferenceKey = @"DPLanguageKey";

@interface DPLocalizationManager ()
@property (nonatomic, strong) NSMutableDictionary *tables;
@property (nonatomic, strong) NSMutableDictionary *pluralRuleTables;
@property (nonatomic) dp_plural_rules_func plural_rules_func;
@end

@implementation DPLocalizationManager

@synthesize currentLanguage = _currentLanguage;
@synthesize defaultStringTableName = _defaultStringTableName;
@synthesize defaultBundle = _defaultBundle;

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
    NSString *curLang = _currentLanguage;

    if (newLanguage != curLang && !(newLanguage && [curLang isEqualToString:newLanguage])) {
        _currentLanguage = newLanguage;
        [[NSUserDefaults standardUserDefaults] setObject:newLanguage forKey:DPLanguagePreferenceKey];
        [[NSUserDefaults standardUserDefaults] synchronize];

        [self.tables removeAllObjects];
        [self.pluralRuleTables removeAllObjects];
        self.plural_rules_func = newLanguage ? dp_plural_rules_for_lang_code(newLanguage) : NULL;
        [[DPAutolocalizationProxy notificationCenter] postNotificationName:DPLanguageDidChangeNotification object:self];
        [[NSNotificationCenter defaultCenter] postNotificationName:DPLanguageDidChangeNotification object:self];
    }
}

- (NSString *)usedLanguage {
    return self.currentLanguage ? self.currentLanguage : [self.defaultBundle preferredLanguage];
}

- (dp_plural_rules_func)plural_rules_func {
    if (_plural_rules_func == NULL) {
        _plural_rules_func = dp_plural_rules_for_lang_code(self.usedLanguage);
    }
    return _plural_rules_func;
}

- (NSMutableDictionary *)tables {
    if (!_tables) _tables = [[NSMutableDictionary alloc] init];
    return _tables;
}

- (NSMutableDictionary *)pluralRuleTables {
    if (_pluralRuleTables == nil) _pluralRuleTables = [[NSMutableDictionary alloc] init];
    return _pluralRuleTables;
}

- (void)loadTableNamedIfNeeded:(NSString *)tableName {
    if (tableName && self.tables[tableName] == nil) {
        {
            NSString *path = [self.defaultBundle pathForResource:tableName ofType:@"strings" inDirectory:nil forLocalization:self.currentLanguage];
            path = path ? path : [self.defaultBundle pathForResource:tableName ofType:@"strings"];
            NSDictionary *tableContent = path ? [NSDictionary dictionaryWithContentsOfFile:path] : nil;
            self.tables[tableName] = tableContent ? tableContent : @{};
        }

        {
            NSString *path = [self.defaultBundle pathForResource:tableName ofType:@"stringsdict" inDirectory:nil forLocalization:self.currentLanguage];
            path = path ? path : [self.defaultBundle pathForResource:tableName ofType:@"stringsdict"];
            NSDictionary *tableContent = path ? [NSDictionary dictionaryWithContentsOfFile:path] : nil;
            self.pluralRuleTables[tableName] = tableContent ? tableContent : @{};
        }
    }
}

- (NSString *)defaultStringTableName {
    return _defaultStringTableName ? _defaultStringTableName : @"Localizable";
}

- (void)setDefaultStringTableName:(NSString *)defaultStringTableName {
    if ([defaultStringTableName isEqualToString:[self defaultStringTableName]] == NO) {
        _defaultStringTableName = [defaultStringTableName copy];
        
        [[DPAutolocalizationProxy notificationCenter] postNotificationName:DPLanguageDidChangeNotification object:self];
        [[NSNotificationCenter defaultCenter] postNotificationName:DPLanguageDidChangeNotification object:self];
    }
}

- (NSBundle *)defaultBundle {
    return _defaultBundle ? _defaultBundle : [NSBundle mainBundle];
}

- (void)setDefaultBundle:(NSBundle *)defaultBundle {
    if (_defaultBundle != defaultBundle) {
        _defaultBundle = defaultBundle;

        [self.tables removeAllObjects];
        [self.pluralRuleTables removeAllObjects];
        [[DPAutolocalizationProxy notificationCenter] postNotificationName:DPLanguageDidChangeNotification object:self];
        [[NSNotificationCenter defaultCenter] postNotificationName:DPLanguageDidChangeNotification object:self];
    }
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
    return [self localizedStringForKey:key table:self.defaultStringTableName];
}

- (NSString *)localizedStringForKey:(NSString *)key table:(NSString *)table {
    NSParameterAssert([key isKindOfClass:[NSString class]]);
    NSParameterAssert([table isKindOfClass:[NSString class]] || table == nil);

    NSString *tableName = [table length] ? table : self.defaultStringTableName;
    [self loadTableNamedIfNeeded:tableName];

    NSString *result = self.tables[tableName][key];
    if (result == nil) {
        return [[NSBundle mainBundle] localizedStringForKey:key value:@"" table:tableName];
    }
    return result;
}

- (NSString *)localizedStringForKey:(NSString *)key table:(NSString *)table arguments:(NSArray *)arguments {
    NSString *tableName = [table length] ? table : self.defaultStringTableName;

    NSString *resultString = [self localizedStringForKey:key table:tableName];

    if (arguments.count > 0) {
        NSDictionary *pluralRules = self.pluralRuleTables[tableName][key];

        if (pluralRules != nil) {
            static NSRegularExpression *regexp = nil;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                regexp = [NSRegularExpression regularExpressionWithPattern:@"%([0-9]+\\$)??#@(.+?)@" options:kNilOptions error:nil];
            });

            NSString *format = pluralRules[@"NSStringLocalizedFormatKey"];
            NSMutableString *mutableStr = [format mutableCopy];

            NSArray *matches = [regexp matchesInString:format options:kNilOptions range:NSMakeRange(0, format.length)];
            [matches enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSTextCheckingResult *match, NSUInteger idx, BOOL *stop) {
                NSUInteger usedIndex = idx;
                NSRange indexRandge = [match rangeAtIndex:1];
                if (indexRandge.location != NSNotFound) {
                    NSString *index = [resultString substringWithRange:indexRandge];
                    usedIndex = ([index integerValue] - 1);
                }

                id argument = (arguments.count > usedIndex) ? arguments[usedIndex] : nil;

                NSString *argName = [mutableStr substringWithRange:[match rangeAtIndex:2]];
                NSString *string = [self _substitudePluralStringWithValue:argument variants:pluralRules[argName]];
                [mutableStr replaceCharactersInRange:match.range withString:string];
            }];

            resultString = mutableStr;
        }

        static NSRegularExpression *regexp = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            regexp = [NSRegularExpression regularExpressionWithPattern:@"%([0-9]+\\$)??@" options:kNilOptions error:nil];
        });

        NSArray *matches = [regexp matchesInString:resultString options:kNilOptions range:NSMakeRange(0, resultString.length)];
        NSMutableString *mutableStr = [resultString mutableCopy];
        [matches enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSTextCheckingResult *match, NSUInteger idx, BOOL *stop) {
            NSUInteger usedIndex = idx;
            NSRange indexRandge = [match rangeAtIndex:1];
            if (indexRandge.location != NSNotFound) {
                NSString *index = [resultString substringWithRange:indexRandge];
                usedIndex = ([index integerValue] - 1);
            }

            id subs = (arguments.count > usedIndex) ? arguments[usedIndex] : nil;
            [mutableStr replaceCharactersInRange:match.range withString:[subs description]];
        }];

        resultString = mutableStr;
    }

    return resultString;
}

- (DPImage *)localizedImageNamed:(NSString *)name {
    DPImage *result = nil;

    if (name && self.currentLanguage) {
        NSString *localizationPath = [NSString stringWithFormat:@"%@.lproj", self.currentLanguage];
#if DPLocalization_UIKit
        NSString *imageNamePath = [localizationPath stringByAppendingPathComponent:name];
        result = [DPImage imageNamed:imageNamePath inBundle:[self defaultBundle] compatibleWithTraitCollection:nil];
#elif DPLocalization_AppKit
        NSString *resourcePath = [self.defaultBundle resourcePath] ?: self.defaultBundle.bundlePath;
        NSString *bundlePath = [resourcePath stringByAppendingPathComponent:localizationPath];
        result = [[NSBundle bundleWithPath:bundlePath] imageForResource:name];
#endif
    }
    
#if DPLocalization_UIKit
    return result ? result : [DPImage imageNamed:name inBundle:[self defaultBundle] compatibleWithTraitCollection:nil];
#elif DPLocalization_AppKit
    return result ? result : [[self defaultBundle] imageForResource:name];
#endif
}

- (NSString *)localizedPathForResource:(NSString *)name ofType:(NSString *)extension bundle:(NSBundle *)bundle {
    NSBundle *searchBundle = bundle ? bundle : self.defaultBundle;
    NSString *path = [searchBundle pathForResource:name ofType:extension inDirectory:nil forLocalization:self.currentLanguage];
    path = path ? path : [searchBundle pathForResource:name ofType:extension];
    return path;
}

#pragma mark - Utils

- (NSString *)_substitudePluralStringWithValue:(NSNumber *)value variants:(NSDictionary *)variants {
    enum DPPluralRule rule = [value pluralRuleWithRules:self.plural_rules_func];

    NSString *result = variants[dp_key_from_pluralrule(rule)];
    if (result == nil) {
        NSLog(@"WARNING: Can't find '%@'", dp_key_from_pluralrule(rule));
        result = variants[dp_key_from_pluralrule(DPPluralRuleUnknown)];
    }

    return result;
}

#pragma mark - Languages

+ (NSArray *)supportedLanguages {
    return [[NSBundle mainBundle] localizations];
}

+ (NSString *)preferredLanguage {
    return [[NSBundle mainBundle] preferredLanguage];
}

#pragma mark - Deprecated

- (void)setLocalizationFileName:(NSString *)localizationFileName {
    [self setDefaultStringTableName:localizationFileName];
}

- (NSString *)localizationFileName {
    return [self defaultStringTableName];
}

@end


#pragma mark -
#pragma mark "C" Functions
#pragma mark -


NSString * DPLocalizedString(NSString *key, NSString *comment) {
    return [[DPLocalizationManager currentManager] localizedStringForKey:key];
}

NSString * DPLocalizedStringFromTable(NSString *key, NSString *table, NSString *comment) {
    return [[DPLocalizationManager currentManager] localizedStringForKey:key table:table];
}

NSString * DPAutolocalizedString(NSString *key, NSString *comment) {
    return [DPAutolocalizationProxy autolocalizingStringWithLocalizationKey:key];
}

NSString * DPAutolocalizedStringFromTable(NSString *key, NSString *tableName, NSString *comment) {
    return [DPAutolocalizationProxy autolocalizingStringWithLocalizationKey:key tableName:tableName];
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

#pragma mark Deprecated

NSString * dp_get_current_filename() {
    return [[DPLocalizationManager currentManager] localizationFileName];
}

void dp_set_current_filename(NSString *filename) {
    [[DPLocalizationManager currentManager] setLocalizationFileName:filename];
}
