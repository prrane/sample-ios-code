//
//  PRViewController.h
//  test-autolayout
//
//  Created by Prashant Rane on 2/20/13.
//  Copyright (c) 2013 ExamSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PRViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIButton *button1;
@property (retain, nonatomic) IBOutlet UIButton *button2;
@property (retain, nonatomic) IBOutlet UILabel *label;
@property (retain, nonatomic) IBOutlet NSLayoutConstraint *labelVerticalSpace;
@end
