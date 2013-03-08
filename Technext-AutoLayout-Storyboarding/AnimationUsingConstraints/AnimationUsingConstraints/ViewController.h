//
//  ViewController.h
//  AnimationUsingConstraints
//
//  Created by Prashant Rane on 2/23/13.
//  Copyright (c) 2013 Synerzip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet
NSLayoutConstraint *labelBottomSpaceConstraint;

@property (retain, nonatomic) IBOutlet UILabel *label;
@property (retain, nonatomic) IBOutlet UIView *button;

@end
