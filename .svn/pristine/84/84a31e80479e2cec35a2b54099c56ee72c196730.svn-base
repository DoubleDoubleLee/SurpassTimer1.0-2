//
//  DingWeiViewController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/23.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "DingWeiViewController.h"
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
@interface DingWeiViewController ()<BMKLocationServiceDelegate>
{
    BMKLocationService * _locService;//定位
    
}
@end

@implementation DingWeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.title = @"选择城市";
    
    [self dingWei];
}

-(void)dingWei
{
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    _locService.desiredAccuracy = kCLLocationAccuracyBest;
    
    //启动LocationService
    [_locService startUserLocationService];
    
}


-(void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
#warning  需要改
    [self.delegate dingWeiCity:nil];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

@end
