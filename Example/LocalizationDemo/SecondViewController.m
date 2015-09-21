//
//  SecondViewController.m
//  LocalizationDemo
//
//  Created by Dmitriy Petrusevich on 22/06/15.
//  Copyright (c) 2015 Dmitriy Petrusevich. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic, weak) IBOutlet UILabel *countLabel;
@property (nonatomic, weak) IBOutlet UIStepper *stepper;
@property (nonatomic, weak) IBOutlet UISegmentedControl *bundleSelector;
@property (nonatomic, strong) NSNumberFormatter *numberFormatter;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.numberFormatter = [[NSNumberFormatter alloc] init];
    self.numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;

    DPFormattedValue *numberValue = [DPFormattedValue formattedValueWithValue:@(self.stepper.value) formatter:self.numberFormatter];
    [self.countLabel updateAutolocalizationArguments:@[numberValue]];


    if ([[DPLocalizationManager currentManager].defaultBundle isEqual:[NSBundle mainBundle]] == YES) {
        self.bundleSelector.selectedSegmentIndex = 0;
    }
    else if ([[DPLocalizationManager currentManager].defaultBundle isKindOfClass:[DPLocalizationBundle class]] == YES) {
        self.bundleSelector.selectedSegmentIndex = 2;
    }
    else {
        self.bundleSelector.selectedSegmentIndex = 1;
    }
}

- (IBAction)stepperValueChanged:(id)sender {
    DPFormattedValue *numberValue = [DPFormattedValue formattedValueWithValue:@(self.stepper.value) formatter:self.numberFormatter];
    [self.countLabel updateAutolocalizationArguments:@[numberValue]];
}

- (IBAction)bundleDidChange:(id)sender {
    switch (self.bundleSelector.selectedSegmentIndex) {
        case 0:
            [DPLocalizationManager currentManager].defaultBundle = nil;
            break;

        case 1: {
            NSString *bundlePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"CustomBundle"];
            [DPLocalizationManager currentManager].defaultBundle = [[NSBundle alloc] initWithPath:bundlePath];
            break;
        }

        case 2: {
            DPLocalizationBundle *bundle = [DPLocalizationBundle defaultBundle];
            NSDictionary *table = [bundle stringsTableWithName:nil language:@"en"];

            NSError *error = nil;
            table = @{
                      @"TITLE": @"Runtime",
                      @"LABEL_TEXT": @"Runtime - <traits=ibus size=12>{%1$@}\n%2$@\n<names=\"Courier-BoldOblique\" color=12,56,189>{%3$@}",
                      @"TEXTVIEW_TEXT": @"Runtime\n\nUITextView text. <link=\"https://github.com/nullic/DPLocalizationManager\" traits=b>{link to DPLocalizationManager} ",
                      };
            [bundle setStringsTable:table withName:nil language:@"en" error:&error];

            table = @{
                      @"TITLE": @"Русский",
                      @"LABEL_TEXT": @"Русский - %1$@\n%2$@\n%3$@",
                      @"TEXTVIEW_TEXT": @"Русский\n\n<link=\"https://github.com/nullic/DPLocalizationManager\" traits=b>{смотри сюда} ",
                      };
            [bundle setStringsTable:table withName:nil language:@"ru" error:&error];

            [DPLocalizationManager currentManager].defaultBundle = bundle;
        }

        default:
            break;
    }

    NSLog(@"Preffered language: %@", [[DPLocalizationManager currentManager].defaultBundle preferredLanguage]);
    NSLog(@"Selected language: %@", dp_get_current_language());
    NSLog(@"Supported language: %@", [[DPLocalizationManager currentManager].defaultBundle localizations]);
}

@end
