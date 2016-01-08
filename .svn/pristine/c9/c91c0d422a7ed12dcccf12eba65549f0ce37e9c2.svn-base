//
//  LocationViewController.h
//  SurpassTimer
//
//  Created by qianfeng on 15/11/24.
//  Copyright © 2015年 L-J-C. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "RootViewController.h"

@interface LocationViewController : RootViewController
// 反向传值  传出去的值是具体哪个城市  有手写添加的城市 也可以是点选 使用时需要在你需要值的类定义这个Block 我这边只是调用

/*
 例
 svc.block = ^(NSString * string){
 
 label.text = string;
 
 };
 
 */

@property(nonatomic,copy)void (^block)();

@property(nonatomic,copy)NSString *cityslabletext;//传进来

@property(nonatomic,copy)NSString *Textfiledstr;//传出去

+ (LocationViewController *)shareLocationViewController;

@end
