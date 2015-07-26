//
//  UIKitExtensionTests.m
//  LocalizationDemo
//
//  Created by Dmitriy Petrusevich on 02/03/15.
//  Copyright (c) 2015 Dmitriy Petrusevich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DPLocalization.h"


@interface UIKitExtensionTests : XCTestCase
@end

@implementation UIKitExtensionTests

- (void)setUp {
    [super setUp];
    [[DPLocalizationManager currentManager] setDefaultStringTableName:nil];
    [[DPLocalizationManager currentManager] setCurrentLanguage:nil];
}

- (void)testAutolocalizationKey {
    XCTAssertTrue([[[DPLocalizationManager currentManager] defaultStringTableName] isEqualToString:@"Localizable"]);
    NSString *preferredLanguage = [DPLocalizationManager preferredLanguage];
    XCTAssertNotNil(preferredLanguage);

    // "TESTS_STRING" - language code
    dp_set_current_language(nil);

    @autoreleasepool {
        UILabel *label = [[UILabel alloc] init]; label.autolocalizationKey = @"TESTS_STRING";
        UIButton *buton = [UIButton buttonWithType:UIButtonTypeCustom]; buton.autolocalizationKey = @"TESTS_STRING";
        UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL]; barButton.autolocalizationKey = @"TESTS_STRING";
        UITextField *textField = [[UITextField alloc] init]; textField.autolocalizationKey = @"TESTS_STRING";
        UITextView *textView = [[UITextView alloc] init]; textView.autolocalizationKey = @"TESTS_STRING";
        UISearchBar *searchBar = [[UISearchBar alloc] init]; searchBar.autolocalizationKey = @"TESTS_STRING";
        UIViewController *viewController = [[UIViewController alloc] init]; viewController.autolocalizationKey = @"TESTS_STRING";

        XCTAssertTrue([label.text isEqualToString:preferredLanguage]);
        XCTAssertTrue([[buton titleForState:UIControlStateNormal] isEqualToString:preferredLanguage]);
        XCTAssertTrue([barButton.title isEqualToString:preferredLanguage]);
        XCTAssertTrue([textField.placeholder isEqualToString:preferredLanguage]);
        XCTAssertTrue([textView.text isEqualToString:preferredLanguage]);
        XCTAssertTrue([searchBar.placeholder isEqualToString:preferredLanguage]);
        XCTAssertTrue([viewController.title isEqualToString:preferredLanguage]);

        dp_set_current_language(@"ru");
        XCTAssertTrue([label.text isEqualToString:@"ru"]);
        XCTAssertTrue([[buton titleForState:UIControlStateNormal] isEqualToString:@"ru"]);
        XCTAssertTrue([barButton.title isEqualToString:@"ru"]);
        XCTAssertTrue([textField.placeholder isEqualToString:@"ru"]);
        XCTAssertTrue([textView.text isEqualToString:@"ru"]);
        XCTAssertTrue([searchBar.placeholder isEqualToString:@"ru"]);
        XCTAssertTrue([viewController.title isEqualToString:@"ru"]);

        dp_set_current_language(nil);
        XCTAssertTrue([label.text isEqualToString:preferredLanguage]);
        XCTAssertTrue([[buton titleForState:UIControlStateNormal] isEqualToString:preferredLanguage]);
        XCTAssertTrue([barButton.title isEqualToString:preferredLanguage]);
        XCTAssertTrue([textField.placeholder isEqualToString:preferredLanguage]);
        XCTAssertTrue([textView.text isEqualToString:preferredLanguage]);
        XCTAssertTrue([searchBar.placeholder isEqualToString:preferredLanguage]);
        XCTAssertTrue([viewController.title isEqualToString:preferredLanguage]);

        dp_set_current_language(@"de");
        XCTAssertTrue([label.text isEqualToString:@"de"]);
        XCTAssertTrue([[buton titleForState:UIControlStateNormal] isEqualToString:@"de"]);
        XCTAssertTrue([barButton.title isEqualToString:@"de"]);
        XCTAssertTrue([textField.placeholder isEqualToString:@"de"]);
        XCTAssertTrue([textView.text isEqualToString:@"de"]);
        XCTAssertTrue([searchBar.placeholder isEqualToString:@"de"]);
        XCTAssertTrue([viewController.title isEqualToString:@"de"]);
    }

    dp_set_current_language(nil);
}

@end
