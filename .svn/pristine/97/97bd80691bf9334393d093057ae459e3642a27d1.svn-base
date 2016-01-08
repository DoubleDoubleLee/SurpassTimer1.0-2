//
//  BuyShangYingViewController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/24.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#define SHANGYING_URL @"http://api.m.mtime.cn/Movie/MovieComingNew.api?locationId=%@"
#define GUANGGAO_URL @"http://api.m.mtime.cn/Advertisement/MobileAdvertisementInfo.api?locationId=%@"


#import "BuyShangYingViewController.h"
#import "BuyHelp.h"
#import "ShangYingTableViewCell.h"
#import "LJCSHDownload.h"
#import "BuyRYViewControllerA.h"


@interface BuyShangYingViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * _dataSource;
    UITableView * _tableView;
    UIView * bgView;
    NSMutableArray * _dataSourceS;
}
@end

@implementation BuyShangYingViewController


+(id)shareBuyShangYingViewController
{
    static BuyShangYingViewController * BuyShangYing = nil;
    if (BuyShangYing == nil) {
        BuyShangYing = [[BuyShangYingViewController alloc] init];
    }
    return BuyShangYing;
}







-(void)createBlock
{
    LocationViewController * lvc = [LocationViewController shareLocationViewController];
    
    lvc.block = ^(){
        NSString * cityID = [[NSUserDefaults standardUserDefaults] objectForKey:@"cityID"];
        [self createBlock];
        
        [self prepareTableViewHeader:cityID];
        
        [self prepareDataSource:cityID];
    };
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    

    [self createBlock];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 29, K_MainScreenWidth, K_MainScreenHeight-64-29-49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    NSString * cityID = [[NSUserDefaults standardUserDefaults] objectForKey:@"cityID"];
    
    
    [self prepareTableViewHeader:cityID];
 
    [self prepareDataSource:cityID];
    
}


-(void)prepareTableViewHeader:(NSString *)cityID
{
    _dataSourceS = [[NSMutableArray alloc] init];
    _dataSource = [[NSMutableArray alloc] init];
    
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:[NSString stringWithFormat:SHANGYING_URL,cityID] parameters:nil sucess:^(NSData *data) {
        
        UIView * headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_MainScreenWidth, 300)];
        headView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:headView];
        UILabel * zuiShouGuanZhu = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 20)];
        zuiShouGuanZhu.textAlignment = NSTextAlignmentLeft;
        zuiShouGuanZhu.font = [UIFont systemFontOfSize:18 weight:14];
        zuiShouGuanZhu.textColor = [UIColor blackColor];
        zuiShouGuanZhu.text = @"最受关注";
        [headView addSubview:zuiShouGuanZhu];
        
        
 
        
        bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 190, K_MainScreenWidth, 90)];
        bgView.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
        [headView addSubview:bgView];
        
        [self guangGao:cityID];
        
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray * arr = dic[@"attention"];
       
        
        UIScrollView * headScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -15, K_MainScreenWidth, 250)];
        
        headScrollView.showsHorizontalScrollIndicator = NO;
        headScrollView.showsVerticalScrollIndicator = NO;
        headScrollView.contentSize = CGSizeMake(K_MainScreenWidth*arr.count, 0);
        [headView addSubview:headScrollView];
        int i = 0;
        for (NSDictionary * dicc in arr) {
            
            [_dataSourceS addObject:dicc];
            
            UIView * scrollView = [[UIView alloc] initWithFrame:CGRectMake(K_MainScreenWidth*i, 40, K_MainScreenWidth, 200)];
            scrollView.tag = 8060+i;
            [headScrollView addSubview:scrollView];
            
            
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapACtion:)];
            [scrollView addGestureRecognizer:tap];
            
            
            
            
            UILabel * dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 80, 20)];
            dateLabel.textAlignment = NSTextAlignmentLeft;
            dateLabel.textColor = [UIColor colorWithRed:0.569 green:0.565 blue:0.569 alpha:1.000];
            dateLabel.text = [NSString stringWithFormat:@"%@月%@日",dicc[@"rMonth"],dicc[@"rDay"]];
            [scrollView addSubview:dateLabel];
           
            
            
            UIImageView * lineHeng = [[UIImageView alloc] initWithFrame:CGRectMake(100, 10, K_MainScreenWidth-100-30, 1)];
            lineHeng.backgroundColor = [UIColor colorWithWhite:0.906 alpha:1.000];
            [scrollView addSubview:lineHeng];
            
            
            
            UIImageView * shuHeng = [[UIImageView alloc] initWithFrame:CGRectMake(K_MainScreenWidth-30, 10, 1, 140)];
            shuHeng.backgroundColor = [UIColor colorWithWhite:0.906 alpha:1.000];
            [scrollView addSubview:shuHeng];
            
            
            
            UIImageView * movieImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 25, 90, 130)];
            [movieImageView sd_setImageWithURL:[NSURL URLWithString:dicc[@"image"]] placeholderImage:nil];
            [scrollView addSubview:movieImageView];
            
            
            UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(movieImageView.frame)+10, 25, K_MainScreenWidth-30-130, 20) ];
            titleLabel.text = dicc[@"title"];
            titleLabel.font = [UIFont systemFontOfSize:16 weight:10];
            titleLabel.textAlignment = NSTextAlignmentLeft;
            [scrollView addSubview:titleLabel];
            
            UILabel * wantLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(movieImageView.frame)+10, 55, K_MainScreenWidth-50-130, 20) ];
            wantLabel.text = [NSString stringWithFormat:@"%@人想看 - %@",dicc[@"wantedCount"],dicc[@"type"]];
            wantLabel.adjustsFontSizeToFitWidth = YES;
            wantLabel.font = [UIFont systemFontOfSize:15];
            wantLabel.textColor = [UIColor colorWithWhite:0.604 alpha:1.000];
            [scrollView addSubview:wantLabel];
            
            
            UILabel * daoYanLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(movieImageView.frame)+10, 85, K_MainScreenWidth-50-130, 20) ];
            daoYanLabel.text = [NSString stringWithFormat:@"导演 : %@",dicc[@"director"]];
            daoYanLabel.textColor = wantLabel.textColor;
            daoYanLabel.font = wantLabel.font;
            [scrollView addSubview:daoYanLabel];
            
            UILabel * yanYuanLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(movieImageView.frame)+10, 100, K_MainScreenWidth-50-130, 40) ];
            yanYuanLabel.text = [NSString stringWithFormat:@"演员 : %@ ,  %@",dicc[@"actor1"],dicc[@"actor2"]];
            yanYuanLabel.numberOfLines = 2;
            yanYuanLabel.textColor = wantLabel.textColor;
            yanYuanLabel.font = wantLabel.font;
            [scrollView addSubview:yanYuanLabel];
            
            
            i++;
        }
        

        _tableView.tableHeaderView = headView;
        [_tableView reloadData];
        
    } fail:^(NSError *error) {
        
    }];
    
    
}


