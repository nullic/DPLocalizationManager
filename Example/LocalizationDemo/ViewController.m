//
//  ViewController.m
//  LocalizationDemo
//
//  Created by dmitriy.petrusevich on 13.11.13.
//  Copyright (c) 2013 Dmitriy Petrusevich. All rights reserved.
//

#import "ViewController.h"
#import "DPFormattedValue.h"

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

//    NSString *alStr = [NSString autolocalizingStringWithLocalizationKey:@"TITLE"];
//    NSString *alPath = [[NSBundle mainBundle] autolocalizingPathForResource:@"Localizable" ofType:@"strings"];
//
//    dp_set_current_language(@"en");
//    CFShow((__bridge CFTypeRef)(alStr));
//    CFShow((__bridge CFTypeRef)(alPath));
//
//    dp_set_current_language(@"ru");
//    CFShow((__bridge CFTypeRef)(alStr));
//    CFShow((__bridge CFTypeRef)(alPath));
//
//    dp_set_current_language(@"de");
//    CFShow((__bridge CFTypeRef)(alStr));
//    CFShow((__bridge CFTypeRef)(alPath));

    self.imageView.autolocalizationImageName = @"image";


    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = NSDateFormatterFullStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;

    DPFormattedValue *dateValue = [DPFormattedValue formattedValueWithValue:[NSDate date] formatter:formatter];
    self.startup.text = DPLocalizedString(@"TITLE", nil);
    self.label.autolocalizationKey = @"LABEL_TEXT";
    [self.label updateAutolocalizationArguments:@[@"Hello", @12.34, dateValue]];
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
            [DPLocalizationManager currentManager].defaultStringTableName = @"Localizable";
            break;
        case 1:
            [DPLocalizationManager currentManager].defaultStringTableName = @"Localizable1";
            break;
        default:
            [DPLocalizationManager currentManager].defaultStringTableName = nil;
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
