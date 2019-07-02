//
//  DPLocalizationBundle.m
//  LocalizationDemo
//
//  Created by Dmitriy Petrusevich on 15/09/15.
//  Copyright © 2015 Dmitriy Petrusevich. All rights reserved.
//

#import "DPLocalizationBundle.h"

@implementation DPLocalizationBundle

+ (instancetype)defaultBundle {
    @synchronized([DPLocalizationBundle class]) {
        static DPLocalizationBundle *bundle = nil;

        if (bundle == nil) {
            NSString *appSupp = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES)[0];
            NSString *fullPath = [appSupp stringByAppendingPathComponent:@"ind.dmitriy-petrusevich.localization"];

            if ([[NSFileManager defaultManager] fileExistsAtPath:fullPath] == NO) {
                NSError *error = nil;
                [[NSFileManager defaultManager] createDirectoryAtPath:fullPath withIntermediateDirectories:YES attributes:nil error:&error];
                NSAssert(error == nil, @"Unexpected error: %@", error);
            }

            bundle = [self bundleWithPath:fullPath];
        }

        return bundle;
    }
}

- (BOOL)setStringsTable:(NSDictionary *)table withName:(NSString *)tableName language:(NSString *)languageCode error:(NSError **)inout_error {
    @synchronized([DPLocalizationBundle class]) {
        NSError *error = nil;

        NSString *filename = [(tableName ?: @"Localizable") stringByAppendingString:@".strings"];
        NSString *fullFolderPath = self.bundlePath;

        if (languageCode) {
            NSString *langFolder = [languageCode stringByAppendingString:@".lproj"];
            fullFolderPath = [fullFolderPath stringByAppendingPathComponent:langFolder];
        }

        NSString *fullFilePath = [fullFolderPath stringByAppendingPathComponent:filename];

        if (table) {
            if ([[NSFileManager defaultManager] fileExistsAtPath:fullFolderPath] == NO) {
                [[NSFileManager defaultManager] createDirectoryAtPath:fullFolderPath withIntermediateDirectories:YES attributes:nil error:&error];
            }

            if (error == nil && [[NSFileManager defaultManager] fileExistsAtPath:fullFilePath]) {
                [[NSFileManager defaultManager] removeItemAtPath:fullFilePath error:&error];
            }

            if (error == nil) {
                NSString *strings = [table descriptionInStringsFileFormat];
                [strings writeToFile:fullFilePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
            }
        }
        else {
            if ([[NSFileManager defaultManager] fileExistsAtPath:fullFilePath]) {
                [[NSFileManager defaultManager] removeItemAtPath:fullFilePath error:&error];
            }
        }


        if (inout_error && error) *inout_error = error;
        return (error == nil);
    }
}

- (NSDictionary *)stringsTableWithName:(NSString *)tableName language:(NSString *)languageCode {
    @synchronized([DPLocalizationBundle class]) {
        NSString *filename = [(tableName ?: @"Localizable") stringByAppendingString:@".strings"];
        NSString *fullFolderPath = self.bundlePath;

        if (languageCode) {
            NSString *langFolder = [languageCode stringByAppendingString:@".lproj"];
            fullFolderPath = [fullFolderPath stringByAppendingPathComponent:langFolder];
        }
        
        NSString *fullFilePath = [fullFolderPath stringByAppendingPathComponent:filename];
        return [NSDictionary dictionaryWithContentsOfFile:fullFilePath];
    }
}

@end
