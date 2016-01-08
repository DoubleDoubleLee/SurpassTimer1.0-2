//
//  LYRankingViewController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//
#define HeardUrl @"http://api.m.mtime.cn/PageSubArea/GetRecommendationIndexInfo.api"
#define RanKingsUrl @"http://api.m.mtime.cn/TopList/TopListOfAll.api?pageIndex="

#import "LYRankingViewController.h"
#import "LJCSHDownload.h"
#import "LYRankingCell.h"
#import "LYRankingModel.h"
#import "LYFindModel.h"
#import "LYTrailerNextController.h"
#import "MJRefresh.h"
@interface LYRankingViewController ()<UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate>
{
    UITableView * _tableview;
    NSMutableArray *_dataSource;
    MJRefreshFooterView *footer;
    MJRefreshHeaderView *header;
    int _index;
    NSString *UrlPath;
}

@end

@implementation LYRankingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _index=1;
    [self createUI];
    self.Titles=@"topList";
    [self Download];
    [self DownLoad1];
    [self AddsubviewRefresh];
}
//加刷新
-(void)AddsubviewRefresh
{
    header=[MJRefreshHeaderView header];
    footer=[MJRefreshFooterView footer];
    header.delegate=self;
    footer.delegate=self;
    
    header.scrollView=_tableview;
    footer.scrollView=_tableview;
    
    
}
-(void)refreshView:(MJRefreshBaseView *)refreshView stateChange:(MJRefreshState)state
{
//        if (refreshView==header) {
//            _index++;
//            //下拉刷新
//            [self Download];
//        }
    if (refreshView==footer) {
        
        _index++;
        [self Download];
    }
}
-(void)refreshPath
{
    NSString *Str1=[[NSString alloc]initWithFormat:RanKingsUrl];
    NSString *STR=[Str1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    UrlPath=[NSString stringWithFormat:@"%@%d",STR,_index];
    
    
    
}
-(void)Download
{
    NSString *path=[NSString stringWithFormat:@"http://api.m.mtime.cn/TopList/TopListOfAll.api?pageIndex=%d",_index];
   // NSLog(@"++++path");
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:path parameters:nil sucess:^(NSData *data) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSArray *arr=dic[@"topLists"];
        for (NSDictionary *dict in arr) {
            LYRankingModel *model=[[LYRankingModel alloc]init];
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
        
        NSDictionary *dict=dic[@"topList"];
        
        
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
    
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:HeardUrl parameters:nil sucess:^(NSData *data) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSDictionary *dict=dic[@"topList"];
        LYTrailerNextController *vc=[[LYTrailerNextController alloc]init];

        vc.LYid=dict[@"id"];
        [self.navigationController pushViewController:vc animated:NO];
        
    } fail:^(NSError *error) {
        
    }];
    
    
}
-(void)createUI
{
    _tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, K_MainScreenWidth, K_MainScreenHeight-100)];
    _tableview.delegate=self;
    _tableview.dataSource=self;
    _dataSource=[[NSMutableArray alloc]init];
    [self.view addSubview:_tableview];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYTrailerNextController *vc=[[LYTrailerNextController alloc]init];
    LYRankingModel *model=_dataSource[indexPath.row];
    vc.LYid=model.LYid;
    [self.navigationController pushViewController:vc animated:NO];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYRankingCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"LYRankingCell" owner:self options:nil] lastObject];
    }
     LYRankingModel *model=_dataSource[indexPath.row];
    cell.celltopListNameCn.text=model.topListNameCn;
    cell.cellsummary.text=model.summary;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
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
