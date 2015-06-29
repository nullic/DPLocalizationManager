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
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.countLabel updateAutolocalizationArguments:@[[NSNumber numberWithInt:self.stepper.value]]];
}


- (IBAction)stepperValueChanged:(id)sender {
    [self.countLabel updateAutolocalizationArguments:@[[NSNumber numberWithInt:self.stepper.value]]];
}

@end
