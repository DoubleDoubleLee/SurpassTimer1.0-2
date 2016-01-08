//
//  RootTabbarViewController.m
//  HandForLOLForMe
//
//  Created by 陈曹振 on 15/11/10.
//  Copyright © 2015年 ccz. All rights reserved.
//

#import "RootTabbarViewController.h"
#import "MyTabbar.h"
#import "HomeViewController.h"
#import "BuyViewController.h"
#import "FindViewController.h"
#import "MallViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"

@interface RootTabbarViewController ()
/**
 *  自定义tabbar
 */
@property(nonatomic,weak)MyTabbar * customTabbar;

@end

@implementation RootTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化tabbar
    [self setupTabbar];
    [self prepareViewControllers];

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView * child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)setupTabbar
{
    MyTabbar * customTabbar = [[MyTabbar alloc] init];
    customTabbar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTabbar];
    self.customTabbar = customTabbar;
    customTabbar.pushViewController = ^(NSInteger from,NSInteger to){
        self.selectedIndex = to;
    };
    
}


- (void)prepareViewControllers
{

    HomeViewController * homeVC = [[HomeViewController alloc] init];
    [self setupChildViewController:homeVC title:@"首页" andImageName:@"home" andSelectImageName:@"home_on"];
    
    BuyViewController * buyVC = [[BuyViewController alloc] init];
    [self setupChildViewController:buyVC title:@"购票" andImageName:@"payticket" andSelectImageName:@"payticket_on"];
    
//    MallViewController * mallVC = [[MallViewController alloc] init];
//     [self setupChildViewController:mallVC title:@"商城" andImageName:@"store" andSelectImageName:@"store_on"];
    
    FindViewController * findVC = [[FindViewController alloc] init];
    [self setupChildViewController:findVC title:@"发现" andImageName:@"discover" andSelectImageName:@"discover_on"];
    
    MineViewController * mineVC = [[MineViewController alloc] init];
    [self setupChildViewController:mineVC title:@"我" andImageName:@"myinfo" andSelectImageName:@"myinfo_on"];
    
}

- (void)setupChildViewController:(UIViewController *)childVC title:(NSString *)title andImageName:(NSString *)imageName andSelectImageName:(NSString *)selectImageName
{
    childVC.title = title;
    childVC.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:childVC];

    [self addChildViewController:nav];
    
    //  添加一个tabbar内部的按钮
    [self.customTabbar addTabbarButtonWithItem:childVC.tabBarItem];
}



@end
