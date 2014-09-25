//
//  DemoViewController.m
//  Assign 4
//
//  Created by Jake Hawkinson on 9/24/14.
//  Copyright (c) 2014 Jake Hawkinson. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

@synthesize tfA;
@synthesize tfB;
@synthesize heightLabel;
@synthesize weightLabel;
@synthesize heightUnit;
@synthesize weightUnit;
@synthesize calcButton;
@synthesize unitButton;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog( @"resigning first respond for inputTextField; Touch event!" );
    if ( ! [self isFirstResponder]) {
        if ([self.tfA isFirstResponder]) {
            [self.tfA resignFirstResponder];
        }
        if ([self.tfB isFirstResponder]) {
            [self.tfB resignFirstResponder];
        }
    }
}

- (IBAction)touchToggle:(UIButton *)sender
{
    if ([sender.currentTitle length] == 15) {
        self.toggle = 1;
        NSLog(@"%.02d", self.toggle);
        [sender setTitle:@"Change to in/lbs" forState:UIControlStateNormal];
        self.heightUnit.text = [NSString stringWithFormat:@"cm"];
        self.weightUnit.text = [NSString stringWithFormat:@"kg"];
    } else {
        self.toggle = 0;
        NSLog(@"%.02d", self.toggle);
        [sender setTitle:@"Change to cm/kg" forState:UIControlStateNormal];
        self.heightUnit.text = [NSString stringWithFormat:@"in"];
        self.weightUnit.text = [NSString stringWithFormat:@"lbs"];
    }
}

- (IBAction)touchCalculate:(UIButton *)sender
{
    float height = [self.tfA.text doubleValue];
    float weight = [self.tfB.text doubleValue];
    float convertedHeight;
    float convertedWeight;
    float heightConversion = 0.39;
    float weightConversion = 2.20;
    float bmiTotal;
    NSBundle* myMainBundle = [NSBundle mainBundle];
    NSString* otherImagePath;
    UIImage* myOtherImage;
    NSLog(@"%.02d", self.toggle);
    if (height == 0 || weight == 0) {
        self.bmiNumber.text = [NSString stringWithFormat:@"Please input"];
        self.bmiCategory.text = [NSString stringWithFormat:@"information"];
    }else{
        if (self.toggle == 0) {
            height = [self.tfA.text doubleValue];
            weight = [self.tfB.text doubleValue];
            convertedHeight = height / heightConversion / 100;
            convertedWeight = weight / weightConversion;
            bmiTotal = convertedWeight / pow(convertedHeight,2);
            NSLog(@"%.02f", bmiTotal);
            self.bmiNumber.text = [NSString stringWithFormat:@"%.02f", bmiTotal];
            if (bmiTotal < 16){
                self.bmiCategory.text = [NSString stringWithFormat:@"Severe Thinness"];
                otherImagePath = [myMainBundle pathForResource: @"underweight" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }else if (bmiTotal >= 16 && bmiTotal < 17){
                self.bmiCategory.text = [NSString stringWithFormat:@"Moderate Thinness"];
                otherImagePath = [myMainBundle pathForResource: @"underweight" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }else if(bmiTotal >=17 && bmiTotal < 18.5) {
                self.bmiCategory.text = [NSString stringWithFormat:@"Mild Thinness"];
                otherImagePath = [myMainBundle pathForResource: @"underweight" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }else if (bmiTotal >= 18.5 && bmiTotal < 25){
                self.bmiCategory.text = [NSString stringWithFormat:@"Normal"];
                otherImagePath = [myMainBundle pathForResource: @"normal" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }else if (bmiTotal >= 25 && bmiTotal < 30){
                self.bmiCategory.text = [NSString stringWithFormat:@"Overweight"];
                otherImagePath = [myMainBundle pathForResource: @"overweight" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }else if (bmiTotal >= 30 && bmiTotal < 35){
                self.bmiCategory.text = [NSString stringWithFormat:@"Moderate Obesity"];
                otherImagePath = [myMainBundle pathForResource: @"obese" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }else if (bmiTotal >= 35 && bmiTotal < 40){
                self.bmiCategory.text = [NSString stringWithFormat:@"Severe Obesity"];
                otherImagePath = [myMainBundle pathForResource: @"obese" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }else{
                self.bmiCategory.text = [NSString stringWithFormat:@"Very Severe Obesity"];
                otherImagePath = [myMainBundle pathForResource: @"obese" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }
        }else if (self.toggle == 1){
            height = [self.tfA.text doubleValue];
            weight = [self.tfB.text doubleValue];
            convertedHeight = height / 100;
            bmiTotal = weight / pow(convertedHeight, 2);
            NSLog(@"%.02f", bmiTotal);
            self.bmiNumber.text = [NSString stringWithFormat:@"%.02f", bmiTotal];
            if (bmiTotal < 16){
                self.bmiCategory.text = [NSString stringWithFormat:@"Severe Thinness"];
                otherImagePath = [myMainBundle pathForResource: @"underweight" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }else if (bmiTotal >= 16 && bmiTotal < 17){
                self.bmiCategory.text = [NSString stringWithFormat:@"Moderate Thinness"];
                otherImagePath = [myMainBundle pathForResource: @"underweight" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }else if(bmiTotal >=17 && bmiTotal < 18.5) {
                self.bmiCategory.text = [NSString stringWithFormat:@"Mild Thinness"];
                otherImagePath = [myMainBundle pathForResource: @"underweight" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }else if (bmiTotal >= 18.5 && bmiTotal < 25){
                self.bmiCategory.text = [NSString stringWithFormat:@"Normal"];
                otherImagePath = [myMainBundle pathForResource: @"normal" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }else if (bmiTotal >= 25 && bmiTotal < 30){
                self.bmiCategory.text = [NSString stringWithFormat:@"Overweight"];
                otherImagePath = [myMainBundle pathForResource: @"overweight" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }else if (bmiTotal >= 30 && bmiTotal < 35){
                self.bmiCategory.text = [NSString stringWithFormat:@"Moderate Obesity"];
                otherImagePath = [myMainBundle pathForResource: @"obese" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }else if (bmiTotal >= 35 && bmiTotal < 40){
                self.bmiCategory.text = [NSString stringWithFormat:@"Severe Obesity"];
                otherImagePath = [myMainBundle pathForResource: @"obese" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }else{
                self.bmiCategory.text = [NSString stringWithFormat:@"Very Severe Obesity"];
                otherImagePath = [myMainBundle pathForResource: @"obese" ofType: @"jpg"];
                myOtherImage = [UIImage imageWithContentsOfFile:otherImagePath];
            }
        }
    }
    self.bmiImage.image = myOtherImage;
    if ( ! [self isFirstResponder]) {
        if ([self.tfA isFirstResponder]) {
            [self.tfA resignFirstResponder];
        }
        if ([self.tfB isFirstResponder]) {
            [self.tfB resignFirstResponder];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
