//
//  DPAutolocalizationProxy.h
//  LocalizationDemo
//
//  Created by dmitriy.petrusevich on 07.03.14.
//  Copyright (c) 2014 Dmitriy Petrusevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DPAutolocalizationProxy : NSProxy <NSCopying>
/**
 @brief Return a localized version of a string.
 @param key     The key for a string in the Localizable.strings table.

 @discussion Value is equal to invoking DPLocalizedString(key, nil).
 @return Proxy object which value depended from selected language.
 */
+ (NSString *)autolocalizingStringWithLocalizationKey:(NSString *)key;

/**
 @brief Returns the full pathname for the resource identified by the specified name and file extension for selected language.
 @param name    The name of the resource file.
 @param ext     If extension is an empty string or nil, the extension is assumed not to exist and the file is the first file encountered that exactly matches name.
 @param bundle  If bundle is nil, the bundle is assumed as main bundle.

 @discussion Value is equal to invoking [[DPLocalizationManager currentManager] localizedPathForResource:name ofType:ext bundle:bundle].
 @return Proxy object which value depended from selected language.
 */
+ (NSString *)autolocalizingPathForResource:(NSString *)name ofType:(NSString *)ext inBundle:(NSBundle *)bundle;

/**
 @brief Returns a localized version of an image.
 @param name    The name for an image in the Localizable.strings table.

 @discussion Value is equal to invoking [[DPLocalizationManager currentManager] localizedImageNamed:name].
 @return Proxy object which value depended from selected language.
 */
+ (UIImage *)autolocalizingImageNamed:(NSString *)name;
@end

NSString * DPAutolocalizedString(NSString *key, NSString *comment);
