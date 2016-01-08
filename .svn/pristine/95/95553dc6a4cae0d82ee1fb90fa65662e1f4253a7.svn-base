
//
//  MyCollectViewController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/29.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "MyCollectViewController.h"

@interface MyCollectViewController ()

@end

@implementation MyCollectViewController

+ (MyCollectViewController * )shareMyCollectViewController
{
    static MyCollectViewController * shareManager = nil;
    static dispatch_once_t predicted;
    dispatch_once(&predicted, ^{
        shareManager = [[self alloc] init];
    });
    return shareManager;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavigationBar];
    
    [self createTableView];
    
}

-(void)createNavigationBar
{
    OrekiNavigationBar * ob = [OrekiNavigationBar BarType:BarTypeOfBack andWithController:self];
    
    ob.title.text = @"我的收藏";
    
    [self.view addSubview:ob];
}

-(void)createTableView
{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, K_MainScreenWidth, K_MainScreenHeight-64) style:UITableViewStylePlain]
    ;
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
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
