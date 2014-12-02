//
//  RegisterViewController.h
//  ProjectModel
//
//  Created by Gao Huang on 14-11-28.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RegisterViewControllerDelegate <NSObject>

@optional
-(void)registerSuccessWithLoginname:(NSString *)name andPasswd:(NSString *)passwd;

@end

@interface RegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *tel;
@property (weak, nonatomic) IBOutlet UITextField *code;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPw;
@property(nonatomic,weak)id<RegisterViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;

@end
