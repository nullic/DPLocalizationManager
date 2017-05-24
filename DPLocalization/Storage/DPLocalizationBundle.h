//
//  DPLocalizationBundle.h
//  LocalizationDemo
//
//  Created by Dmitriy Petrusevich on 15/09/15.
//  Copyright © 2015 Dmitriy Petrusevich. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 @class DPLocalizationBundle
 @brief Helper class used for store localization strings.
 */
@interface DPLocalizationBundle : NSBundle
/**
 @brief Returns shared DPLocalizationBundle object.

 @return Returns instance used for store locazition strings.
 */
+ (instancetype _Nonnull)defaultBundle;

/**
 @brief Save/Remove strings table.
 
 @param table           Stings table. Table must contain only strings.
 @param tableName       Name of strings table. "Localizable" - if value is 'nil'
 @param languageCode    Language codes (i.e.: "en", "ru", "fr" and etc.)
 @param error           If an error occurs, this pointer is set to an actual error object containing the error information.
 
 @return 'YES' if operation operation was succeeded.
 */
- (BOOL)setStringsTable:(NSDictionary *_Nullable)table withName:(NSString *_Nullable)tableName language:(NSString *_Nullable)languageCode error:(NSError *_Nullable*_Nullable)error;

/**
 @param tableName       Name of strings table. "Localizable" - if value is 'nil'
 @param languageCode    Language codes (i.e.: "en", "ru", "fr" and etc.)

 @return Strings table if exist.
 */
- (NSDictionary *_Nullable)stringsTableWithName:(NSString *_Nullable)tableName language:(NSString *_Nullable)languageCode;

@end

