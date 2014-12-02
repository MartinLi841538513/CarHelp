//
//  SharedAction.m
//  ProjectModel
//
//  Created by Gao Huang on 14-11-28.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "SharedAction.h"
#import "LoginViewController.h"
#import <UMengSocial/UMSocialData.h>
#import <UMengSocial/UMSocialSnsService.h>
#import <UMengSocial/UMSocialSnsPlatformManager.h>

@implementation SharedAction

+(void)presentLoginViewControllerInViewController:(UIViewController *)viewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"User" bundle:nil];
    UINavigationController *userNavigationController = [storyboard instantiateViewControllerWithIdentifier:@"UserNavController"];
    LoginViewController *loginViewController = userNavigationController.viewControllers.firstObject;
    loginViewController.delegate = (id)viewController;
    [viewController presentViewController:userNavigationController animated:YES completion:nil];
}

+(void)commonActionWithUrl:(NSString *)url andStatus:(NSInteger)status andError:(NSString *)error andJSONModelError:(JSONModelError *)jsonError andObject:(id)object withDone:(doneWithObject)done{
    NSLog(@"status=%ld url=%@",(long)status,url);
    if (!jsonError) {
        if (status==2) {
            done(object);
            [SVProgressHUD showSuccessWithStatus:error];
        }else{
            if (error==nil||[error isEqualToString:@""]) {
                [SVProgressHUD dismiss];
            }else{
                [SVProgressHUD showErrorWithStatus:error];
            }
        }
    }else{
        NSLog(@"%@",jsonError);
    }
}

+(void)shareWithTitle:(NSString *)title andDesinationUrl:(NSString *)url Text:(NSString *)text andImageUrl:(NSString *)imgUrl InViewController:(UIViewController *)viewController{
    [SVProgressHUD show];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        UIImage *img = nil;
        if ([imgUrl hasPrefix:@"http"]) {
            img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl]]];
        }else{
            img = [UIImage imageNamed:imgUrl];
        }
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [UMSocialData defaultData].extConfig.wechatSessionData.url = url;
            [UMSocialData defaultData].extConfig.wechatTimelineData.url = url;
            [UMSocialData defaultData].extConfig.wechatSessionData.title = title;
            [UMSocialData defaultData].extConfig.wechatTimelineData.title = title;
            
            [UMSocialSnsService presentSnsIconSheetView:viewController
                                                 appKey:UMengKEY
                                              shareText:text
                                             shareImage:img
                                        shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToWechatFavorite]
                                               delegate:(id)viewController];
            [SVProgressHUD dismiss];
        });
    });
}

+(void)callWithNumber:(NSString *)number inView:(UIView *)view{
    NSString *tel = [NSString stringWithFormat:@"tel:%@",number];
    UIWebView *callWebview = [[UIWebView alloc] init];
    NSURL *telURL = [NSURL URLWithString:tel];
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    [view addSubview:callWebview];
}
@end
