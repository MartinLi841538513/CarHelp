//
//  ValicodeService.m
//  ProjectModel
//
//  Created by Gao Huang on 14-11-30.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "RegisterService.h"
#import "Result.h"
#import <JSONModel/JSONModelLib.h>
#import "NSString+ML.h"
@implementation RegisterService

-(void)valicodeWithLoginname:(NSString *)loginname withDone:(doneWithObject)done{
    NSString *urlString = [NSString stringWithFormat:ValicodeURL,loginname];
    [SVProgressHUD show];
    [Result getModelFromURLWithString:urlString completion:^(Result *model,JSONModelError *error){
        [SharedAction commonActionWithUrl:urlString andStatus:model.status andError:model.error andJSONModelError:error andObject:nil withDone:done];
    }];
}

-(void)registWithLoginname:(NSString *)loginname andPassword:(NSString *)password andPasswd:(NSString *)passwd andCode:(NSString *)code andCheckButtonTag:(NSInteger)tag withDone:(doneWithObject)done{
    if ([self validateRegisterName:loginname andCode:code andPasswd:password andPasswordConfirm:passwd andCheckButtonTag:tag]) {
        NSString *urlString = [NSString stringWithFormat:RegistURL,loginname,password,passwd,code];
        [SVProgressHUD show];
        [Result getModelFromURLWithString:urlString completion:^(Result *model,JSONModelError *error){
            [SharedAction commonActionWithUrl:urlString andStatus:model.status andError:model.error andJSONModelError:error andObject:nil withDone:done];
        }];
    }
}

/*
 验证注册信息
 */
-(BOOL)validateRegisterName:(NSString*)name andCode:(NSString *)codeNumber andPasswd:(NSString *)passwd andPasswordConfirm:(NSString *)passwdConfirm andCheckButtonTag:(NSInteger)tag{
    
    if ([name isEqualToString:@""]||name==nil) {
        [SVProgressHUD showErrorWithStatus:@"用户名不能为空"];
        return NO;
    }else if(![NSString isValidateMobile:name]){
        [SVProgressHUD showErrorWithStatus:@"手机号码不合法"];
        return NO;
    }else if([codeNumber isEqualToString:@""]||codeNumber==nil){
        [SVProgressHUD showErrorWithStatus:@"验证码不能为空"];
        return NO;
    }else if([passwd isEqualToString:@""]||passwd==nil){
        [SVProgressHUD showErrorWithStatus:@"密码不能为空"];
        return NO;
    }else if([passwdConfirm isEqualToString:@""]||passwdConfirm==nil||![passwdConfirm isEqualToString:passwd]){
        [SVProgressHUD showErrorWithStatus:@"两次密码输入不一致"];
        return NO;
    }else if(tag==-1){
        [SVProgressHUD showErrorWithStatus:@"需要同意注册协议"];
        return NO;
    }else{
        return YES;
    }
}

@end
