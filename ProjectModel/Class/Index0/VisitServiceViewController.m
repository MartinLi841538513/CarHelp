//
//  VisitServiceViewController.m
//  CarHelp
//
//  Created by Gao Huang on 14-12-2.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "VisitServiceViewController.h"
#import "VisitServiceCell.h"
@implementation VisitServiceViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.datas = [NSArray arrayWithObjects:@"整车销售",@"零配件",@"售后服务",@"信息反馈",@"整车销售",@"零配件",@"售后服务",@"信息反馈",@"整车销售",@"零配件",@"售后服务",@"信息反馈", nil];
}

#pragma UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datas.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSString *identifier = @"VisitServiceCell";
    VisitServiceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.title.text = self.datas[row];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
    
}

#pragma UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(92, 57);
}

#pragma UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    VisitServiceCell *cell = (VisitServiceCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.tag = -cell.tag;
    [self setImgViewwithCell:cell];
}

-(void)setImgViewwithCell:(VisitServiceCell *)cell{
    NSString *name = nil;
    if (cell.tag==1) {
        name = @"checked_false.png";
    }else{
        name = @"checked_true.png";
    }
    cell.checkImgView.image = [UIImage imageNamed:name];
}


@end
