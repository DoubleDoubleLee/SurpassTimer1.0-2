//
//  BuyReYingViewController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/24.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#define REYing_URL @"http://api.m.mtime.cn/Showtime/LocationMovies.api?locationId=%@"


#import "BuyReYingViewController.h"
#import "ReYingTableViewCell.h"
#import "LJCSHDownload.h"
#import "BuyHelp.h"
#import "BuyRYViewControllerA.h"


@interface BuyReYingViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    NSMutableArray * _dataSource;
    UITableView * _tableView;
}
@end

@implementation BuyReYingViewController


+(id)shareBuyReYingViewController
{
    static BuyReYingViewController * BuyReYing = nil;
    if (BuyReYing == nil) {
        BuyReYing = [[BuyReYingViewController alloc] init];
    }
    return BuyReYing;
}
 




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self prepareTableView];
    
    //[[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"292"] forKey:@"cityID"];
    
    [self createBlock];
    
    NSString * str = [[NSUserDefaults standardUserDefaults] objectForKey:@"cityID"];
    
    
    
    [self prepareDataSource:str];
}



-(void)prepareTableView
{
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 29, K_MainScreenWidth, K_MainScreenHeight-64-29-49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _dataSource = [[NSMutableArray alloc] init];
    
}



-(void)prepareDataSource:(NSString * )cityID
{
    
    
   [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:[NSString stringWithFormat:REYing_URL,cityID] parameters:nil sucess:^(NSData *data) {
       
       NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
       
       NSArray * array = dict[@"ms"];
       
       for (NSDictionary * dicc in array) {
           [_dataSource addObject:dicc];
           
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
    ReYingTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"reYingCell"];
    if (!cell) {
        
        cell = [[ReYingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reYingCell"];
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell prepareUI:_dataSource[indexPath.row]];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BuyRYViewControllerA * buyA = [[BuyRYViewControllerA alloc] init];
    buyA.dic = _dataSource[indexPath.row];
    
    [self.navigationController pushViewController:buyA animated:YES];
}








-(void)createBlock
{
    LocationViewController * lvc = [LocationViewController shareLocationViewController];
    
    lvc.block = ^(){
        NSString * str = [[NSUserDefaults standardUserDefaults] objectForKey:@"cityID"];
        [self prepareDataSource:str];
    };
}

@end




















