//
//  SharedData.h
//  ProjectModel
//
//  Created by Gao Huang on 14-11-28.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Login.h"
@interface SharedData : NSObject

@property(nonatomic,strong)LoginInfo *user;
@property(nonatomic,strong)NSString *loginname;
@property(nonatomic,strong)NSString *password;
@property(nonatomic,strong)NSString *loginStatus;

+(id)sharedInstance;

@end
