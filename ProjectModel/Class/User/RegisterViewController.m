//
//  RegisterViewController.m
//  ProjectModel
//
//  Created by Gao Huang on 14-11-28.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterService.h"
#import "WebViewController.h"
@interface RegisterViewController ()
{
    RegisterService *service;
}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    service = [[RegisterService alloc] init];
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
- (IBAction)sendCode:(id)sender {
    [service valicodeWithLoginname:self.tel.text withDone:^(Result *model){
    }];
}
- (IBAction)brownProtocolAction:(id)sender {
    WebViewController *target = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
    target.hidesBottomBarWhenPushed = YES;
    target.urlString = AgreeURL;
    target.title = @"注册协议";
    [self.navigationController pushViewController:target animated:YES];
}
- (IBAction)checkAction:(id)sender {
    self.checkButton.tag = -self.checkButton.tag;
    if (self.checkButton.tag==1) {
        [self.checkButton setImage:[UIImage imageNamed:@"checked_true.png"] forState:UIControlStateNormal];
    }else if(self.checkButton.tag == -1){
        [self.checkButton setImage:[UIImage imageNamed:@"checked_false.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)registerAction:(id)sender {
    [service registWithLoginname:self.tel.text andPassword:self.password.text andPasswd:self.confirmPw.text andCode:self.code.text andCheckButtonTag:self.checkButton.tag withDone:^(Result *model){
    }];
}

@end
