//
//  ViewController.m
//  CalculatorBootCamp
//
//  Created by Manjula Jonnalagadda on 4/29/14.
//  Copyright (c) 2014 Manjula Jonnalagadda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    NSArray *_operands;
    NSArray *_arthOperators;
    BOOL _startFresh;
    
}

@end

@implementation ViewController

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


- (IBAction)numberBtnPressed:(UIButton *)sender {
    
    if (_startFresh) {
        self.displayLabel.text=[sender currentTitle];
        _startFresh=NO;
        return;
    }
    if ([sender.currentTitle isEqualToString:@"."]) {
        NSRange range=[self.displayLabel.text rangeOfString:@"."];
        if (range.location==NSNotFound) {
            self.displayLabel.text=[NSString stringWithFormat:@"%@%@",self.displayLabel.text,[sender currentTitle]];
        }
        return;
    }
    
    if ([self.displayLabel.text isEqualToString:@"0"]) {
        
        self.displayLabel.text=[sender currentTitle];
        
    }else{
        
        self.displayLabel.text=[NSString stringWithFormat:@"%@%@",self.displayLabel.text,[sender currentTitle]];
        
    }
    
}

- (IBAction)earse:(UIButton *)sender {
    
    self.displayLabel.text=@"0";
    
}



- (IBAction)backSpace:(UIButton *)sender {
    
    if ([self.displayLabel.text length]==1) {
        self.displayLabel.text=@"0";
        return;
    }
    
    NSInteger index=[self.displayLabel.text length]-1;
    self.displayLabel.text=[self.displayLabel.text substringToIndex:index];
    
}

- (IBAction)plusMinus:(UIButton *)sender {
    
    if ([self.displayLabel.text isEqualToString:@"0"]) {
        return;
    }
    NSRange range=[self.displayLabel.text rangeOfString:@"-"];
    if (range.location!=NSNotFound) {
        self.displayLabel.text=[self.displayLabel.text substringFromIndex:1];
    }else{
        self.displayLabel.text=[NSString stringWithFormat:@"-%@",self.displayLabel.text];
       
    }
}

- (IBAction)operatorPressed:(id)sender {
    
    if ([self.displayLabel.text isEqualToString:@"0"]||_startFresh) {
        return;
    }
    
    if ([self.expressionLabel.text isEqualToString:@"0"]) {
        self.expressionLabel.text=[NSString stringWithFormat:@"%@%@",self.displayLabel.text,[sender currentTitle]];

    }else{
        self.expressionLabel.text=[NSString stringWithFormat:@"%@%@%@",self.expressionLabel.text,self.displayLabel.text,[sender currentTitle]];
       
    }
    _startFresh=YES;
    
}

- (IBAction)calculate:(UIButton *)sender {
    
    if ([self.expressionLabel.text isEqualToString:@"0"]||_startFresh) {
        return;
    }
    self.expressionLabel.text=[NSString stringWithFormat:@"%@%@",self.expressionLabel.text,self.displayLabel.text];
    NSString *expressionString=[self.expressionLabel.text stringByReplacingOccurrencesOfString:@"X" withString:@"*"];
    NSExpression *expression=[NSExpression expressionWithFormat:expressionString];
    
    NSNumber *number=[expression expressionValueWithObject:nil context:nil];
    
    
    self.displayLabel.text=[number stringValue];
    
    self.expressionLabel.text=@"0";
    _startFresh=YES;

}
@end
