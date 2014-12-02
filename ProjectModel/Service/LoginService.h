//
//  LoginService.h
//  ProjectModel
//
//  Created by Gao Huang on 14-11-28.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginViewController.h"
#import "Login.h"

typedef void (^done)(LoginInfo *model,NSString *md5Pw);

@interface LoginService : NSObject
-(void)member_loginWithLoginname:(NSString *)loginname andPassword:(NSString *)password withDone:(doneWithObject)done;
-(void)setSharedDataWithUser:(LoginInfo *)user andUserName:(NSString *)username andPassWord:(NSString *)password;
@end
