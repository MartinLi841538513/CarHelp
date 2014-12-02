//
//  LoginService.m
//  ProjectModel
//
//  Created by Gao Huang on 14-11-28.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "LoginService.h"
#import "MyMD5.h"
#import <JSONModel/JSONModelLib.h>
@implementation LoginService

-(void)member_loginWithLoginname:(NSString *)loginname andPassword:(NSString *)password withDone:(doneWithObject)done{
    if ([self validateLoginInfosWithName:loginname andPasswd:password]) {
        NSString *passwd = [MyMD5 md5:password];
        NSString *urlString = [NSString stringWithFormat:LoginURL,loginname,passwd];
        [SVProgressHUD show];
        [Login getModelFromURLWithString:urlString completion:^(Login *model,JSONModelError *error){
            
            [SharedAction commonActionWithUrl:urlString andStatus:model.status andError:model.error andJSONModelError:error andObject:model.info withDone:done];
        }];
    }
}

-(void)setSharedDataWithUser:(LoginInfo *)user andUserName:(NSString *)username andPassWord:(NSString *)password{
    SharedData *sharedData = [SharedData sharedInstance];
    sharedData.user = user;
    sharedData.loginname = username;
    sharedData.password = password;
    sharedData.loginStatus = @"yes";
}

//验证登录
-(BOOL)validateLoginInfosWithName:(NSString *)name andPasswd:(NSString *)passwd{
    
    if ([name isEqualToString:@""]||name==nil) {
        [SVProgressHUD showErrorWithStatus:@"用户名不能为空"];
        return false;
    }else if([passwd isEqualToString:@""]||passwd==nil){
        [SVProgressHUD showErrorWithStatus:@"密码不能为空"];
        return false;
    }else{
        return true;
    }
}

@end
