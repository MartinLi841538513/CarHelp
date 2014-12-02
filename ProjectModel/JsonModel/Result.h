//
//  Status.h
//  ProjectModel
//
//  Created by Gao Huang on 14-11-30.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "JSONModel.h"

@interface Result : JSONModel

@property(nonatomic,strong)NSString<Optional>* error;
@property(nonatomic,assign)NSInteger status;
@end
