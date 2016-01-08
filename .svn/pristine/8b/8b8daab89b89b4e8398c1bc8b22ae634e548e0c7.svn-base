//
//  LYTrailerNextController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/29.
//  Copyright © 2015年 L-J-C. All rights reserved.
//
#define LYtopUrl @"http://api.m.mtime.cn/TopList/TopListDetails.api?pageIndex=%d&topListId=%@"
#import "LYTrailerNextController.h"
#import "LJCSHDownload.h"
#import "UIImageView+WebCache.h"
#import "LYTrailerNextModel.h"
#import "LYTrailerNextCell1.h"
#import "LYTrailerNextCell11.h" //人排行
#import "LYTrailerNextModel1.h"
#import "MJRefresh.h"

@interface LYTrailerNextController ()<UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate>
{
    NSMutableArray *_dataSource;
    UITableView *_tableview;
    NSMutableArray *_dataSource11;
    MJRefreshFooterView *footer;
    MJRefreshHeaderView *header;
    
    int _index;
    
    CGFloat ff;
    CGFloat aa;//lable高度 自适应
}

@end

@implementation LYTrailerNextController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    aa=40;
    //ff=0;
    _index=1;
    OrekiNavigationBar * ob = [OrekiNavigationBar BarType:BarTypeOfCollect andWithController:self];
    [self.view addSubview:ob];
    [self createUI];
    
    [self downLoad];
    [self AddsubviewRefresh];
}
//加刷新
-(void)AddsubviewRefresh
{
    header=[MJRefreshHeaderView header];
    footer=[MJRefreshFooterView footer];
    header.delegate=self;
    footer.delegate=self;
    
 //   header.scrollView=_tableview;
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
        [self downLoad];
    }
}
-(void)downLoad
{
    NSString *path=[NSString stringWithFormat:LYtopUrl,_index,self.LYid];
    NSLog(@"%@",path);
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:path parameters:nil sucess:^(NSData *data) {
        
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        
        UIView *HearView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, K_MainScreenWidth, 100)];
         _tableview.tableHeaderView=HearView;
        HearView.backgroundColor=[UIColor colorWithWhite:0.875 alpha:1.000];
        UILabel *namelabel=[[UILabel alloc]initWithFrame:CGRectMake(11, 15, K_MainScreenWidth-22, 30)];
        NSDictionary *dicc=dic[@"topList"];
        namelabel.text=dicc[@"name"];
        namelabel.font=[UIFont systemFontOfSize:18];
        [HearView addSubview:namelabel];
        
        UILabel *summarLable=[[UILabel alloc]initWithFrame:CGRectMake(15, 45, K_MainScreenWidth-22, 40)];
        summarLable.text=dicc[@"summary"];
        summarLable.numberOfLines=0;
        summarLable.font=[UIFont systemFontOfSize:12];
        [HearView addSubview:summarLable];
       
        
        
        
        if (dic[@"persons"]!=nil) {
            for (NSDictionary *dict in dic[@"persons"]) {
                LYTrailerNextModel *model1=[[LYTrailerNextModel alloc]init];
                [model1 setValuesForKeysWithDictionary:dict];
             
                [_dataSource addObject:model1];
               // NSLog(@"%@",dict);
            }
        }
        
        
        
        
        else if (dic[@"movies"]!=nil) {
            
            for (NSDictionary *dict in dic[@"movies"]) {
                LYTrailerNextModel *model=[[LYTrailerNextModel alloc]init];
                [model setValuesForKeysWithDictionary:dict];
                [_dataSource addObject:model];
            }
        }
        
        
        [_tableview reloadData];
        
    } fail:^(NSError *error) {
        
    }];
    
}
-(void)createUI
{
    _dataSource=[[NSMutableArray alloc]init];
    _tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, K_MainScreenWidth, K_MainScreenHeight-64)];
    _tableview.delegate=self;
    _tableview.dataSource=self;
 
    [self.view addSubview:_tableview];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
  // NSLog(@"%f", 127+9+ff+20);
   return 127+9+ff+20;
   
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYTrailerNextModel *model1=_dataSource[indexPath.row];
  //  LYTrailerNextModel1 *model11=_dataSource[indexPath.row];
   // NSLog(@"%zhehsi猫@",model11);
    if (model1.director!=nil) {
        
        LYTrailerNextCell1 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell=[[[NSBundle mainBundle] loadNibNamed:@"LYTrailerNextCell1" owner:self options:nil] lastObject];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.cellname.text=model1.name;
        cell.cellnameEN.text=model1.nameEn;
        cell.cellRankNum.text=[NSString stringWithFormat:@"%.2d",[model1.rankNum intValue]];
        cell.celldirector.text=[NSString stringWithFormat:@"导演: %@",model1.director];
        cell.cellreleaseDate.text=[NSString stringWithFormat:@"上映日期: %@ %@",model1.releaseDate,model1.releaseLocation];
        cell.cellactor.text=[NSString stringWithFormat:@"主演: %@",model1.actor];
        
        cell.cellrating.text=[NSString stringWithFormat:@"%.1f",[model1.rating floatValue]];
        cell.cellremark.numberOfLines=0;
        
        
        
        /*
         
         _______ ___________________________________________________________________
         
         
         */
        // NSLog(@"这是 描述 的高 %f",cell.cellremark.frame.size.height);
        NSString *str1=model1.remark;
        NSDictionary *dic=@{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        
        CGSize RemarkLabel=[str1 sizeWithAttributes:dic];
        ff=(RemarkLabel.width/(K_MainScreenWidth-54+8)*15);
        
        
        cell.cellremark.font=[UIFont systemFontOfSize:12];
        /*
         ___________________________________________________________________
         
         */
        //        cell.cellremark.frame=CGRectMake(57, 147+11, K_MainScreenWidth-58-8, aa);
        //        NSLog(@"+++++++aa");
        //        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Ontap:)];
        //        cell.cellremark.userInteractionEnabled=YES;
        //        [cell.cellremark addGestureRecognizer:tap];
        
        cell.cellremark.frame=CGRectMake(37 , 127+9, K_MainScreenWidth-54-8, ff+20);
        
        cell.cellremark.text=model1.remark;
        
        if (indexPath.row==0) {
            cell.yuanImage.layer.masksToBounds=YES;
            cell.yuanImage.layer.cornerRadius=26/2.0;
            cell.yuanImage.backgroundColor=[UIColor colorWithRed:0.859 green:0.861 blue:0.004 alpha:1.000];
        }else if (indexPath.row==1){
            cell.yuanImage.layer.masksToBounds=YES;
            cell.yuanImage.layer.cornerRadius=26/2.0;
            cell.yuanImage.backgroundColor=[UIColor colorWithRed:0.319 green:0.920 blue:0.948 alpha:1.000];
            
        }else if (indexPath.row==2){
            cell.yuanImage.layer.masksToBounds=YES;
            cell.yuanImage.layer.cornerRadius=26/2.0;
            cell.yuanImage.backgroundColor=[UIColor colorWithRed:0.354 green:0.957 blue:0.308 alpha:1.000];
            
        }else{
            cell.yuanImage.layer.masksToBounds=YES;
            cell.yuanImage.layer.cornerRadius=26/2.0;
            cell.yuanImage.backgroundColor=[UIColor colorWithWhite:0.690 alpha:1.000];
        }
        
        
        [cell.cellposterUrlimage sd_setImageWithURL:[NSURL URLWithString:model1.posterUrl]];
        
        
        return cell;
    }else {
        
        LYTrailerNextCell11 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
        //LYTrailerNextModel1 *model11=_dataSource[indexPath.row];
   
                if (!cell) {
                    cell=[[[NSBundle mainBundle] loadNibNamed:@"LYTrailerNextCell11" owner:self options:nil] lastObject];
                }
        
        
//               NSString *str1=model1.summary;
//               NSDictionary *dic=@{NSFontAttributeName:[UIFont systemFontOfSize:13]};
//        
//                CGSize RemarkLabel=[str1 sizeWithAttributes:dic];
//                ff=(RemarkLabel.width/(K_MainScreenWidth-54+8)*15);
//        
//                cell.cellsummary.font=[UIFont systemFontOfSize:12];
//
//        
//                cell.cellsummary.frame=CGRectMake(37 , 127+9, K_MainScreenWidth-54-8, ff+20);
        
        
        
               cell.cellsummary.numberOfLines=0;
              cell.cellsummary.text=model1.summary;
        
                //圆
               // cell.cellsubBgimage
                [cell.cellposterUrl sd_setImageWithURL:[NSURL URLWithString:model1.posterUrl]];
        
                cell.cellnameCn.text=model1.nameCn;
                cell.cellnameEn.text=model1.nameEn;
                cell.cellbirthDay.text=[NSString stringWithFormat:@"%@,%@(%@)",model1.sex,model1.birthDay,model1.birthLocation];
        
                cell.cellrating.text=[NSString stringWithFormat:@"%.1f",[model1.rating floatValue]];
                cell.cellrankNum.text= [NSString stringWithFormat:@"%.2d", [model1.rankNum intValue ]] ;
        if (indexPath.row==0) {
            cell.cellsubBgimage.layer.masksToBounds=YES;
            cell.cellsubBgimage.layer.cornerRadius=26/2.0;
            cell.cellsubBgimage.backgroundColor=[UIColor colorWithRed:0.859 green:0.861 blue:0.004 alpha:1.000];
        }else if (indexPath.row==1){
            cell.cellsubBgimage.layer.masksToBounds=YES;
            cell.cellsubBgimage.layer.cornerRadius=26/2.0;
            cell.cellsubBgimage.backgroundColor=[UIColor colorWithRed:0.319 green:0.920 blue:0.948 alpha:1.000];
            
        }else if (indexPath.row==2){
            cell.cellsubBgimage.layer.masksToBounds=YES;
            cell.cellsubBgimage.layer.cornerRadius=26/2.0;
            cell.cellsubBgimage.backgroundColor=[UIColor colorWithRed:0.354 green:0.957 blue:0.308 alpha:1.000];
            
        }else{
            cell.cellsubBgimage.layer.masksToBounds=YES;
            cell.cellsubBgimage.layer.cornerRadius=26/2.0;
            cell.cellsubBgimage.backgroundColor=[UIColor colorWithWhite:0.690 alpha:1.000];
        }
        
        
        return cell;
        
    }
//    else {
//        UITableViewCell *cell;
//        
//        
//        
//        
//        
//        return cell;
//    
//    
//    }
    
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

/*______________________________________________________________*/
-(void)Ontap:(UITapGestureRecognizer *)tap
{
    NSLog(@"走没走?");
    
    aa=aa+ff-20;
    [_tableview reloadData];
    
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
