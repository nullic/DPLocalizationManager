//
//  BasicManagerTests.m
//  LocalizationDemo
//
//  Created by Dmitriy Petrusevich on 02/03/15.
//  Copyright (c) 2015 Dmitriy Petrusevich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DPLocalization.h"


@interface BasicManagerTests : XCTestCase
@end

@implementation BasicManagerTests

- (void)setUp {
    [super setUp];
    [[DPLocalizationManager currentManager] setDefaultStringTableName:nil];
    [[DPLocalizationManager currentManager] setCurrentLanguage:nil];
}

- (void)testSupportedAndPreferredLanguages {
    NSArray *supportedLanguages = [DPLocalizationManager supportedLanguages];
    XCTAssertNotNil(supportedLanguages);

    XCTAssertTrue([supportedLanguages containsObject:@"en"]);
    XCTAssertTrue([supportedLanguages containsObject:@"ru"]);
    XCTAssertTrue([supportedLanguages containsObject:@"de"]);

    NSString *preferredLanguage = [DPLocalizationManager preferredLanguage];
    XCTAssertNotNil(preferredLanguage);

    NSString *localeLang = [[NSLocale preferredLanguages] firstObject];
    if ([localeLang isEqualToString:@"en"]) {
        XCTAssertTrue([preferredLanguage isEqualToString:@"en"]);
    }
    else if ([localeLang isEqualToString:@"ru"]) {
        XCTAssertTrue([preferredLanguage isEqualToString:@"ru"]);
    }
    else if ([localeLang isEqualToString:@"de"]) {
        XCTAssertTrue([preferredLanguage isEqualToString:@"de"]);
    }
}

#pragma mark - Localization

- (void)testLocalizedStringsTables {
    NSString *preferredLanguage = [DPLocalizationManager preferredLanguage];
    XCTAssertNotNil(preferredLanguage);

    [DPLocalizationManager currentManager].defaultBundle = nil;
    XCTAssertEqualObjects([DPLocalizationManager currentManager].defaultBundle, [NSBundle mainBundle]);

// "TESTS_STRING" - language code + " 1"

    [[DPLocalizationManager currentManager] setDefaultStringTableName:@"Localizable1"];

    dp_set_current_language(nil);
    XCTAssertNil(dp_get_current_language());
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:[preferredLanguage stringByAppendingString:@" 1"]]);

    dp_set_current_language(@"en");
    XCTAssertTrue([dp_get_current_language() isEqualToString:@"en"]);
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:@"en 1"]);

    dp_set_current_language(@"ru");
    XCTAssertTrue([dp_get_current_language() isEqualToString:@"ru"]);
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:@"ru 1"]);

    dp_set_current_language(nil);
    XCTAssertNil(dp_get_current_language());
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:[preferredLanguage stringByAppendingString:@" 1"]]);

    dp_set_current_language(@"de");
    XCTAssertTrue([dp_get_current_language() isEqualToString:@"de"]);
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:@"de 1"]);

// "TESTS_STRING" - language code

    [[DPLocalizationManager currentManager] setDefaultStringTableName:nil];

    dp_set_current_language(nil);
    XCTAssertNil(dp_get_current_language());
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:preferredLanguage]);

    dp_set_current_language(@"en");
    XCTAssertTrue([dp_get_current_language() isEqualToString:@"en"]);
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:@"en"]);

    dp_set_current_language(@"ru");
    XCTAssertTrue([dp_get_current_language() isEqualToString:@"ru"]);
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:@"ru"]);

    dp_set_current_language(nil);
    XCTAssertNil(dp_get_current_language());
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:preferredLanguage]);

    dp_set_current_language(@"de");
    XCTAssertTrue([dp_get_current_language() isEqualToString:@"de"]);
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:@"de"]);
}

