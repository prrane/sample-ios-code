//
//  PRViewController.m
//  test-autolayout
//
//  Created by Prashant Rane on 2/20/13.
//  Copyright (c) 2013 -. All rights reserved.
//

#import "PRViewController.h"

@interface PRViewController ()

@end

@implementation PRViewController
@synthesize button1;
@synthesize button2;
@synthesize label;


- (IBAction)press1:(id)sender
{
    self.label.text = @"I am setting a long long text";
}

- (IBAction)press2:(id)sender
{
    self.label.text = @"small text";
    self.labelVerticalSpace.constant = 100;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

//    [self.view removeConstraints:self.view.constraints];

    [button1 setTitle:@"Hi This very long" forState:UIControlStateNormal];
    
//    self.view.translatesAutoresizingMaskIntoConstraints = YES;
    [self.button1 setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];

    NSDictionary* views = NSDictionaryOfVariableBindings(button1, button2, label);

    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"|-[button1(<=100@600)]"
                                             options:0 metrics:nil views:views]];
    
    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(100)-[button1]"
                                             options:0 metrics:nil views:views]];
    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:[button1]-10-[button2]"
                                             options:0 metrics:nil views:views]];
    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label(<=100@700)]"
                                             options:0 metrics:nil views:views]];

    
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button1][button2]" options:0 metrics:nil views:views]];

//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[button1][button2]" options:0 metrics:nil views:views]];
    
    
    [button2 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    printf("\n\n");
    CFShow(self.view.constraints);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_labelVerticalSpace release];
    [super dealloc];
}
@end
