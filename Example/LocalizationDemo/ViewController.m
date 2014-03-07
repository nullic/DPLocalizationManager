//
//  ViewController.m
//  LocalizationDemo
//
//  Created by dmitriy.petrusevich on 13.11.13.
//  Copyright (c) 2013 Dmitriy Petrusevich. All rights reserved.
//

#import "ViewController.h"
#import "DPAutolocalizationProxy.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UILabel *label;
@property (nonatomic, weak) IBOutlet UILabel *startup;
@property (nonatomic, weak) IBOutlet UISegmentedControl *langSelector;
@property (nonatomic, weak) IBOutlet UISegmentedControl *fileSelector;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView.autolocalizationImageName = @"image";

    self.startup.text = DPLocalizedString(@"TITLE", nil);
    self.label.autolocalizationKey = @"LABEL_TEXT";
    [self.label updateAutolocalizationArguments:@[@"Hello", @1234567890, [NSDate date]]];
    self.autolocalizationKey = @"TITLE";

    NSLog(@"Preffered language: %@", [DPLocalizationManager preferredLanguage]);
    NSLog(@"Selected language: %@", dp_get_current_language());

    [self updateLangSelector];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(languageDidChangeNotification:) name:DPLanguageDidChangeNotification object:nil];
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

- (IBAction)localizationFileChangeName:(id)sender
{
    switch (self.fileSelector.selectedSegmentIndex) {
        case 0:
            dp_set_current_filename(@"Localizable");
            break;
        case 1:
            dp_set_current_filename(@"Localizable1");
            break;
        default:
            dp_set_current_filename(nil);
            break;
    }
}

- (void)languageDidChangeNotification:(NSNotification *)notification {
    [self updateLangSelector];
}

- (void)updateLangSelector {
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

@end
