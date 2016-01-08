//
//  LYNewsnextController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/28.
//  Copyright © 2015年 L-J-C. All rights reserved.
//
#define NewsNextUrl @"http://api.m.mtime.cn/News/Detail.api?newsId=%@"

#import "LYNewsnextController.h"
#import "LYNewsNextModel.h"
#import "LJCSHDownload.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"

@interface LYNewsnextController ()<UIScrollViewDelegate>
{
    NSMutableArray *_dataSource;
    UIScrollView *_scrollview;
    UIWebView *web;
}

@end

@implementation LYNewsnextController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OrekiNavigationBar * ob = [OrekiNavigationBar BarType:BarTypeOfCollect andWithController:self];
    [self.view addSubview:ob];
    
    
   
    _dataSource=[[NSMutableArray alloc]init];
    
    [self careateUI];
    [self downLoad];
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
//隐藏状态栏
-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)careateUI
{
    
//    self.automaticallyAdjustsScrollViewInsets=NO;
//    _scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, K_MainScreenWidth, K_MainScreenHeight+100)];
//    
//    _scrollview.contentSize=CGSizeMake(K_MainScreenWidth, K_MainScreenHeight*2+50);
////    _scrollview.showsHorizontalScrollIndicator=NO;
//    _scrollview.showsVerticalScrollIndicator=YES;
//    
//    _scrollview.delegate=self;
// 
//    [self.view addSubview:_scrollview];
    
    
}
-(void)downLoad
{
    NSString *path=[NSString stringWithFormat:NewsNextUrl,self.LYid];
    
    //NSLog(@"++++%@",path);
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:path parameters:nil sucess:^(NSData *data) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil  ];
        LYNewsNextModel *model=[[LYNewsNextModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        
        
        
        UILabel *titlelable=[[UILabel alloc]initWithFrame:CGRectMake(5, 64, 275, 40)];
        titlelable.textAlignment=NSTextAlignmentLeft;
        titlelable.text=dic[@"title"];
        titlelable.font=[UIFont systemFontOfSize:16];
        [self.view addSubview:titlelable];
        
        UILabel *DateLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 94, 200, 20)];
        DateLabel.text=[NSString stringWithFormat:@"%@ %@",dic[@"time"],dic[@"source"]];
        DateLabel.textAlignment=NSTextAlignmentLeft;
        DateLabel.font=[UIFont systemFontOfSize:9];
        [self.view addSubview:DateLabel];
        
//        UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(5, 144-64, K_MainScreenWidth-10, 250)];
//      //  NSArray *arr=dic[@"relations"];
//       // NSDictionary *Imagedic=arr[0];
//        
//       // [imageview sd_setImageWithURL:[NSURL URLWithString:Imagedic[@"image"]]];
//        
//        
//        [_scrollview addSubview:imageview];
        
    //    NSString *AA=[NSString stringWithFormat:@"%@",dic[@"content"]] ;
        NSString *AA=dic[@"content"];
       // NSLog(@"%@",AA);
//        NSArray *arr1=[AA componentsSeparatedByString:@"0:00"];
//        NSString *str1=arr1[1];
        NSArray *Aarr=[AA componentsSeparatedByString:@" "];
        NSString *strJIE=[Aarr componentsJoinedByString:@""];

        NSString *str=strJIE;
        NSDictionary *dic1=@{NSFontAttributeName:[UIFont systemFontOfSize:12]};
//
        CGSize Labelsize=[str boundingRectWithSize:CGSizeMake(100, 600) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dic1 context:nil].size;

        
        NSArray *aaa=[AA componentsSeparatedByString:@" "];
        NSString *bbb=[aaa componentsJoinedByString:@""];

       web=[[UIWebView alloc]initWithFrame:CGRectMake(5, 144-64+15, K_MainScreenWidth-10, Labelsize.height)];
        
        [web loadHTMLString:bbb baseURL:nil];
        [self.view addSubview:web];
        
            
        
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
