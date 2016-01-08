//
//  GPSViewController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/24.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#define ios_version [[UIDevice currentDevice].systemVersion floatValue]


#import "GPSViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManager.h>
@interface GPSViewController ()<CLLocationManagerDelegate>
{
    CLLocationManager * _localManager;
    UILabel * label;
    OrekiNavigationBar *ob;
}
@end

@implementation GPSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    
    
    ob = [OrekiNavigationBar BarType:BarTypeOfBack andWithController:self];
    ob.title.text = @"定位";
    [self.view addSubview:ob];
    
    
    
    
    
    
    
    //创建定位管理
    if ([CLLocationManager locationServicesEnabled]) {
        _localManager = [[CLLocationManager alloc] init];
        //指定代理
        _localManager.delegate = self;
        
        _localManager.desiredAccuracy = kCLLocationAccuracyBest; //定位精度
        _localManager.distanceFilter = 1; // 位置过滤
        
        //授权
        if (ios_version>=8) {
            [_localManager requestWhenInUseAuthorization];
        }
        
        
    }

  
    
}
















#pragma mark -------------定位服务代理

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    //得到当前位置
    CLLocation * current = locations.lastObject;
    
  
    
    CLGeocoder * geocoder = [[CLGeocoder alloc] init];
    CLLocation * location = [[CLLocation alloc] initWithLatitude:current.coordinate.latitude longitude:current.coordinate.longitude];
    //反向地理编码
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        
        for (CLPlacemark *mark in placemarks) {
            if (mark.locality.length>2) {
                ob.title.text = mark.locality;
                [[NSUserDefaults standardUserDefaults] setObject:mark.locality forKey:@"city"];
               [_localManager stopUpdatingLocation];//关闭服务
               [self.delegate dingWeiCity:mark.locality];
            }
            else{
               [self.delegate dingWeiCity:@"城市"];
            }
            
            
        }
    }];
    
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_localManager startUpdatingLocation];//开启定位
    
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_localManager stopUpdatingLocation];//关闭服务
   
}

@end
