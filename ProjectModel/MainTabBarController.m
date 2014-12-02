//
//  ViewController.m
//  ProjectModel
//
//  Created by Gao Huang on 14-11-28.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIStoryboard *storyboard0 = [UIStoryboard storyboardWithName:@"Index0" bundle:nil];
    UIStoryboard *storyboard1 = [UIStoryboard storyboardWithName:@"Index1" bundle:nil];
    UIStoryboard *storyboard2 = [UIStoryboard storyboardWithName:@"Index2" bundle:nil];
    UIStoryboard *storyboard3 = [UIStoryboard storyboardWithName:@"Index3" bundle:nil];
    
    UINavigationController *nav0 = [storyboard0 instantiateViewControllerWithIdentifier:@"Index0NavController"];
//    UINavigationController *nav1 = [storyboard1 instantiateViewControllerWithIdentifier:@"Index1NavController"];
//    UINavigationController *nav2 = [storyboard2 instantiateViewControllerWithIdentifier:@"Index2NavController"];
    UINavigationController *nav3 = [storyboard3 instantiateViewControllerWithIdentifier:@"Index3NavController"];
    
    NSArray *viewControllers = [NSArray arrayWithObjects:nav0,nav3, nil];
    [self setViewControllers:viewControllers animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
