//
//  BasicNSObjectTests.m
//  LocalizationDemo
//
//  Created by Dmitriy Petrusevich on 02/03/15.
//  Copyright (c) 2015 Dmitriy Petrusevich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DPLocalization.h"
#import "TestObject.h"


@interface BasicNSObjectTests : XCTestCase
@end

@implementation BasicNSObjectTests

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

    dp_set_current_language(@"en");

    @autoreleasepool {
        TestObject *testObject = [[TestObject alloc] init];
        [testObject setupAutolocalizationWithKey:@"TESTS_STRING" keyPath:@"testString"];
        XCTAssertTrue([testObject isAutolocalizationEnabled]);
        XCTAssertTrue([testObject.testString isEqualToString:@"en"]);
        testObject = nil;
    }

    @autoreleasepool {
        TestObject *testObject = [[TestObject alloc] init];
        [testObject setupAutolocalizationWithKey:@"TESTS_STRING" keyPath:@"testString"];
        XCTAssertTrue([testObject isAutolocalizationEnabled]);
        XCTAssertTrue([testObject.testString isEqualToString:@"en"]);

        dp_set_current_language(@"ru");
        XCTAssertTrue([testObject.testString isEqualToString:@"ru"]);

        dp_set_current_language(@"jp");
        XCTAssertTrue([testObject.testString isEqualToString:preferredLanguage]);

        dp_set_current_language(nil);
        XCTAssertTrue([testObject.testString isEqualToString:preferredLanguage]);

        dp_set_current_language(@"de");
        XCTAssertTrue([testObject.testString isEqualToString:@"de"]);

        [testObject removeAutolocalization];
        XCTAssertFalse([testObject isAutolocalizationEnabled]);

        dp_set_current_language(@"ru");
        XCTAssertTrue([testObject.testString isEqualToString:@"de"]);

        testObject = nil;
    }

    dp_set_current_language(nil);
}

- (void)testLocalizationArguments {
    XCTAssertTrue([[[DPLocalizationManager currentManager] defaultStringTableName] isEqualToString:@"Localizable"]);
    NSString *preferredLanguage = [DPLocalizationManager preferredLanguage];
    XCTAssertNotNil(preferredLanguage);

    dp_set_current_language(@"en");
    NSArray *args = @[@1, @2, @3];
    NSArray *args_long = @[@1, @2, @3, @4, @5, @6];
    NSArray *args_short = @[@1];

    @autoreleasepool {
        TestObject *testObject = [[TestObject alloc] init];
        [testObject setupAutolocalizationWithKey:@"TESTS_STRING_ARGS_1" keyPath:@"testString" arguments:args];
        XCTAssertTrue([testObject isAutolocalizationEnabled]);
        XCTAssertTrue([testObject.testString isEqualToString:@"en 1 2 3"]);

        [testObject setupAutolocalizationWithKey:@"TESTS_STRING_ARGS_1" keyPath:@"testString" arguments:args_long];
        XCTAssertTrue([testObject isAutolocalizationEnabled]);
        XCTAssertTrue([testObject.testString isEqualToString:@"en 1 2 3"]);

        XCTAssertThrows([testObject setupAutolocalizationWithKey:@"TESTS_STRING_ARGS_1" keyPath:@"testString" arguments:args_short]);

        testObject = nil;
    }

    @autoreleasepool {
        TestObject *testObject = [[TestObject alloc] init];
        [testObject setupAutolocalizationWithKey:@"TESTS_STRING_ARGS_2" keyPath:@"testString" arguments:args];
        XCTAssertTrue([testObject isAutolocalizationEnabled]);
        XCTAssertTrue([testObject.testString isEqualToString:@"en 3 1 2"]);

        [testObject setupAutolocalizationWithKey:@"TESTS_STRING_ARGS_2" keyPath:@"testString" arguments:args_long];
        XCTAssertTrue([testObject isAutolocalizationEnabled]);
        XCTAssertTrue([testObject.testString isEqualToString:@"en 3 1 2"]);

        XCTAssertThrows([testObject setupAutolocalizationWithKey:@"TESTS_STRING_ARGS_2" keyPath:@"testString" arguments:args_short]);

        testObject = nil;
    }

    @autoreleasepool {
        TestObject *testObject = [[TestObject alloc] init];
        [testObject setupAutolocalizationWithKey:@"TESTS_STRING_ARGS_3" keyPath:@"testString" arguments:args];
        XCTAssertTrue([testObject isAutolocalizationEnabled]);
        XCTAssertTrue([testObject.testString isEqualToString:@"en 1 1 1"]);

        [testObject setupAutolocalizationWithKey:@"TESTS_STRING_ARGS_3" keyPath:@"testString" arguments:args_long];
        XCTAssertTrue([testObject isAutolocalizationEnabled]);
        XCTAssertTrue([testObject.testString isEqualToString:@"en 1 1 1"]);

        [testObject setupAutolocalizationWithKey:@"TESTS_STRING_ARGS_3" keyPath:@"testString" arguments:args_short];
        XCTAssertTrue([testObject isAutolocalizationEnabled]);
        XCTAssertTrue([testObject.testString isEqualToString:@"en 1 1 1"]);

        testObject = nil;
    }

    @autoreleasepool {
        TestObject *testObject = [[TestObject alloc] init];
        XCTAssertThrows([testObject setupAutolocalizationWithKey:@"TESTS_STRING_ARGS_4" keyPath:@"testString" arguments:args]);

        [testObject setupAutolocalizationWithKey:@"TESTS_STRING_ARGS_4" keyPath:@"testString" arguments:args_long];
        XCTAssertTrue([testObject isAutolocalizationEnabled]);
        XCTAssertTrue([testObject.testString isEqualToString:@"en 2 3 4"]);

        XCTAssertThrows([testObject setupAutolocalizationWithKey:@"TESTS_STRING_ARGS_4" keyPath:@"testString" arguments:args_short]);

        testObject = nil;
    }

    @autoreleasepool {
        TestObject *testObject = [[TestObject alloc] init];
        [testObject setupAutolocalizationWithKey:@"TESTS_STRING_ARGS_2" keyPath:@"testString" arguments:args];
        XCTAssertTrue([testObject isAutolocalizationEnabled]);
        XCTAssertTrue([testObject.testString isEqualToString:@"en 3 1 2"]);

        dp_set_current_language(@"ru");
        XCTAssertTrue([testObject.testString isEqualToString:@"ru 3 1 2"]);

        dp_set_current_language(@"de");
        XCTAssertTrue([testObject.testString isEqualToString:@"de 3 1 2"]);
    }
}


- (void)testBasicLocalizationPerformance {
    TestObject *testObject = [[TestObject alloc] init];
    [self measureBlock:^{
        for (int i = 0; i < 100; i++) {
            [testObject localizeWithLocalizationKey:@"TESTS_STRING" arguments:nil keyPath:@"testString"];
        }
    }];
}

- (void)testLocalizationArgumentsPerformance {
    TestObject *testObject = [[TestObject alloc] init];
    [self measureBlock:^{
        for (int i = 0; i < 100; i++) {
            [testObject localizeWithLocalizationKey:@"TESTS_STRING_ARGS_2" arguments:@[@1, @2, @3] keyPath:@"testString"];
        }
    }];
}

@end
