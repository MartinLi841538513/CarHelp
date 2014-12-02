//
//  SharedData.m
//  ProjectModel
//
//  Created by Gao Huang on 14-11-28.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "SharedData.h"

@implementation SharedData

+(SharedData *)sharedInstance{
    static SharedData *sharedUser = nil;
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedUser = [[SharedData alloc] init];
    });
    return sharedUser;
}

-(void)setLoginStatus:(NSString *)loginStatus{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:loginStatus forKey:@"loginStatus"];
    [userDefaults synchronize];
}

-(NSString *)loginStatus{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"loginStatus"];
}

-(void)setLoginname:(NSString *)loginname{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:loginname forKey:@"loginname"];
    [userDefaults synchronize];
}

-(NSString *)loginname{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"loginname"];
}

-(void)setPassword:(NSString *)password{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:password forKey:@"password"];
    [userDefaults synchronize];
}

-(NSString *)password{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"password"];
}
@end
