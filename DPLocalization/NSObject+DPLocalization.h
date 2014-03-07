//
//  NSObject+DPLocalization.h
//  DP Commons
//
//  Created by dmitriy.petrusevich on 21.08.13.
//  Copyright (c) 2013 Dmitriy Petrusevich. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @category NSObject (DPLocalization)
 @brief Add ability to automatic localization.
 */
@interface NSObject (DPLocalization)
/**
 @brief Setup update value automaticaly after DPLanguageDidChangeNotification notification was posted.
 @param key The key for a string in the Localizable.strings table.
 @param keyPath Keypath for assing localized value.
 @discussion Equal to invoking -[self setupAutolocalizationWithKey:key keyPath:keyPath].
 */
- (void)setupAutolocalizationWithKey:(NSString *)key keyPath:(NSString *)keyPath;

/**
 @brief Setup update value automaticaly after DPLanguageDidChangeNotification notification was posted.
 @param key The key for a string in the Localizable.strings table.
 @param keyPath Keypath for assing localized value.
 @param arguments List of arguments to substitute into localized string.
 */
- (void)setupAutolocalizationWithKey:(NSString *)key keyPath:(NSString *)keyPath arguments:(NSArray *)arguments;

/**
 @brief Update list of arguments to substitute into localized string.
 @param arguments List of arguments to substitute into localized string.
 */
- (void)updateAutolocalizationArguments:(NSArray *)arguments;

/**
 @brief Remove object updating on DPLanguageDidChangeNotification notification.
 */
- (void)removeAutolocalization;

/**
 @result Return YES if object configured for automatic localization and NO otherwise.
 */
- (BOOL)isAutolocalizationEnabled;
@end


// UIKit

@interface UILabel (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@@"text"].
 */
@property (nonatomic, copy) NSString *autolocalizationKey;
@end

@interface UIButton (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Invoke -[self setTitle:localizedValue forState:UIControlStateNormal] on DPLanguageDidChangeNotification notification.
 */
@property (nonatomic, copy) NSString *autolocalizationKey;
@end

@interface UIBarButtonItem (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@@"title"].
 */
@property (nonatomic, copy) NSString *autolocalizationKey;
@end

@interface UITextField (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@@"placeholder"].
 */
@property (nonatomic, copy) NSString *autolocalizationKey;
@end

@interface UITextView (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@@"text"].
 */
@property (nonatomic, copy) NSString *autolocalizationKey;
@end

@interface UIImageView (DPLocalization)
/**
 @property autolocalizationImageName
 @brief Shortcut for add automatic localization.
 @discussion Invoke -[self setImage:[UIImage localizedImageNamed:self.autolocalizationImageName]] on DPLanguageDidChangeNotification notification.
 */
@property (nonatomic, copy) NSString *autolocalizationImageName;
@end

@interface UIViewController (DPLocalization)
/**
 @property autolocalizationKey
 @brief Shortcut for add automatic localization.
 @discussion Set value equal to invoking -[self setupAutolocalizationWithKey:autolocalizationKey keyPath:@@"title"].
 */
@property (nonatomic, copy) NSString *autolocalizationKey;
@end

@interface UIImage (DPLocalization)
/**
 @return The result is invoking of [[DPLocalizationManager currentManager] localizedImageNamed:name].
 */
+ (UIImage *)localizedImageNamed:(NSString *)name;

/**
 @return The result is invoking of [DPAutolocalizationProxy autolocalizingImageNamed:name].
 */
+ (UIImage *)autolocalizingImageNamed:(NSString *)name;
@end


// Core Foundation

@interface NSBundle (DPLocalization)
/**
 @return The result is invoking of [[DPLocalizationManager currentManager] localizedPathForResource:name ofType:extension bundle:self].
 */
- (NSString *)localizedPathForResource:(NSString *)name ofType:(NSString *)extension;
@end

@interface NSString (DPLocalization)
/**
 @return The result is invoking of [DPAutolocalizationProxy autolocalizingStringWithLocalizationKey:localizationKey]
 */
+ (NSString *)autolocalizingStringWithLocalizationKey:(NSString *)localizationKey;
@end
