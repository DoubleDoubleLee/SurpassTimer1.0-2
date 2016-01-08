//
//  LYFilmsViewController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//
#define HeardUrl @"http://api.m.mtime.cn/PageSubArea/GetRecommendationIndexInfo.api"
#define FilmsURL @"http://api.m.mtime.cn/MobileMovie/Review.api?needTop=false"

#import "LYFilmsViewController.h"
#import "LJCSHDownload.h"
#import "UIImageView+WebCache.h"
#import "LYFilmsCell.h"
#import "LYFilmsModel.h"
#import "LYFindModel.h"
#import "LYFilmsNextController.h"
@interface LYFilmsViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableview;
    NSMutableArray *_dataSource;

}

@end

@implementation LYFilmsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.Titles=@"review";
    [self createUI];
    
    [self downLoad];
    [self DownLoad1];
}
-(void)downLoad
{
   [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:FilmsURL parameters:nil sucess:^(NSData *data) {
       NSArray *arr=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
       for (NSDictionary *dic in arr) {
           LYFilmsModel *model=[[LYFilmsModel alloc]init];
           [model setValuesForKeysWithDictionary:dic];
           
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
        
        NSDictionary *dict=dic[@"review"];
        
        
        // [_TitlesArr addObject:model];
        UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, K_MainScreenWidth, 230)];
        [imageview sd_setImageWithURL:[NSURL URLWithString:dict[@"imageUrl"]]];
        UIImageView *im=[[UIImageView alloc]initWithFrame:CGRectMake(0, 230-64, K_MainScreenWidth, 64)];
        im.backgroundColor=[UIColor colorWithRed:0.040 green:0.084 blue:0.139 alpha:0.500];
        [imageview addSubview:im];
        
        
        
        UILabel *lables=[[UILabel alloc]initWithFrame:CGRectMake(120, 5, 190, 35)];
        lables.text=dict[@"movieName"];
        lables.font=[UIFont systemFontOfSize:19];
        lables.textAlignment=NSTextAlignmentLeft;
        lables.textColor=[UIColor whiteColor];
        [im addSubview:lables];
        
        UILabel *lables1=[[UILabel alloc]initWithFrame:CGRectMake(100, 22, 200, 35)];
        lables1.text=dict[@"title"];
        lables1.font=[UIFont systemFontOfSize:14];
        lables1.textAlignment=NSTextAlignmentCenter;
        lables1.textColor=[UIColor whiteColor];
        [im addSubview:lables1];
        
        UIImageView *Bdimage=[[UIImageView alloc]initWithFrame:CGRectMake(119, 30, 10, 10)];
        Bdimage.image=[UIImage imageNamed:@"icon_hot_show_quote@2x"];
       [im addSubview:Bdimage];
        
        UIImageView *imageview1=[[UIImageView alloc]initWithFrame:CGRectMake(20, 230-64-45, 80, 100)];
        [imageview1 sd_setImageWithURL:[NSURL URLWithString:dict[@"posterUrl"]]];
        [imageview addSubview:imageview1];

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
        NSDictionary *dict=dic[@"review"];
        LYFilmsNextController *vc=[[LYFilmsNextController alloc]init];

        vc.LYid=dict[@"reviewID"];
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
    return 110.0f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYFilmsNextController *vc=[[LYFilmsNextController alloc]init];
    LYFilmsModel *model=_dataSource[indexPath.row];
    vc.LYid=model.LYid;
    [self.navigationController pushViewController:vc animated:NO];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYFilmsCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"LYFilmsCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    LYFilmsModel *model=_dataSource[indexPath.row];
    cell.cellnickname.text=model.nickname;
    [cell.cellUserimage sd_setImageWithURL:[NSURL URLWithString:model.userImage]];
   
    cell.celltitlesA.text=model.title;
    //cell.cellsummary.text=model.summary;//
 //  NSString *SumStr=[model.summary ]
    NSArray *arr=[model.summary componentsSeparatedByString:@" "];
    NSString *str1=[arr componentsJoinedByString:@""];
    NSArray *arr1=[str1 componentsSeparatedByString:@"\n"];
    NSString *str2=[arr1 componentsJoinedByString:@""];
    cell.cellsummary.text=str2;
    
    NSDictionary *dic=model.relatedObj;
    cell.cellFilmname.text= [NSString stringWithFormat:@"《%@》",dic[@"title"]];
    [cell.cellimages sd_setImageWithURL:[NSURL URLWithString:dic[@"image"]]];
    
    if (![model.rating isEqualToString:@"0.0"]) {
        cell.cellratingss.text=model.rating;
        cell.cellImageColor.backgroundColor=[UIColor colorWithRed:0.211 green:0.723 blue:0.285 alpha:1.000];
    }
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
