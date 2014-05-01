//
//  ViewController.h
//  CalculatorBootCamp
//
//  Created by Manjula Jonnalagadda on 4/29/14.
//  Copyright (c) 2014 Manjula Jonnalagadda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *expressionLabel;

- (IBAction)numberBtnPressed:(UIButton *)sender;

- (IBAction)earse:(UIButton *)sender;
- (IBAction)backSpace:(UIButton *)sender;
- (IBAction)plusMinus:(UIButton *)sender;
- (IBAction)operatorPressed:(id)sender;
- (IBAction)calculate:(UIButton *)sender;

@end
