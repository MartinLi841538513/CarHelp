//
//  NSString+MLString.m
//  ProjectModel
//
//  Created by Gao Huang on 14-12-1.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "NSString+ML.h"

@implementation NSString (ML)
/*手机号码验证 MODIFIED BY HELENSONG*/
+(BOOL) isValidateMobile:(NSString *)mobile{
    //手机号以13， 15，18开头11个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}
@end
