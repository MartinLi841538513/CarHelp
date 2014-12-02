//
//  UserDetailViewController.h
//  ProjectModel
//
//  Created by Gao Huang on 14-11-30.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic,strong)NSArray *datas;
@property(nonatomic,strong)NSArray *subDatas;
@end
