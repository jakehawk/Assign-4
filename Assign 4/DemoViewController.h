//
//  DemoViewController.h
//  Assign 4
//
//  Created by Jake Hawkinson on 9/24/14.
//  Copyright (c) 2014 Jake Hawkinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoViewController : UIViewController
{
    UIImageView* _myImageView;
}

@property (weak, nonatomic) IBOutlet UITextField *tfA;
@property (weak, nonatomic) IBOutlet UITextField *tfB;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightUnit;
@property (weak, nonatomic) IBOutlet UILabel *weightUnit;
@property (weak, nonatomic) IBOutlet UIButton *unitButton;
@property (weak, nonatomic) IBOutlet UIButton *calcButton;
@property (nonatomic) int toggle;
@property (weak, nonatomic) IBOutlet UILabel *bmiNumber;
@property (weak, nonatomic) IBOutlet UILabel *bmiCategory;
@property (weak, nonatomic) IBOutlet UIImageView *bmiImage;

@end
