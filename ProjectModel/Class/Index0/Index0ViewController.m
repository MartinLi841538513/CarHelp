//
//  Index0ViewController.m
//  ProjectModel
//
//  Created by Gao Huang on 14-11-28.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "Index0ViewController.h"
#import "LoginViewController.h"
#import "LoginService.h"
#import "Login.h"

#define Latitude 28.1658601239483
#define Longitude 112.947241748764

#define Latitude1 28.1338601239483
#define Longitude1 112.947241740764

#define Latitude2 28.1658001239483
#define Longitude2 112.947201748764

#define Latitude3 28.1658601230483
#define Longitude3 112.047241748764

@interface Index0ViewController ()<LoginViewControllerDelegate,MAMapViewDelegate>

@end

@implementation Index0ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SharedData *sharedData = [SharedData sharedInstance];
    if (![[sharedData loginStatus] isEqualToString:@"yes"]) {
        [SharedAction presentLoginViewControllerInViewController:self];
    }else{
        //需要重新加载userDefaults的数据（可能数据库的数据会经常变化）
        LoginService *loginService = [[LoginService alloc] init];
        [loginService member_loginWithLoginname:sharedData.loginname andPassword:sharedData.password withDone:^(LoginInfo *info){
            [loginService setSharedDataWithUser:info andUserName:sharedData.loginname andPassWord:sharedData.password];
            [self loadIndex0DataInView];
        }];
    }
    self.mapView.delegate = self;
    self.mapView.visibleMapRect = MAMapRectMake(220880104.0, 101476980.0,  9249.0, 13265.0);
    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(Latitude, Longitude);
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    
    MAPointAnnotation *point = [[MAPointAnnotation alloc] init];
    point.title = @"长沙XX4S美容店";
    point.subtitle = @"长沙岳麓区大学城湖南大学天马学生公寓";
    point.coordinate = CLLocationCoordinate2DMake(Latitude, Longitude);
    [annotations addObject:point];
//    MAPointAnnotation *point1 = [[MAPointAnnotation alloc] init];
//    point.coordinate = CLLocationCoordinate2DMake(Latitude1, Longitude1);
//    [annotations addObject:point1];
//    MAPointAnnotation *point2 = [[MAPointAnnotation alloc] init];
//    point.coordinate = CLLocationCoordinate2DMake(Latitude2, Longitude2);
//    [annotations addObject:point2];
//    MAPointAnnotation *point3 = [[MAPointAnnotation alloc] init];
//    point.coordinate = CLLocationCoordinate2DMake(Latitude3, Longitude3);
//    [annotations addObject:point3];
    
    [self.mapView addAnnotations:annotations];
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


#pragma LoginViewControllerDelegate
-(void)loginSuccessedInLoginViewController:(UIViewController *)loginViewController{
    [self loadIndex0DataInView];
}

#pragma MAMapViewDelegate
-(MAAnnotationView*)mapView:(MAMapView *)mapView viewForAnnotation:(id)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndetifier = @"pointReuseIndetifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndetifier];
            annotationView.canShowCallout= YES;      //设置气泡可以弹出，默认为NO
            annotationView.animatesDrop = YES;       //设置标注动画显示，默认为NO
            annotationView.draggable = YES;
            
            UIColor *color = [UIColor blueColor];
            UIFont *font = [UIFont systemFontOfSize:12.0];
            //设置标注可以拖动，默认为NO
            UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
            [rightButton addTarget:self action:@selector(detailAction:) forControlEvents:UIControlEventTouchUpInside];
            annotationView.rightCalloutAccessoryView=rightButton;  //设置气泡右侧按钮
  
            
            UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 20, 20)];
            [leftButton setTitle:@"call" forState:UIControlStateNormal];
            [leftButton addTarget:self action:@selector(callAction:) forControlEvents:UIControlEventTouchUpInside];
            [leftButton.titleLabel setFont:font];
            [leftButton setTitleColor:color forState:UIControlStateNormal];
            annotationView.leftCalloutAccessoryView = leftButton;

        }
        return annotationView;
    }
    return nil;
}

-(void)callAction:(id)sender{
    [SharedAction callWithNumber:@"18613961267" inView:self.view];
}

-(void)detailAction:(id)sender{
    UIViewController *target = [self.storyboard instantiateViewControllerWithIdentifier:@"StoreDetailViewController"];
    target.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:target animated:YES];
}

/*
    在这里把所有加载好的数据，开始呈现在界面上
 */
-(void)loadIndex0DataInView{
    NSLog(@"loadIndex0DataInView");
}
- (IBAction)visitServiceAction:(id)sender {
    UIViewController *target = [self.storyboard instantiateViewControllerWithIdentifier:@"VisitServiceViewController"];
    target.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:target animated:YES];

}
- (IBAction)myPriceAction:(id)sender {
    UIViewController *target = [self.storyboard instantiateViewControllerWithIdentifier:@"MyPriceViewController"];
    target.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:target animated:YES];
    
}



@end
