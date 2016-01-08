//
//  FindViewController.m
//  HandForLOLForMe
//
//  Created by 陈曹振 on 15/11/23.
//  Copyright © 2015年 ccz. All rights reserved.
//
#define HeardUrl @"http://api.m.mtime.cn/PageSubArea/GetRecommendationIndexInfo.api"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "FindViewController.h"
#import "ScrollButtonViewController.h"
#import "LYNewsViewController.h"
#import "LYTrailerViewController.h"
#import "LYRankingViewController.h"
#import "LYFilmsViewController.h"
#import "LJCSHDownload.h"
#import "LYFindModel.h"

@interface FindViewController ()
//{
//    NSMutableArray *_TitlesArr;
//}



@end

@implementation FindViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    OrekiNavigationBar * ob = [OrekiNavigationBar BarType:BarTypeOfNone andWithController:self];
    [self.view addSubview:ob];
    
    
    
    // Do any additional setup after loading the view.
    _TitlesArr=[[NSMutableArray alloc]init];
     [self createUI];
    [self DownLoad];
}
-(void)createUI
{
    
    
    
    NSArray *titles=@[@"新闻",@"预告片",@"排行榜",@"影评"];
    
    LYNewsViewController * one = [[LYNewsViewController alloc]init];
    LYTrailerViewController * two = [[LYTrailerViewController alloc]init];
    LYRankingViewController *Three = [[LYRankingViewController alloc]init];
    LYFilmsViewController *Four = [[LYFilmsViewController alloc]init];
    
    ScrollButtonViewController *buy=[[ScrollButtonViewController alloc]initWithFrame:CGRectMake(0, 0, K_MainScreenWidth, K_MainScreenHeight) title:titles pushControllers:@[one,two,Three,Four]];
   // NSInteger pages= buy.bounds.origin.x/K_MainScreenWidth;
     [self addChildViewController:one];
    [self addChildViewController:two];
    [self addChildViewController:Three];
    [self addChildViewController:Four];
     [self.view addSubview:buy];
    


    
    

}
-(void)DownLoad
{
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:HeardUrl parameters:nil sucess:^(NSData *data) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
   //     NSDictionary *dict=dic[当前子视图管理器.titles];
        
       //self.childViewControllers[0]
        //NSLog(@"%@",[self.childViewControllers[0]].titles);
        LYFindModel *model=[[LYFindModel alloc]init];
        
        [model setValuesForKeysWithDictionary:dic];
        
        [_TitlesArr addObject:model];
       
    } fail:^(NSError *error) {
        
    }];

  
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
