//
//  LoginViewController.m
//  ProjectModel
//
//  Created by Gao Huang on 14-11-28.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginService.h"
#import "Login.h"
@interface LoginViewController ()
{
    LoginService *loginService;

}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    loginService = [[LoginService alloc] init];
//    self.view.translatesAutoresizingMaskIntoConstraints = NO;
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
- (IBAction)loginAction:(id)sender {
    NSString *name = self.username.text;
    NSString *passwd = self.password.text;
    [loginService member_loginWithLoginname:name andPassword:passwd withDone:^(LoginInfo *info){
        [loginService setSharedDataWithUser:info andUserName:name andPassWord:passwd];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        [self.delegate loginSuccessedInLoginViewController:self];
    }];
}
- (IBAction)forgetPasswordAction:(id)sender {
    [SVProgressHUD showWithStatus:@"请联系客服找回密码"];
}

#pragma RegisterViewControllerDelegate
//注册成功回调方法
-(void)registerSuccessWithLoginname:(NSString *)name andPasswd:(NSString *)passwd{
    self.username.text = name;
    self.password.text = passwd;
}

@end
