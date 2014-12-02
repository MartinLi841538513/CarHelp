//
//  VisitServiceViewController.h
//  CarHelp
//
//  Created by Gao Huang on 14-12-2.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VisitServiceViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;
@property(nonatomic,strong)NSArray *datas;
@end
