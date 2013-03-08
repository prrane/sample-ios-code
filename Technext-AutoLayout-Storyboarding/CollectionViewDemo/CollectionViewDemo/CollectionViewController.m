//
//  CollectionViewController.m
//  CollectionViewDemo
//
//  Created by Prashant Rane on 2/23/13.
//  Copyright (c) 2013 Synerzip. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "CollectionReusableHeaderView.h"
#import "CollectionReusableFooterView.h"

#import "DetailViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil]
          forCellWithReuseIdentifier:@"CollectionViewCell"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionReusableHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionReusableHeaderView"];

    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionReusableFooterView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CollectionReusableFooterView"];
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    
    // make the cell's title the actual NSIndexPath value
    cell.label.text = [NSString stringWithFormat:@"[Row:%d, Sec:%d]", indexPath.row, indexPath.section];
    
    return cell;
}

#pragma mark Supplementary View

- (UICollectionReusableView *)collectionView: (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        CollectionReusableHeaderView* crhv =
        [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                           withReuseIdentifier:@"CollectionReusableHeaderView"
                                                  forIndexPath:indexPath];
        crhv.headerLabel.text = [NSString stringWithFormat:@"This is Header for section %d", indexPath.section];
        return crhv;
    }
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        CollectionReusableFooterView* crfv =
        [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                           withReuseIdentifier:@"CollectionReusableFooterView"
                                                  forIndexPath:indexPath];
        crfv.footerLabel.text = [NSString stringWithFormat:@"This is Footer for section %d", indexPath.section];
        
        return crfv;
    }
    return nil;
}


#pragma mark - UICollectionViewDelegateFlowLayout Protocol

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(160, 200);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 5, 10, 5);
}


#pragma mark UICollectionViewDelegate Protocol

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    printf("\n\n ********* Row: %d | Section: %d ********* \n\n", indexPath.row, indexPath.section);

    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        
        DetailViewController* dvc = (DetailViewController*)segue.destinationViewController;
        dvc.details = [NSString stringWithFormat:@"********* Row: %d ^ Section: %d *********", indexPath.row, indexPath.section];
    }
}



@end
