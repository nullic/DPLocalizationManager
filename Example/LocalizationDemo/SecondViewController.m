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

    self.bundleSelector.selectedSegmentIndex = ([[DPLocalizationManager currentManager].defaultBundle isEqual:[NSBundle mainBundle]]) ? 0 : 1;
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

        default:
            break;
    }

    NSLog(@"Preffered language: %@", [[DPLocalizationManager currentManager].defaultBundle preferredLanguage]);
    NSLog(@"Selected language: %@", dp_get_current_language());
    NSLog(@"Supported language: %@", [[DPLocalizationManager currentManager].defaultBundle supportedLanguages]);
}

@end
