//
//  DetailViewController.h
//  CollectionViewDemo
//
//  Created by Prashant Rane on 2/23/13.
//  Copyright (c) 2013 Synerzip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
@property (strong, nonatomic) NSString *details;
@end
