//
//  BuyViewController.m
//  HandForLOLForMe
//
//  Created by 陈曹振 on 15/11/23.
//  Copyright © 2015年 ccz. All rights reserved.
//

#import "BuyViewController.h"
#import "BuyScrollView.h"
#import "BuyReYingViewController.h"
#import "BuyShangYingViewController.h"
#import "OrekiNavigationBar.h"
#import "CinmaViewController.h"
#import "LocationViewController.h"
#import "GPSViewController.h"

@interface BuyViewController ()
{
    OrekiNavigationBar * ob;
    
}
@end

@implementation BuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ob = [OrekiNavigationBar BarType:BarTypeOfBuy andWithController:self];

   [self.view addSubview:ob];
    
   [self createScrollView];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSString * string = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];
    
    
    if (string.length>1) {
        [ob.locationButton setTitle:string forState:UIControlStateNormal];
    }
    
    else
    {
        [ob.locationButton setTitle:@"定位" forState:UIControlStateNormal];
    }
    
}







-(void)createScrollView
{
    
   
    
//    BuyReYingViewController * reYingVC = [[BuyReYingViewController alloc] init];
//    BuyShangYingViewController * shangYingVC = [[BuyShangYingViewController alloc] init];
    
    BuyReYingViewController * reYingVC = [BuyReYingViewController shareBuyReYingViewController];
    
    BuyShangYingViewController * shangYingVC = [BuyShangYingViewController shareBuyShangYingViewController];
    
    BuyScrollView * scrollButtonContr = [[BuyScrollView alloc] initWithFrame:CGRectMake(0, 64, K_MainScreenWidth, K_MainScreenHeight) title:@[@"正在热映",@"即将上映"] pushControllers:@[reYingVC,shangYingVC]];
    
    [self addChildViewController:reYingVC];
    [self addChildViewController:shangYingVC];
    [ob.movie addSubview:scrollButtonContr];
    
    
    
    CinmaViewController * cinma = [[CinmaViewController alloc] init];
    [self addChildViewController:cinma];
    [ob.cinema addSubview:cinma.view];
    
    
    
   
    
    
   
    
}







@end
