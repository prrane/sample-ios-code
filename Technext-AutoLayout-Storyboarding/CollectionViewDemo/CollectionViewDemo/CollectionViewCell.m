//
//  CollectionViewCell.m
//  CollectionViewDemo
//
//  Created by Prashant Rane on 2/23/13.
//  Copyright (c) 2013 Synerzip. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        // change to our custom selected background view
        self.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end
