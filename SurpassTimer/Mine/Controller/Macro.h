//
//  Macro.h
//  SinaWeiboClient
//
//  Created by 黎跃春 on 15/11/6.
//  Copyright © 2015年 黎跃春. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#define SINA_APP_KEY                @"3601604349"
#define SINA_APP_SECRET             @"7894dfdd1fc2ce7cc6e9e9ca620082fb"
//#define SINA_APP_KEY                @"1890934714"
//#define SINA_APP_SECRET             @"0c22e76d0e01a5b7bba739f4d89463bc"
#define REDIRECT_URI @"http://hi.baidu.com/jt_one"


//用于存取token值
#define ACCESS_TOKEN @"ACCESS_TOKEN"
// token过期时间
#define EXPIRES_DATE  @"EXPIRES_DATE"
//当前登录的用户ID
#define UID @"UID"
#define REMIND_IN @"REMIND_IN"

//授权登录的接口
#define SINA_AUTHORIZE_SEVER  @"https://api.weibo.com/oauth2/authorize"


/**
 *  屏幕宽度
 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

/**
 *  屏幕高度
 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#endif /* Macro_h */










