//
//  StoreDetailViewController.m
//  CarHelp
//
//  Created by Gao Huang on 14-12-2.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "StoreDetailViewController.h"

@implementation StoreDetailViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    self.commentText.delegate = self;
}

- (IBAction)callAction:(id)sender {
    [SharedAction callWithNumber:@"18613961267" inView:self.view];
}
- (IBAction)addressAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    UIViewController *target = [self.storyboard instantiateViewControllerWithIdentifier:@"MakeCommentViewController"];
    [self.navigationController pushViewController:target animated:YES];
    [textField resignFirstResponder];
}

@end
