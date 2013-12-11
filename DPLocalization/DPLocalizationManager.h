//
//  DPLocalizationManager.h
//  DP Commons
//
//  Created by dmitriy.petrusevich on 21.08.13.
//  Copyright (c) 2013 Dmitriy Petrusevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+DPLocalization.h"


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
 @brief Returns shared DPLocalizationManager object.

 @return Returns instance used for control locazition.
 */
+ (instancetype)currentManager;

/**
 @brief Returns a localized version of a string.
 @param key The key for a string in the Localizable.strings table.

 @return Returns a localized version of a string for selected language. If string not found return the result of NSLocalizedString macro.
 */
- (NSString *)localizedStringForKey:(NSString *)key;

/**
 @brief Returns a localized version of an image.
 @param name The name for an image in the Localizable.strings table.

 @return Returns a localized version of an image for selected language. If image not found return the result of invoking -[UIImage imageNamed:].
 */
- (UIImage *)localizedImageNamed:(NSString *)name;

/**
 @brief Returns the full pathname for the resource identified by the specified name and file extension for selected language.
 @param name The name of the resource file.
 @param extension If extension is an empty string or nil, the extension is assumed not to exist and the file is the first file encountered that exactly matches name.
 @param bundle If bundle is nil, the bundle is assumed as main bundle.

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

@property(nonatomic, copy) NSString *localizationFileName;

@end


#define DPLocalizedString(key, comment) ([[DPLocalizationManager currentManager] localizedStringForKey:key])

#define dp_get_current_language() ([[DPLocalizationManager currentManager] currentLanguage])
#define dp_set_current_language(lang) ([[DPLocalizationManager currentManager] setCurrentLanguage:lang])

#define dp_get_current_filename() ([[DPLocalizationManager currentManager] localizationFileName])
#define dp_set_current_filename(__FILENAME__) ([[DPLocalizationManager currentManager] setLocalizationFileName:__FILENAME__])

/**
 @brief Notification posted by DPLocalizationManager after currentLanguage property did changed.
 */
extern NSString * const DPLanguageDidChangeNotification;

/**
 @brief Key used for store selection in [NSUserDefaults standardUserDefaults]
 */
extern NSString * const DPLanguagePreferenceKey;
