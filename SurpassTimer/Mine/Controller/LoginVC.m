//
//  LoginVC.m
//  CityEasy2
//
//  Created by qianfeng on 15/11/22.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "LoginVC.h"
#import "Macro.h"
#import "Help.h"
@interface LoginVC ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView * webView;


@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
   OrekiNavigationBar * ob = [OrekiNavigationBar BarType:BarTypeOfBack andWithController:self];
    
    [self.view addSubview:ob];
    
    [self createWebView];
    
}




-(void)createWebView
{
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    NSDictionary * dic = @{@"client_id":SINA_APP_KEY, @"redirect_uri":REDIRECT_URI, @"display":@"mobile", @"response_type":@"token"};
    NSURL * url =[Help getUrlWithBasePath:SINA_AUTHORIZE_SEVER andParams:dic];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
}


//将要加载一个接口时调用
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    
    NSString *absoluteString = request.URL.absoluteString;
    NSArray *arr = [absoluteString componentsSeparatedByString:@"#"];
    if (arr.count > 1) {
        //登录成功，获取到token，uid，过期时间
        //http://hi.baidu.com/jt_one#access_token=2.00h_DVtCjoxjvD5de6ab9adamgiBvC&remind_in=662969&expires_in=662969&uid=2652365065
        //        2.00h_DVtCjoxjvD5de6ab9adamgiBvC
        //        662969
        //        2652365065
        
        NSString *str = arr[1];
        //        access_token=2.00h_DVtCjoxjvD5de6ab9adamgiBvC&remind_in=662969&expires_in=662969&uid=2652365065
        NSString *access_token = [Help getLoginInfo:str andKey:@"access_token="];
        //        NSString *remind_in = [Help getLoginInfo:str andKey:@"remind_in="];
        NSString *expires_in = [Help getLoginInfo:str andKey:@"expires_in="];
        NSString *uid = [Help getLoginInfo:str andKey:@"uid="];
        NSString *remind_in = [Help getLoginInfo:str andKey:@"remind_in="];
        
        //        1.先保持token和uid
        [[NSUserDefaults standardUserDefaults] setObject:access_token forKey:ACCESS_TOKEN];
        [[NSUserDefaults standardUserDefaults] setObject:uid forKey:UID];
        [[NSUserDefaults standardUserDefaults] setObject:remind_in forKey:REMIND_IN];
        
        
        
        
        //        2.保存时间
        if (expires_in != nil) {
            
            NSTimeInterval time = [expires_in longLongValue];
            
            NSDate *expireDate = [NSDate dateWithTimeIntervalSinceNow:time];
            
            [[NSUserDefaults standardUserDefaults] setObject:expireDate forKey:EXPIRES_DATE];
        }
        //        立即存储
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [self.navigationController popViewControllerAnimated:YES];
        return NO;
    }
    
    
   
    return YES;
}


////开始加载时调用
//- (void)webViewDidStartLoad:(UIWebView *)webView {
//    
//    //   NSLog(@"%s",__func__);
//    //    启动指示器
//    
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//}
////加载完成时调用
//- (void)webViewDidFinishLoad:(UIWebView *)webView {
//    
//    //    NSLog(@"%s",__func__);
//    //    关闭
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//}
////加载失败时调用
//- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
//    
//    //    NSLog(@"%s",__func__);
//    //    关闭
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//}


@end






















