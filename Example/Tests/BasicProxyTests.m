//
//  BasicProxyTests.m
//  LocalizationDemo
//
//  Created by Dmitriy Petrusevich on 02/03/15.
//  Copyright (c) 2015 Dmitriy Petrusevich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DPLocalizationManager.h"
#import "TestObject.h"


@interface BasicProxyTests : XCTestCase
@end

@implementation BasicProxyTests

- (void)setUp {
    [super setUp];
    [[DPLocalizationManager currentManager] setDefaultStringTableName:nil];
    [[DPLocalizationManager currentManager] setCurrentLanguage:nil];
}

- (void)testBasicLocalization {
    XCTAssertTrue([[[DPLocalizationManager currentManager] defaultStringTableName] isEqualToString:@"Localizable"]);
    NSString *preferredLanguage = [DPLocalizationManager preferredLanguage];
    XCTAssertNotNil(preferredLanguage);

    // "TESTS_STRING" - language code

    @autoreleasepool {
        dp_set_current_language(@"en");
        NSString *testString_1 = [DPAutolocalizationProxy autolocalizingStringWithLocalizationKey:@"TESTS_STRING"];
        NSString *testString_2 = [DPAutolocalizationProxy autolocalizingStringWithLocalizationKey:@"TESTS_STRING" tableName:@"Localizable1"];
        NSString *testPath = [DPAutolocalizationProxy autolocalizingPathForResource:@"image" ofType:@"png" inBundle:nil];

        XCTAssertTrue([testString_1 isEqualToString:@"en"]);
        XCTAssertTrue([testString_2 isEqualToString:@"en 1"]);
        XCTAssertNotEqual([testPath rangeOfString:@"en.lproj"].location, NSNotFound);
        
        testString_1 = nil;
        testString_2 = nil;
        testPath = nil;
    }

    @autoreleasepool {
        NSString *pref_lproj = [preferredLanguage stringByAppendingString:@".lproj"];
        dp_set_current_language(nil);

        TestObject *testObject = [[TestObject alloc] init];
        testObject.testString = [DPAutolocalizationProxy autolocalizingStringWithLocalizationKey:@"TESTS_STRING"];
        NSString *testPath = [DPAutolocalizationProxy autolocalizingPathForResource:@"image" ofType:@"png" inBundle:nil];
        XCTAssertTrue([testObject.testString isEqualToString:preferredLanguage]);
        XCTAssertNotEqual([testPath rangeOfString:pref_lproj].location, NSNotFound);

        dp_set_current_language(@"en");
        XCTAssertTrue([testObject.testString isEqualToString:@"en"]);
        XCTAssertNotEqual([testPath rangeOfString:@"en.lproj"].location, NSNotFound);

        dp_set_current_language(@"jp");
        XCTAssertTrue([testObject.testString isEqualToString:preferredLanguage]);
        XCTAssertNotEqual([testPath rangeOfString:pref_lproj].location, NSNotFound);

        dp_set_current_language(@"ru");
        XCTAssertTrue([testObject.testString isEqualToString:@"ru"]);
        XCTAssertNotEqual([testPath rangeOfString:@"ru.lproj"].location, NSNotFound);

        dp_set_current_language(nil);
        XCTAssertTrue([testObject.testString isEqualToString:preferredLanguage]);
        XCTAssertNotEqual([testPath rangeOfString:pref_lproj].location, NSNotFound);

        testObject = nil;
    }
}

- (void)testLocalizationArguments {
    XCTAssertTrue([[[DPLocalizationManager currentManager] defaultStringTableName] isEqualToString:@"Localizable"]);
    NSString *preferredLanguage = [DPLocalizationManager preferredLanguage];
    XCTAssertNotNil(preferredLanguage);

    NSString *proxyString = [DPAutolocalizationProxy autolocalizingStringWithLocalizationKey:@"TESTS_STRING"];
    NSArray *args = @[@1, proxyString, @3];

    @autoreleasepool {
        NSString *pref_value = [NSString stringWithFormat:@"%@ 3 1 %@", preferredLanguage, preferredLanguage];

        TestObject *testObject = [[TestObject alloc] init];
        [testObject setupAutolocalizationWithKey:@"TESTS_STRING_ARGS_2" keyPath:@"testString" arguments:args];
        XCTAssertTrue([testObject isAutolocalizationEnabled]);

        dp_set_current_language(@"en");
        XCTAssertTrue([testObject.testString isEqualToString:@"en 3 1 en"]);

        dp_set_current_language(@"ru");
        XCTAssertTrue([testObject.testString isEqualToString:@"ru 3 1 ru"]);

        dp_set_current_language(@"jp");
        XCTAssertTrue([testObject.testString isEqualToString:pref_value]);

        dp_set_current_language(@"de");
        XCTAssertTrue([testObject.testString isEqualToString:@"de 3 1 de"]);

        [testObject removeAutolocalization];

        dp_set_current_language(@"ru");
        XCTAssertTrue([testObject.testString isEqualToString:@"de 3 1 de"]);

        testObject = nil;
    }

    dp_set_current_language(nil);
}

#pragma mark -

- (void)testPostNotification {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing ... set new language \"Post Notification\" order"];

    [[DPLocalizationManager currentManager] setCurrentLanguage:nil];
    XCTAssertNil([[DPLocalizationManager currentManager] currentLanguage]);

    NSMutableString *orderString = [NSMutableString string];

    id observer1 = [[DPAutolocalizationProxy notificationCenter] addObserverForName:DPLanguageDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        [orderString appendString:@"1"];
    }];

    id observer2 = [[NSNotificationCenter defaultCenter] addObserverForName:DPLanguageDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        [orderString appendString:@"2"];
        [expectation fulfill];
    }];


    NSString *newLng = @"ru";
    [[DPLocalizationManager currentManager] setCurrentLanguage:newLng];

    [self waitForExpectationsWithTimeout:1.0 handler:^(NSError *error) {
        [[DPAutolocalizationProxy notificationCenter] removeObserver:observer1];
        [[NSNotificationCenter defaultCenter] removeObserver:observer2];

        if (error) {
            XCTFail(@"Expectation Failed with error: %@", error);
        }
        else {
            XCTAssertTrue([[[DPLocalizationManager currentManager] currentLanguage] isEqualToString:newLng]);
            XCTAssertTrue([orderString isEqualToString:@"12"]);
        }
    }];
}

@end
