//
//  LYNextphotoscontroller.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/30.
//  Copyright © 2015年 L-J-C. All rights reserved.
//
#define PhotoUrl @"http://api.m.mtime.cn/News/Detail.api?newsId=%@"

#import "LYNextphotoscontroller.h"
#import "LJCSHDownload.h"
#import "UIImageView+WebCache.h"
#import "SDCycleScrollView.h"
@interface LYNextphotoscontroller ()<UIWebViewDelegate>

@end

@implementation LYNextphotoscontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self DownLoad];
}
-(void)CreateUI
{
   // NSLog(@"z走么");
    UIWebView *web=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT+10)];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://vf3.mtime.cn/Video/2015/11/25/mp4/151125141330403099.mp4"]];
    [self.view addSubview:web];
    [web loadRequest:request];
    

}
-(void)DownLoad
{
    NSString *path=[NSString stringWithFormat:PhotoUrl,self.LYid];
  [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:path parameters:nil sucess:^(NSData *data) {
      
      
      
  } fail:^(NSError *error) {
      
  }];
    
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
