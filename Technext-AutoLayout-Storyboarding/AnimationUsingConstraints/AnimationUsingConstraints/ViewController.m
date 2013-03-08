//
//  ViewController.m
//  AnimationUsingConstraints
//
//  Created by Prashant Rane on 2/23/13.
//  Copyright (c) 2013 Synerzip. All rights reserved.
//

#import "ViewController.h"

//#define USING_FRAME

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
        
    NSLayoutConstraint* c =
    [NSLayoutConstraint constraintWithItem:self.label
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.button
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0.0];
    [self.view addConstraint:c];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_labelBottomSpaceConstraint release];
    [_label release];
    [_button release];
    [super dealloc];
}

- (IBAction)animate:(id)sender
{
#ifdef USING_FRAME
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGRect frame = self.label.frame;
                         frame.origin.y = 100;
                         self.label.frame = frame;
                     }];
#else
    // note that there is no animation for iOS
    [UIView animateWithDuration:0.5
                     animations:^{
                         [self.labelBottomSpaceConstraint
                          setConstant:400];
                     }];
#endif
}

@end
