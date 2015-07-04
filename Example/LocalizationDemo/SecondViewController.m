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
@property (nonatomic, strong) NSNumberFormatter *numberFormatter;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.numberFormatter = [[NSNumberFormatter alloc] init];
    self.numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;

    DPFormattedValue *numberValue = [DPFormattedValue formattedValueWithValue:@(self.stepper.value) formatter:self.numberFormatter];
    [self.countLabel updateAutolocalizationArguments:@[numberValue]];
}


- (IBAction)stepperValueChanged:(id)sender {
    DPFormattedValue *numberValue = [DPFormattedValue formattedValueWithValue:@(self.stepper.value) formatter:self.numberFormatter];
    [self.countLabel updateAutolocalizationArguments:@[numberValue]];
}

@end
