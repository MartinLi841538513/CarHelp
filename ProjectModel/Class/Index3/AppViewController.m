//
//  AppViewController.m
//  Club
//
//  Created by MartinLi on 14-11-5.
//  Copyright (c) 2014年 martin. All rights reserved.
//

#import "AppViewController.h"
#import "SharedAction.h"
@interface AppViewController ()

@end

@implementation AppViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"应用推荐";
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)shareAction:(id)sender {
    [SharedAction shareWithTitle:@"E小区" andDesinationUrl:AppDownLoadURL Text:@"最近在用'E小区'在线免费抢菜，抽奖，秒杀，买菜，感觉挺好的，小小的推荐一下。" andImageUrl:@"qrenCode.jpg" InViewController:self];
}



@end
