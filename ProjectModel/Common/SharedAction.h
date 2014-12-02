//
//  SharedAction.h
//  ProjectModel
//
//  Created by Gao Huang on 14-11-28.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModelLib.h>

@interface SharedAction : NSObject

typedef void (^doneWithObject)(id object);

+(void)presentLoginViewControllerInViewController:(UIViewController *)viewController;
+(void)commonActionWithUrl:(NSString *)url andStatus:(NSInteger)status andError:(NSString *)error andJSONModelError:(JSONModelError *)jsonError andObject:(id)object withDone:(doneWithObject)done;
+(void)callWithNumber:(NSString *)number inView:(UIView *)view;
+(void)shareWithTitle:(NSString *)title andDesinationUrl:(NSString *)url Text:(NSString *)text andImageUrl:(NSString *)imgUrl InViewController:(UIViewController *)viewController;
@end
