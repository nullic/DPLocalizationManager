//
//  DPAutolocalizationProxy.h
//  LocalizationDemo
//
//  Created by dmitriy.petrusevich on 07.03.14.
//  Copyright (c) 2014 Dmitriy Petrusevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPLocalizationPlatforms.h"

NS_ASSUME_NONNULL_BEGIN

@interface DPAutolocalizationProxy : NSProxy <NSCopying>

/**
 @return            Notification center user for deviler notification to proxy objects.
 @discussion        DPLocalizationManager post DPLanguageDidChangeNotification notification via +[DPAutolocalizationProxy notificationCenter], then post via +[NSNotificationCenter defaultCenter].
 */
+ (NSNotificationCenter *)notificationCenter;

/**
 @brief             Return a localized version of a string.
 @param key         The key for a string in the [[DPLocalizationManager currentManager] defaultStringsTableName] table.

 @discussion        Value is equal to invoking DPLocalizedStringFromTable(key, nil, nil);
 @return            The result is invoking of +[self autolocalizingStringWithLocalizationKey:key tableName:nil].
 */
+ (NSString *)autolocalizingStringWithLocalizationKey:(NSString *)key;

/**
 @brief             Return a localized version of a string.
 @param key         The key for a string in the table identified by tableName.
 @param tableName   The receiver’s string table to search. If tableName is nil or is an empty string, the method attempts to use the table in Localizable.strings.

 @discussion        Value is equal to invoking DPLocalizedStringFromTable(key, tableName, nil);
 @return            Proxy object which value depended from selected language.
 */
+ (NSString *)autolocalizingStringWithLocalizationKey:(NSString *)key tableName:(NSString *_Nullable)tableName;

/**
 @brief             Returns the full pathname for the resource identified by the specified name and file extension for selected language.
 @param name        The name of the resource file.
 @param ext         If extension is an empty string or nil, the extension is assumed not to exist and the file is the first file encountered that exactly matches name.
 @param bundle      If bundle is nil, the bundle is assumed as main bundle.

 @discussion        Value is equal to invoking [[DPLocalizationManager currentManager] localizedPathForResource:name ofType:ext bundle:bundle].
 @return            Proxy object which value depended from selected language.
 */
+ (NSString *_Nullable)autolocalizingPathForResource:(NSString *_Nullable)name ofType:(NSString *_Nullable)ext inBundle:(NSBundle *_Nullable)bundle;

/**
 @brief             Returns a localized version of an image.
 @param name        The name associated with the desired image.

 @discussion        Value is equal to invoking [[DPLocalizationManager currentManager] localizedImageNamed:name].
 @return            Proxy object which value depended from selected language.
 */
+ (DPImage *_Nullable)autolocalizingImageNamed:(NSString *)name;

+ (NSLocale *)autolocalizingLocale;
@end

NS_ASSUME_NONNULL_END
