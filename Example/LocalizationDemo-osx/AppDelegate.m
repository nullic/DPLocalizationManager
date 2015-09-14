//
//  AppDelegate.m
//  LocalizationDemo-osx
//
//  Created by Dmitriy Petrusevich on 23/02/15.
//  Copyright (c) 2015 Dmitriy Petrusevich. All rights reserved.
//

#import "AppDelegate.h"
#import "DPLocalization.h"


@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSSegmentedControl *langSelector;
@property (weak) IBOutlet NSSegmentedControl *bundleSelector;
@property (weak) IBOutlet NSTextField *label;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSLog(@"Preffered language: %@", [DPLocalizationManager preferredLanguage]);
    NSLog(@"Selected language: %@", dp_get_current_language());
    NSLog(@"Supported language: %@", [DPLocalizationManager supportedLanguages]);

    [self updateLangSelector];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(languageDidChangeNotification:) name:DPLanguageDidChangeNotification object:nil];

    [self.label updateAutolocalizationArguments:@[@"Hello", @1234567890, [NSDate date]]];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)languageDidChange:(id)sender {
    switch (self.langSelector.selectedSegment) {
        case 0:
            dp_set_current_language(@"en");
            break;
        case 1:
            dp_set_current_language(@"ru");
            break;
        case 2:
            dp_set_current_language(@"de");
            break;
        default:
            dp_set_current_language(nil);
            break;
    }
}

- (void)languageDidChangeNotification:(NSNotification *)notification {
    [self updateLangSelector];
}

- (void)updateLangSelector {
    if ([dp_get_current_language() isEqualToString:@"en"]) {
        self.langSelector.selectedSegment = 0;
    }

    if ([dp_get_current_language() isEqualToString:@"ru"]) {
        self.langSelector.selectedSegment = 1;
    }

    if ([dp_get_current_language() isEqualToString:@"de"]) {
        self.langSelector.selectedSegment = 2;
    }

    if (dp_get_current_language() == nil) {
        self.langSelector.selectedSegment = 3;
    }
}

- (IBAction)bundleDidChange:(id)sender {
    switch (self.bundleSelector.selectedSegment) {
        case 0:
            [DPLocalizationManager currentManager].defaultBundle = nil;
            break;

        case 1: {
            NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"CustomBundle"];
            [DPLocalizationManager currentManager].defaultBundle = [[NSBundle alloc] initWithPath:bundlePath];
            break;
        }

        default:
            break;
    }

    NSLog(@"Preffered language: %@", [[DPLocalizationManager currentManager].defaultBundle preferredLanguage]);
    NSLog(@"Selected language: %@", dp_get_current_language());
    NSLog(@"Supported language: %@", [[DPLocalizationManager currentManager].defaultBundle supportedLanguages]);
}

@end
