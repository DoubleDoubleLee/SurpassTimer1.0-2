//
//  LYFilmsNextController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/12/2.
//  Copyright © 2015年 L-J-C. All rights reserved.
//
#define NextFilmUrl @"http://api.m.mtime.cn/Review/Detail.api?reviewId=%@"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "LYFilmsNextController.h"
#import "LJCSHDownload.h"
#import "UIImageView+WebCache.h"
#import "LYNextFilmModel.h"


@interface LYFilmsNextController ()<UIWebViewDelegate>
{
    NSMutableArray *_dataSource;
}

@end

@implementation LYFilmsNextController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    OrekiNavigationBar *ace=[OrekiNavigationBar BarType:BarTypeOfDefault andWithController:self];
    [self.view addSubview:ace];
    [self download];
}

-(void)download
{
    NSString *path=[NSString stringWithFormat:NextFilmUrl,self.LYid];
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:path parameters:nil sucess:^(NSData *data) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

       // NSDictionary *dicc=dic[@"relatedObj"];
        
        
      
//        UILabel *titel=[[UILabel alloc]initWithFrame:CGRectMake(6, 64, K_MainScreenWidth, 40)];
//        titel.text=[NSString stringWithFormat:@"%@",dic[@"title"]];
//
//        titel.font=[UIFont systemFontOfSize:18];
//        [self.view addSubview:titel];
//        //头像
//        UIImageView *Userimage=[[UIImageView alloc]initWithFrame:CGRectMake(6, 110, 35, 35)];
//        [Userimage sd_setImageWithURL:[NSURL URLWithString:dic[@"userImage"]]];
//        Userimage.layer.masksToBounds=YES;
//        Userimage.layer.cornerRadius=35/2.0;
//        [self.view addSubview:Userimage];
//        
//        UILabel *username=[[UILabel alloc]initWithFrame:CGRectMake(6+35+3+2, 110, 100, 20)];
//        username.text=dic[@"nickname"];
//        username.font=[UIFont systemFontOfSize:13 ];
//        [self.view addSubview:username];
//       
//        UILabel *pingjia=[[UILabel alloc]initWithFrame:CGRectMake(44, 130, 80, 20)];
//        pingjia.text=dicc[@"title"];
//        pingjia.font=[UIFont systemFontOfSize:13];
//        pingjia.textColor=[UIColor colorWithWhite:0.716 alpha:1.000];
//        [self.view addSubview:pingjia];
//        
//        UIImageView *imageImage=[[UIImageView alloc]initWithFrame:CGRectMake(K_MainScreenWidth-K_MainScreenWidth-110, 100, 80, 90)];
//        [imageImage sd_setImageWithURL:[NSURL URLWithString:dicc[@"image"]]];
//        [self.view addSubview:imageImage];
//        
        
        UIWebView *web=[[UIWebView alloc]initWithFrame:CGRectMake(0, 64, K_MainScreenWidth, K_MainScreenHeight)];
        [web loadHTMLString:dic[@"content"] baseURL:nil];
        [self.view addSubview:web];
        
        
        
     
    } fail:^(NSError *error) {
        
    }];

}
-(void)createUI
{

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
