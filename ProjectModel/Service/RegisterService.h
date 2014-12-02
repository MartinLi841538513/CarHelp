//
//  ValicodeService.h
//  ProjectModel
//
//  Created by Gao Huang on 14-11-30.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterService : NSObject

-(void)valicodeWithLoginname:(NSString *)loginname withDone:(doneWithObject)done;

-(void)registWithLoginname:(NSString *)loginname andPassword:(NSString *)password andPasswd:(NSString *)passwd andCode:(NSString *)code andCheckButtonTag:(NSInteger)tag withDone:(doneWithObject)done;
@end
