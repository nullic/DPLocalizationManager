//
//  ViewController.m
//  LocalizationDemo
//
//  Created by dmitriy.petrusevich on 13.11.13.
//  Copyright (c) 2013 Dmitriy Petrusevich. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UILabel *label;
@property (nonatomic, weak) IBOutlet UILabel *startup;
@property (nonatomic, weak) IBOutlet UISegmentedControl *langSelector;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.startup.text = DPLocalizedString(@"TITLE", nil);
    self.label.autolocalizationKey = @"LABEL_TEXT";
    [self.label updateAutolocalizationArguments:@[@"Hello", @1234567890, [NSDate date]]];
    self.autolocalizationKey = @"TITLE";

    if ([dp_get_current_language() isEqualToString:@"en"]) {
        self.langSelector.selectedSegmentIndex = 0;
    }

    if ([dp_get_current_language() isEqualToString:@"ru"]) {
        self.langSelector.selectedSegmentIndex = 1;
    }

    if ([dp_get_current_language() isEqualToString:@"de"]) {
        self.langSelector.selectedSegmentIndex = 2;
    }

    if (dp_get_current_language() == nil) {
        self.langSelector.selectedSegmentIndex = 3;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)languageChangeAction:(id)sender {
    switch (self.langSelector.selectedSegmentIndex) {
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

@end
