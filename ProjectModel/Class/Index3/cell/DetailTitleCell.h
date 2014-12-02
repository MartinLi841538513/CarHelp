//
//  DetailTitleCell.h
//  ProjectModel
//
//  Created by Gao Huang on 14-11-30.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTitleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detailTitle;

@end