- (void)testLocalizedStringsBundles {
    NSString *preferredLanguage = [DPLocalizationManager preferredLanguage];
    XCTAssertNotNil(preferredLanguage);

    NSString *bundlePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"CustomBundle"];
    [DPLocalizationManager currentManager].defaultBundle = [[NSBundle alloc] initWithPath:bundlePath];
    XCTAssertEqualObjects(([DPLocalizationManager currentManager].defaultBundle.bundlePath), bundlePath);

    // "TESTS_STRING" - language code + " 1"

    [[DPLocalizationManager currentManager] setDefaultStringTableName:@"Localizable1"];

    dp_set_current_language(nil);
    XCTAssertNil(dp_get_current_language());
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:[preferredLanguage stringByAppendingString:@" 1 b2"]]);

    dp_set_current_language(@"en");
    XCTAssertTrue([dp_get_current_language() isEqualToString:@"en"]);
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:@"en 1 b2"]);

    dp_set_current_language(@"ru");
    XCTAssertTrue([dp_get_current_language() isEqualToString:@"ru"]);
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:@"ru 1 b2"]);

    dp_set_current_language(nil);
    XCTAssertNil(dp_get_current_language());
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:[preferredLanguage stringByAppendingString:@" 1 b2"]]);

    dp_set_current_language(@"de");
    XCTAssertTrue([dp_get_current_language() isEqualToString:@"de"]);
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:@"de 1 b2"]);

    // "TESTS_STRING" - language code

    [[DPLocalizationManager currentManager] setDefaultStringTableName:nil];

    dp_set_current_language(nil);
    XCTAssertNil(dp_get_current_language());
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:[preferredLanguage stringByAppendingString:@" b2"]]);

    dp_set_current_language(@"en");
    XCTAssertTrue([dp_get_current_language() isEqualToString:@"en"]);
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:@"en b2"]);

    dp_set_current_language(@"ru");
    XCTAssertTrue([dp_get_current_language() isEqualToString:@"ru"]);
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:@"ru b2"]);

    dp_set_current_language(nil);
    XCTAssertNil(dp_get_current_language());
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:[preferredLanguage stringByAppendingString:@" b2"]]);

    dp_set_current_language(@"de");
    XCTAssertTrue([dp_get_current_language() isEqualToString:@"de"]);
    XCTAssertTrue([DPLocalizedString(@"TESTS_STRING", nil) isEqualToString:@"de b2"]);


    // Rollback defaultBundle and check changes
    [self testLocalizedStringsTables];
}

- (void)testLocalizedPath {
    DPLocalizationManager *manager = [DPLocalizationManager currentManager];
    NSString *preferredLocation = [[DPLocalizationManager preferredLanguage] stringByAppendingString:@".lproj"];
    XCTAssertNotNil(preferredLocation);

    dp_set_current_language(nil);
    XCTAssertNil(dp_get_current_language());
    XCTAssertNotEqual([[manager localizedPathForResource:@"image" ofType:@"png" bundle:nil] rangeOfString:preferredLocation].location, NSNotFound);

    dp_set_current_language(@"en");
    XCTAssertTrue([dp_get_current_language() isEqualToString:@"en"]);
    XCTAssertNotEqual([[manager localizedPathForResource:@"image" ofType:@"png" bundle:nil] rangeOfString:@"en.lproj"].location, NSNotFound);

    dp_set_current_language(@"ru");
    XCTAssertTrue([dp_get_current_language() isEqualToString:@"ru"]);
    XCTAssertNotEqual([[manager localizedPathForResource:@"image" ofType:@"png" bundle:nil] rangeOfString:@"ru.lproj"].location, NSNotFound);

    dp_set_current_language(nil);
    XCTAssertNil(dp_get_current_language());
    XCTAssertNotEqual([[manager localizedPathForResource:@"image" ofType:@"png" bundle:nil] rangeOfString:preferredLocation].location, NSNotFound);

    dp_set_current_language(@"de");
    XCTAssertTrue([dp_get_current_language() isEqualToString:@"de"]);
    XCTAssertNotEqual([[manager localizedPathForResource:@"image" ofType:@"png" bundle:nil] rangeOfString:@"de.lproj"].location, NSNotFound);
}

#pragma mark - Notifications

- (void)testSetLanguagePostNotifications {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing ... set new language \"Post Notification\""];

    [[DPLocalizationManager currentManager] setCurrentLanguage:nil];
    XCTAssertNil([[DPLocalizationManager currentManager] currentLanguage]);

    id observer = [[NSNotificationCenter defaultCenter] addObserverForName:DPLanguageDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        [expectation fulfill];
    }];


    NSString *newLng = @"en";
    [[DPLocalizationManager currentManager] setCurrentLanguage:newLng];

    [self waitForExpectationsWithTimeout:1.0 handler:^(NSError *error) {
        [[NSNotificationCenter defaultCenter] removeObserver:observer];

        if (error) {
            XCTFail(@"Expectation Failed with error: %@", error);
        }
        else {
            XCTAssertTrue([[[DPLocalizationManager currentManager] currentLanguage] isEqualToString:newLng]);
        }
    }];
}

- (void)testSetStringsTablePostNotifications {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing ... set default string table name \"Post Notification\""];

    [[DPLocalizationManager currentManager] setDefaultStringTableName:nil];
    XCTAssertTrue([[[DPLocalizationManager currentManager] defaultStringTableName] isEqualToString:@"Localizable"]);

    id observer = [[NSNotificationCenter defaultCenter] addObserverForName:DPLanguageDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        [expectation fulfill];
    }];


    NSString *newTbl = @"Localizable 123";
    [[DPLocalizationManager currentManager] setDefaultStringTableName:newTbl];

    [self waitForExpectationsWithTimeout:1.0 handler:^(NSError *error) {
        [[NSNotificationCenter defaultCenter] removeObserver:observer];

        if (error) {
            XCTFail(@"Expectation Failed with error: %@", error);
        }
        else {
            XCTAssertTrue([[[DPLocalizationManager currentManager] defaultStringTableName] isEqualToString:newTbl]);
        }
    }];
}

@end
