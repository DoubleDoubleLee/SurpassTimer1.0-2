//
//  CinmaViewController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/24.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#define ALL_URL @"http://api.m.mtime.cn/OnlineLocationCinema/OnlineCinemasByCity.api?locationId=%@"
#define GUANGGAO_URL @"http://api.m.mtime.cn/Advertisement/MobileAdvertisementInfo.api?locationId=%@"


#import "CinmaViewController.h"
#import "LJCSHDownload.h"
#import "AllMovieTableViewCell.h"
#import "GPSViewController.h"
#import "LocationViewController.h"

@interface CinmaViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
    NSMutableArray * _dataSource;
    UIView * view;
}
@end

@implementation CinmaViewController





-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    

    
}


- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createMenuButton];
    
    [self createBlock];
    
    NSString * cityID = [[NSUserDefaults standardUserDefaults] objectForKey:@"cityID"];
    [self createTableView:cityID];
    
    [self createDataSource:8000 cityID:cityID];
    
}

-(void)createBlock
{
    LocationViewController * lvc = [LocationViewController shareLocationViewController];
    
    lvc.block = ^(){
        NSString * str = [[NSUserDefaults standardUserDefaults] objectForKey:@"cityID"];
        
        [self createDataSource:8000 cityID:str];
    };
}


-(void)createMenuButton
{
    
//    LocationViewController * local = [[LocationViewController alloc] init];
//    local.block = ^(){
//    
//        NSLog(@"hahaha");
//    };
    
    
    
    NSArray * titleArr = @[@"全部",@"特惠"];
    for (int i = 0; i < 2; i++) {
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(K_MainScreenWidth/2.0*i, 64, K_MainScreenWidth/2.0, 29)];
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithWhite:0.397 alpha:1.000] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
         button.tag = 8000+i;
        if (i==0) {
            button.selected = YES;
        }
        else if (i==1){
        [button setTitleColor:[UIColor colorWithRed:0.307 green:0.480 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
        }
        [button addTarget:self action:@selector(menuButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    for (int i =1; i<2; i++) {
        UIImageView * lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(K_MainScreenWidth/2.0*i, 71, 1, 15)];
        lineImageView.backgroundColor = [UIColor colorWithWhite:0.796 alpha:1.000];
        [self.view addSubview:lineImageView];
    }
    
}



-(void)menuButtonAction:(UIButton *)button
{
    button.selected = YES;
    for (int i =0; i < 4; i++) {
        UIButton * buttonS = (UIButton *)[self.view viewWithTag:8000+i];
        if (button!=buttonS) {
            buttonS.selected = NO;
        }
    }
    
    
    
    NSString * cityID = [[NSUserDefaults standardUserDefaults] objectForKey:@"cityID"];
    
    [self createDataSource:button.tag cityID:cityID];
    
    
}

-(void)createTableView:(NSString *)cityID
{
    _dataSource = [[NSMutableArray alloc] init];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64+29, K_MainScreenWidth, K_MainScreenHeight-64-49-29) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_MainScreenWidth, 110)];
    
    view.backgroundColor = [UIColor colorWithWhite:0.932 alpha:1.000];
    _tableView.tableHeaderView = view;
    [self guangGao:cityID];
    
    UIView * foodView = [[UIView alloc] init];
    _tableView.tableFooterView = foodView;
    
}




-(void)createDataSource:(NSInteger)buttTag cityID:(NSString *)cityID
{
    
    
    
    
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:[NSString stringWithFormat:ALL_URL,cityID] parameters:nil sucess:^(NSData *data) {
        NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        [_dataSource removeAllObjects];
        
        for (NSDictionary * dic in array) {
            if (buttTag==8000) {
                [_dataSource addObject:dic];
            }
            else if (buttTag==8001){
                NSArray * arr = dic[@"couponActivityList"];
                if (arr.count>0) {
                    [_dataSource addObject:dic];
                }
            }
            
        }
        [_tableView reloadData];
        
    } fail:^(NSError *error) {
        
    }];
    
    
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AllMovieTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"allMovieCell"];
    if (!cell) {
        cell = [[AllMovieTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"allMovieCell"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell prepareUI:_dataSource[indexPath.row]];
    
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}




-(void)guangGao:(NSString *)cityID
{
    
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:[NSString stringWithFormat:GUANGGAO_URL,cityID] parameters:nil sucess:^(NSData *data) {
        
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray * arr = dic[@"advList"];
        NSString * string = [[NSString alloc] init];
        
        for (NSDictionary * dicc in arr) {
            if ([[NSString stringWithFormat:@"%@",dicc[@"typeName"]]isEqualToString:[NSString stringWithFormat:@"即将上映banner"]]) {
                string = dicc[@"url"];
            }
        }
        
       
        UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, K_MainScreenWidth, view.bounds.size.height)];
        webView.backgroundColor = view.backgroundColor;
        
        NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
        
        [webView loadRequest:request];
        
        [view addSubview:webView];
        
        [_tableView reloadData];
        
    } fail:^(NSError *error) {
        
    }];
}







@end
