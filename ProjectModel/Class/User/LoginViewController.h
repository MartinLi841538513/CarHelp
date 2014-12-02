//
//  LoginViewController.h
//  ProjectModel
//
//  Created by Gao Huang on 14-11-28.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"

@protocol LoginViewControllerDelegate <NSObject>

@optional
-(void)loginSuccessedInLoginViewController:(UIViewController *)loginViewController;
@end

@interface LoginViewController : UIViewController<RegisterViewControllerDelegate>
@property (nonatomic,weak)id<LoginViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@end
