//
//  Help.m
//  SinaWeiboClient
//
//  Created by 黎跃春 on 15/11/10.
//  Copyright © 2015年 黎跃春. All rights reserved.
//

#import "Help.h"
#import "Macro.h"
@implementation Help


+ (NSURL *)getUrlWithBasePath:(NSString *)baseUrl andParams:(NSDictionary *)params {
//https://api.weibo.com/oauth2/authorize?client_id=3601604349&redirect_uri=http://hi.baidu.com/jt_one&display=mobile&response_type=token
    if (params == nil) {
        
        return [NSURL URLWithString:baseUrl];
    }
    
//    client_id=3601604349
//    display=mobile
//    redirect_uri=http://hi.baidu.com/jt_one
//    response_type=token
    NSMutableArray *mutableArr = [NSMutableArray array];
    
    for (NSString *key in params.keyEnumerator) {
        NSString *keyValue = [NSString stringWithFormat:@"%@=%@",key,params[key]];
//        NSLog(@"%@",keyValue);
        [mutableArr addObject:keyValue];
    }
    
    NSString *path = [mutableArr componentsJoinedByString:@"&"];
//    client_id=3601604349&redirect_uri=http://hi.baidu.com/jt_one&display=mobile&response_type=token
    path = [NSString stringWithFormat:@"%@?%@",baseUrl,path];
    
    return [NSURL URLWithString:path];

}

+ (NSString *)getLoginInfo:(NSString *)info andKey:(NSString *)key {
    //access_token=2.00h_DVtCjoxjvD5de6ab9adamgiBvC&remind_in=662428&expires_in=662428&uid=2652365065
    //    access_token=  2.00h_DVtCjoxjvD5de6ab9adamgiBvC
    NSArray *array = [info componentsSeparatedByString:@"&"];
    NSString *value = nil;
    for (NSString *str in array) {
        if ([str containsString:key]) {
            //            access_token=
            //            access_token=2.00h_DVtCjoxjvD5de6ab9adamgiBvC
            
            value = [str substringFromIndex:key.length];
            
            break;
        }
    }
    
    
    
    return value;;
}


+ (BOOL)isExpired {
    
    NSDate *expiredDate = [[NSUserDefaults standardUserDefaults] objectForKey:EXPIRES_DATE];
    NSDate *currentDate = [NSDate date];
    
    NSComparisonResult result = [expiredDate compare:currentDate];
    //    0-1
    //    0-0
    //    1-0
    /*
     typedef NS_ENUM(NSInteger, NSComparisonResult) {NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending};
     */
    
    if (result == NSOrderedAscending) {
        
        return YES;
    }
    
    return NO;
}

@end












