//
//  NSString+MLString.h
//  ProjectModel
//
//  Created by Gao Huang on 14-12-1.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ML)
/*手机号码验证 MODIFIED BY HELENSONG*/
+(BOOL) isValidateMobile:(NSString *)mobile;
@end
