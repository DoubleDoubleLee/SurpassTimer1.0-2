//
//  LYTrailerViewController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//
#define LYTrailerUrl @"http://api.m.mtime.cn/PageSubArea/TrailerList.api"
#define HeardUrl @"http://api.m.mtime.cn/PageSubArea/GetRecommendationIndexInfo.api"

#import "LYTrailerViewController.h"
#import "LJCSHDownload.h"
#import "UIImageView+WebCache.h"
#import "LYTrailerModel.h"
#import "LYTrailerTableViewCell.h"
#import "FindViewController.h"
#import "LYFindModel.h"
#import "LYTrailerNextController.h"

#import "LYVoidViewController.h"
#import "MJRefresh.h"

@interface LYTrailerViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableview;
    NSMutableArray *_dataSource;
   
}

@end

@implementation LYTrailerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.Titles=@"trailer";
  [self createUI];
//
   [self DownLoad];
    [self DownLoad1];
    
}


-(void)createUI
{
     _dataSource=[[NSMutableArray alloc]init];
    _tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, K_MainScreenWidth, K_MainScreenHeight-100)];
    _tableview.delegate=self;
    _tableview.dataSource=self;
    
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, K_MainScreenWidth, K_MainScreenHeight-(330+64))];
    imageview.image=[UIImage imageNamed:@"1"];
    _tableview.tableHeaderView=imageview;
   
    [self.view addSubview:_tableview];
    
}
-(void)DownLoad
{
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:LYTrailerUrl parameters:nil sucess:^(NSData *data) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        for (NSDictionary *dict in dic[@"trailers"]) {
            LYTrailerModel *model=[[LYTrailerModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];

            [_dataSource addObject:model];
           
        }
        [_tableview reloadData];
    } fail:^(NSError *error) {
        
    }];
}

-(void)DownLoad1
{
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:HeardUrl parameters:nil sucess:^(NSData *data) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        //     NSDictionary *dict=dic[当前子视图管理器.titles];
        
        //self.childViewControllers[0]
        //NSLog(@"%@",[self.childViewControllers[0]].titles);
        LYFindModel *model=[[LYFindModel alloc]init];
        
        [model setValuesForKeysWithDictionary:dic];
        
        NSDictionary *dict=dic[@"trailer"];
        
        
        // [_TitlesArr addObject:model];
        UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, K_MainScreenWidth, 230)];
        [imageview sd_setImageWithURL:[NSURL URLWithString:dict[@"imageUrl"]]];
        UILabel *lables=[[UILabel alloc]initWithFrame:CGRectMake(0, 230-45, K_MainScreenWidth, 45)];
        lables.text=dict[@"title"];
        lables.backgroundColor=[UIColor colorWithRed:0.040 green:0.084 blue:0.139 alpha:0.500];
        lables.textAlignment=NSTextAlignmentCenter;
        lables.textColor=[UIColor whiteColor];
       [imageview addSubview:lables];
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [imageview addGestureRecognizer:tap];
        
        imageview.userInteractionEnabled=YES;
        _tableview.tableHeaderView =imageview;
        
        
        
        
    } fail:^(NSError *error) {
        
    }];
    
    
}
-(void)tapClick:(UITapGestureRecognizer *)tap
{
    //NSLog(@"+++++++++");
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:HeardUrl parameters:nil sucess:^(NSData *data) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSDictionary *dict=dic[@"trailer"];
        LYVoidViewController *voids=[[LYVoidViewController alloc]init];
        voids.Url=dict[@"hightUrl"];
        [self.navigationController pushViewController:voids animated:NO];
        
    } fail:^(NSError *error) {
        
    }];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.0f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYVoidViewController *voids=[[LYVoidViewController alloc]init];
    LYTrailerModel *model=_dataSource[indexPath.row];
    voids.Url=model.url;
    [self.navigationController pushViewController:voids animated:NO];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    LYTrailerTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell=[[[NSBundle mainBundle] loadNibNamed:@"LYTrailerTableViewCell" owner:self options:nil] lastObject];
        
    }
    LYTrailerModel *model=_dataSource[indexPath.row];
   
    cell.cellmovieName.text=model.movieName;
    cell.summary.text=model.summary;
    [cell.coverImg sd_setImageWithURL:[NSURL URLWithString:model.coverImg]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
