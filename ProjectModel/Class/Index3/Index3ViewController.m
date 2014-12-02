//
//  Index3ViewController.m
//  ProjectModel
//
//  Created by Gao Huang on 14-11-28.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "Index3ViewController.h"
#import "TitleCell.h"
#import "DetailTitleCell.h"
#import <UMFeedback.h>
@interface Index3ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation Index3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.detailTitles = [NSArray arrayWithObjects:@"优惠券",@"应用推荐",@"联系我们",@"意见反馈",@"版本更新", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        return self.detailTitles.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    
    if (section==0) {
        DetailTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailTitleCell" forIndexPath:indexPath];
        return cell;
    }else{
        TitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TitleCell" forIndexPath:indexPath];
        NSInteger row = indexPath.row;
        cell.title.text = self.detailTitles[row];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    if (section==0) {
        return 74;
    }else{
        return 51;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    UIViewController *target = nil;
    NSString *identifier=nil;
    if (section==0) {
        identifier = @"UserDetailViewController";
    }else{
        if (row==0) {
            identifier = @"DiscountViewController";
        }else if(row==1){
            identifier = @"AppViewController";
        }else if(row==2){
            [SharedAction callWithNumber:@"18613961267" inView:self.view];
        }else if(row==3){
            UIViewController *target = [UMFeedback feedbackViewController];
            target.hidesBottomBarWhenPushed = YES;
            target.title = @"用户反馈";
            [self.navigationController pushViewController:target
                                                 animated:YES];
        }else if(row==4){
            [SVProgressHUD showSuccessWithStatus:@"已是最新版本"];
        }
    }
    
    if (identifier!=nil) {
        target = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        target.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:target animated:YES];
    }
    
}


@end
