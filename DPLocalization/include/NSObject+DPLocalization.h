//
//  NSObject+DPLocalization.h
//  DP Commons
//
//  Created by dmitriy.petrusevich on 21.08.13.
//  Copyright (c) 2013 Dmitriy Petrusevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPLocalizationPlatforms.h"

#ifndef IBInspectable
    #define IBInspectable
#endif

NS_ASSUME_NONNULL_BEGIN

/**
 @category NSObject (DPLocalization)
 @brief Add ability to automatic localization.
 */
@interface NSObject (DPLocalization)
/**
 @brief Setup update value automaticaly after DPLanguageDidChangeNotification notification was posted.
 @param key         The key for a string in the Localizable.strings table.
 @param keyPath     Keypath for assing localized value.
 */
- (void)setupAutolocalizationWithKey:(NSString *_Nullable)key keyPath:(NSString *_Nullable)keyPath;

/**
 @brief Setup update value automaticaly after DPLanguageDidChangeNotification notification was posted.
 @param key         The key for a string in the Localizable.strings table.
 @param keyPath     Keypath for assing localized value.
 @param arguments   List of arguments to substitute into localized string.
 */
- (void)setupAutolocalizationWithKey:(NSString *_Nullable)key keyPath:(NSString *_Nullable)keyPath arguments:(NSArray *_Nullable)arguments;

/**
 @brief Update list of arguments to substitute into localized string.
 @param arguments   List of arguments to substitute into localized string.
 */
- (void)updateAutolocalizationArguments:(NSArray *_Nullable)arguments;

/**
 @brief Remove object updating on DPLanguageDidChangeNotification notification.
 */
- (void)removeAutolocalization;

/**
 @result Return YES if object configured for automatic localization and NO otherwise.
 */
- (BOOL)isAutolocalizationEnabled;

/**
 @brief Called on DPLanguageDidChangeNotification notification.
 @discussion Invoke -[localizeWithLocalizationKey: arguments: keyPath:].
 */
- (void)localize;

/**
 @brief Perform object localization.
 @param key         The key for a string in the Localizable.strings table.
 @param arguments   List of arguments to substitute into localized string.
 @param keyPath     Keypath for assing localized value.

 @discussion Invoke -[setLocalizedValue: forKeyPath:keyPath].
 */
- (void)localizeWithLocalizationKey:(NSString *)key arguments:(NSArray *_Nullable)arguments keyPath:(NSString *)keyPath;

/**
 @brief Called before setting new value. Default implementation invoking -[self setValue:value forKeyPath:keyPath].
 @param value       Localized value.
 @param keyPath     Keypath for assing localized value.
 */
- (void)setLocalizedValue:(NSString *)value forKeyPath:(NSString *)keyPath;
@end


#if DPLocalization_UIKit

//MARK: -
//MARK: UIKit

@interface UILabel (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"text"].
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationKey;
@property (nonatomic) IBInspectable BOOL isAttributedKey;
@end

@interface UIButton (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Invoke -[self setTitle:localizedValue forState:UIControlStateNormal] on DPLanguageDidChangeNotification notification.
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationKey;
@property (nonatomic) IBInspectable BOOL isAttributedKey;
@end

@interface UIBarItem (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"title"].
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationKey;
@end

@interface UITextField (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"placeholder"].
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationKey;
@property (nonatomic) IBInspectable BOOL isAttributedKey;
@end

@interface UITextView (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"text"].
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationKey;
@property (nonatomic) IBInspectable BOOL isAttributedKey;
@end

@interface UISearchBar (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"placeholder"].
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationKey;
@end

@interface UISegmentedControl (DPLocalization)
/**
 @property autolocalizationPrefixKey
 @brief Shortcut for add automatic localization.
 @discussion Invoke -[self setTitle:DPLocalizedString({autolocalizationPrefixKey}{segment}, nil) forSegmentAtIndex:{segment}] on DPLanguageDidChangeNotification notification.
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationPrefixKey;
@end

@interface UIImageView (DPLocalization)
/**
 @property autolocalizationImageName
 @brief Shortcut for add automatic localization.
 @discussion Invoke -[self setImage:[UIImage localizedImageNamed:self.autolocalizationImageName]] on DPLanguageDidChangeNotification notification.
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationImageName;
@end

@interface UIViewController (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"title"].
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationKey;
@end

#endif


//MARK: -
//MARK: AppKit

#if DPLocalization_AppKit

@interface NSMenuItem (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"title"].
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationKey;
@property (nonatomic) IBInspectable BOOL isAttributedKey;
@end

@interface NSMenu (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"title"].
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationKey;
@end

@interface NSButton (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"title"].
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationKey;
@property (nonatomic) IBInspectable BOOL isAttributedKey;
@end

@interface NSControl (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"stringValue"].
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationKey;
@property (nonatomic) IBInspectable BOOL isAttributedKey;
@end

@interface NSTextField (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"placeholderString"].
 Cannot be mixed with -[NSControl autolocalizationKey].
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *placeholderAutolocalizationKey;
@end

@interface NSText (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"string"].
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationKey;
@end

@interface NSWindow (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@"title"].
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationKey;
@end

@interface NSImageView (DPLocalization)
/**
 @property autolocalizationImageName
 @brief Shortcut for add automatic localization.
 @discussion Invoke -[self setImage:[NSImage localizedImageNamed:self.autolocalizationImageName]] on DPLanguageDidChangeNotification notification.
 */
@property (nonatomic, copy, nullable) IBInspectable NSString *autolocalizationImageName;
@end

#endif


//MARK: -
//MARK: - Common

@interface NSBundle (DPLocalization)
/**
 @return The result is invoking of [[DPLocalizationManager currentManager] localizedPathForResource:name ofType:extension bundle:self].
 */
- (NSString *_Nullable)localizedPathForResource:(NSString *_Nullable)name ofType:(NSString *_Nullable)extension;

/**
 @return The result is invoking of [DPAutolocalizationProxy autolocalizingPathForResource:name ofType:extension inBundle:self].
 */
- (NSString *_Nullable)autolocalizingPathForResource:(NSString *_Nullable)name ofType:(NSString *_Nullable)extension;

/**
 @brief Return code for preferred application language.

 @return Return first element of [self preferredLocalizations], or [[NSBundle mainBundle] developmentLocalization] if 'preferredLocalizations' array is empty, or "en" if 'developmentLocalization' cannot be determined.
 */
- (NSString * _Nullable)preferredLanguage;
@end

@interface NSString (DPLocalization)
/**
 @return The result is invoking of [DPAutolocalizationProxy autolocalizingStringWithLocalizationKey:localizationKey]
 */
+ (NSString *)autolocalizingStringWithLocalizationKey:(NSString *)localizationKey;
@end

@interface DPImage (DPLocalization)
/**
 @return The result is invoking of [[DPLocalizationManager currentManager] localizedImageNamed:name].
 */
+ (DPImage *_Nullable)localizedImageNamed:(NSString *)name;

/**
 @return The result is invoking of [DPAutolocalizationProxy autolocalizingImageNamed:name].
 */
+ (DPImage *_Nullable)autolocalizingImageNamed:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