-(void)tapACtion:(UITapGestureRecognizer *)tap
{
    
    
    BuyRYViewControllerA * buyA = [[BuyRYViewControllerA alloc] init];
    
    buyA.dic = _dataSourceS[tap.view.tag - 8060];
    buyA.isTwoPage = @"ok";
    
    [self.navigationController pushViewController:buyA animated:YES];
    
}




-(void)prepareDataSource:(NSString *)cityID
{
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:[NSString stringWithFormat:SHANGYING_URL,cityID] parameters:nil sucess:^(NSData *data) {
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSArray * array = dic[@"moviecomings"];
        
        [_dataSource addObjectsFromArray:[BuyHelp monthSelect:array]];
        ;
        [_tableView reloadData];
        
    } fail:^(NSError *error) {
        
    }];
}





-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return _dataSource.count;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray * arr = _dataSource[section];
    return arr.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShangYingTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"shangCell"];
    if (!cell) {
        cell = [[ShangYingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"shangCell"];
    }
    
    NSDictionary * dic = _dataSource[indexPath.section][indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell prepareUI:dic];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}




-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_MainScreenWidth-20, 30)];
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, K_MainScreenWidth-20, 30)];
    label.backgroundColor = [UIColor whiteColor];
    NSArray * arr = _dataSource[section];
    NSDictionary * dic = arr[0];
    label.text = [NSString stringWithFormat:@"%@月",dic[@"rMonth"]];
    label.font = [UIFont systemFontOfSize:17 weight:16];
    [view addSubview:label];
    
    UIImageView * line = [[UIImageView alloc] initWithFrame:CGRectMake(20, 29, K_MainScreenWidth-20, 1)];
    line.backgroundColor = [UIColor colorWithWhite:0.796 alpha:1.000];
    [view addSubview:line];
    
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}



-(void)guangGao:(NSString *)cityID
{
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:[NSString stringWithFormat:GUANGGAO_URL,cityID] parameters:nil sucess:^(NSData *data) {
        
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray * arr = dic[@"advList"];
        NSDictionary * dicc = arr[2];
        
        
        UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 10, K_MainScreenWidth, bgView.bounds.size.height)];
        webView.backgroundColor = bgView.backgroundColor;
        
        NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:dicc[@"url"]]];

        [webView loadRequest:request];
        
        [bgView addSubview:webView];
        
        [_tableView reloadData];
        
    } fail:^(NSError *error) {
        
    }];
}







-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BuyRYViewControllerA * buyA = [[BuyRYViewControllerA alloc] init];
    
    buyA.dic = _dataSource[indexPath.section][indexPath.row];
    buyA.isTwoPage = @"ok";
    
    [self.navigationController pushViewController:buyA animated:YES];
    
    
}









@end
