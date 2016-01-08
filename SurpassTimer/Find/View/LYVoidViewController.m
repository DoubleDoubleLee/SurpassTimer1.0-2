//
//  LYVoidViewController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/30.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "LYVoidViewController.h"

@interface LYVoidViewController ()<UIWebViewDelegate>

@end

@implementation LYVoidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    UIWebView *web=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:_Url]];
    [self.view addSubview:web];
    [web loadRequest:request];
    
    
    OrekiNavigationBar *LYCxw=[OrekiNavigationBar BarType:BarTypeOfCollect andWithController:self];
    [self.view addSubview:LYCxw];
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

@end
