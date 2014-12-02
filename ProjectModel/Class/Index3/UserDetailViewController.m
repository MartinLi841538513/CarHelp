//
//  UserDetailViewController.m
//  ProjectModel
//
//  Created by Gao Huang on 14-11-30.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "UserDetailViewController.h"
#import "LoginViewController.h"
#import "UserDetailCell.h"
#import "UserImgCell.h"
#import "UpdateModel1ViewController.h"
#import "UpdateModel3ViewController.h"
#import "UpdateModel2ViewController.h"
@interface UserDetailViewController ()<LoginViewControllerDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation UserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.datas = [NSArray arrayWithObjects:@"修改头像",@"姓名",@"电话",@"地址",@"修改密码", nil];
    self.subDatas = [NSArray arrayWithObjects:@"MartinLi",@"18613961267",@"湖南大学天马学生公寓",@"", nil];
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
- (IBAction)logoutAction:(id)sender {
    [SharedAction presentLoginViewControllerInViewController:self];
    SharedData *sharedData = [SharedData sharedInstance];
    sharedData.loginStatus = @"no";
}

#pragma UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    
    if (row==0) {
        UserImgCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserImgCell" forIndexPath:indexPath];
        cell.label.text = self.datas[row];
        return cell;
    }else{
        UserDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserDetailCell" forIndexPath:indexPath];
        cell.label.text = self.datas[row];
        cell.content.text = self.subDatas[row-1];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = [indexPath row];
    NSString *identifier = nil;
    if (row==0) {
        identifier = @"UpdateModel1ViewController";
    }else if(row==1){
        identifier = @"UpdateModel2ViewController";
    }else if(row==2){
        identifier = @"UpdateModel2ViewController";
    }else if(row==3){
        identifier = @"UpdateModel2ViewController";
    }else if(row==4){
        identifier = @"UpdateModel3ViewController";
    }
    UIViewController *target = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    target.title = self.datas[row];
    [self.navigationController pushViewController:target animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if (row==0) {
        return 76;
    }else{
        return 56;
    }
}

#pragma LoginViewControllerDelegate
-(void)loginSuccessedInLoginViewController:(UIViewController *)loginViewController{
    [self loadDataInView];
}

-(void)loadDataInView{
    NSLog(@"loadDataInView");
}

@end
