//
//  DPLocalizationManager.h
//  DP Commons
//
//  Created by dmitriy.petrusevich on 21.08.13.
//  Copyright (c) 2013 Dmitriy Petrusevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPLocalizationPlatforms.h"

#import "NSObject+DPLocalization.h"
#import "NSAttributedString+DPLocalization.h"

#import "DPAutolocalizationProxy.h"
#import "Plural+DPLocalization.h"
#import "DPFormattedValue.h"


/**
 @class DPLocalizationManager
 @brief Helper class used for control language of the application.
 */
@interface DPLocalizationManager : NSObject
/**
 @property currentLanguage
 @brief Current selected language. It's same names that used for resource localization as part of .lproj folders (i.e.: "en", "ru", "fr" and etc.) or nil for system language. After currentLanguage is set, it value will be saved in [NSUserDefaults standardUserDefaults].
 */
@property (nonatomic, copy) NSString *currentLanguage;

/**
 @property defaultStringsTableName
 @brief Default string table name used for localization.
 */
@property(nonatomic, copy) NSString *defaultStringTableName;

/**
 @brief Returns shared DPLocalizationManager object.

 @return Returns instance used for control locazition.
 */
+ (instancetype)currentManager;

/**
 @brief Returns a localized version of a string.
 @param key     The key for a string in the -[self defaultStringsTableName] table.

 @return The result is invoking of -[self localizedStringForKey:key table:self.defaultStringsTableName].
 */
- (NSString *)localizedStringForKey:(NSString *)key;

/**
 @brief Returns a localized version of a string.
 @param key     The key for a string in the table identified by tableName.
 @param table   The receiver’s string table to search. If tableName is nil or is an empty string, the method attempts to use the table in Localizable.strings.
 
 @return Returns a localized version of a string for selected language. If string not found return the result of NSLocalizedStringFromTable macro.
 */
- (NSString *)localizedStringForKey:(NSString *)key table:(NSString *)table;

/**
 @brief Returns a localized version of a string. Method use plural rules if {defaultStringTableName}.stringsdict exist.
 @param key         The key for a string in the table identified by tableName.
 @param table       The receiver’s string table to search. If tableName is nil or is an empty string, the method attempts to use the table in Localizable.strings.
 @param arguments   List of arguments to substitute into localized string.

 @return Returns a localized version of a string for selected language.
 */
- (NSString *)localizedStringForKey:(NSString *)key table:(NSString *)table arguments:(NSArray *)arguments;

/**
 @brief Returns a localized version of an image.
 @param name    The name associated with the desired image.

 @return Returns a localized version of an image for selected language. If image not found return the result of invoking -[UIImage imageNamed:].
 */

- (DPImage *)localizedImageNamed:(NSString *)name;

/**
 @brief Returns the full pathname for the resource identified by the specified name and file extension for selected language.
 @param name        The name of the resource file.
 @param extension   If extension is an empty string or nil, the extension is assumed not to exist and the file is the first file encountered that exactly matches name.
 @param bundle      If bundle is nil, the bundle is assumed as main bundle.

 @return The result is invoking of [bundle pathForResource:name ofType:extension inDirectory:nil forLocalization:currentLanguage]. If result is nil return [bundle pathForResource:name ofType:extension] instead.
 */
- (NSString *)localizedPathForResource:(NSString *)name ofType:(NSString *)extension bundle:(NSBundle *)bundle;

/**
 @brief Array of languages that may be found inside application bundle.

 @return Array of language codes (i.e.: "en", "ru", "fr" and etc.) or empty array if no language found.
 */
+ (NSArray *)supportedLanguages;

/**
 @brief Return code for preferred application language.

 @return Return first occurrence [NSLocale preferredLanguages] into [self supportedLanguages] or first element of [NSLocale preferredLanguages] array if [NSLocale preferredLanguages] and [self supportedLanguages] doesn't intersect.
 */
+ (NSString *)preferredLanguage;

@property(nonatomic, copy) NSString *localizationFileName DEPRECATED_MSG_ATTRIBUTE("Use 'defaultStringTableName' property instead. This property will be removed in further releases.");

@end


/**
 @return The result is invoking of [[DPLocalizationManager currentManager] localizedStringForKey:key];
 */
NSString * DPLocalizedString(NSString *key, NSString *comment);

/**
 @return The result is invoking of [[DPLocalizationManager currentManager] localizedStringForKey:key table:table];
 */
NSString * DPLocalizedStringFromTable(NSString *key, NSString *table, NSString *comment);

/**
 @return The result is invoking of [DPAutolocalizationProxy autolocalizingStringWithLocalizationKey:key];
 */
NSString * DPAutolocalizedString(NSString *key, NSString *comment);

/**
 @return The result is invoking of [DPAutolocalizationProxy autolocalizingStringWithLocalizationKey:key tableName:tableName];
 */
NSString * DPAutolocalizedStringFromTable(NSString *key, NSString *tableName, NSString *comment);

/**
 @return The result is invoking of [[DPLocalizationManager currentManager] currentLanguage];
 */
NSString * dp_get_current_language();

/**
 @brief Equal to [[DPLocalizationManager currentManager] setCurrentLanguage:lang];
 */
void dp_set_current_language(NSString *lang);


/**
 @brief     Return language name that can be shown to user.
 @param     lang Language code (i.e.: "en", "ru", "fr" and etc.)
 @return    The result is invoking of [[[[NSLocale alloc] initWithLocaleIdentifier:lang] displayNameForKey:NSLocaleIdentifier value:lang] capitalizedString];
 */
NSString * dp_get_language_display_name(NSString *lang);

/**
 @return    The result is invoking of dp_get_language_display_name(dp_get_current_language())
 */
NSString * dp_get_current_language_display_name();


NSString * dp_get_current_filename() DEPRECATED_MSG_ATTRIBUTE("Use 'defaultStringTableName' property instead. This function will be removed in further releases.");
void dp_set_current_filename(NSString *filename) DEPRECATED_MSG_ATTRIBUTE("Use 'defaultStringTableName' property instead. This function will be removed in further releases.");

/**
 @brief Notification posted by DPLocalizationManager after currentLanguage property did changed.
 */
extern NSString * const DPLanguageDidChangeNotification;

/**
 @brief Key used for store selection in [NSUserDefaults standardUserDefaults]
 */
extern NSString * const DPLanguagePreferenceKey;
