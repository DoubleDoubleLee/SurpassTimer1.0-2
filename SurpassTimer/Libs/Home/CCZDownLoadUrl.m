//
//  CCZDownLoadUrl.m
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "CCZDownLoadUrl.h"

@implementation CCZDownLoadUrl


// 扑克视图的json文件
#define HeaderPokerViewURl @"http://api.m.mtime.cn/PageSubArea/HotPlayMovies.api?locationId=290"

// cell json文件
#define CelljsonURL @"http://api.m.mtime.cn/PageSubArea/GetFirstPageAdvAndNews.api?subFifthParam=18159583%2319%231&subFistParam=17728960%2310%231&subSecondParam=17304115%2310%231&subThirdParam=17304116%2310%230"


+ (NSString *)getHeaderPokerViewURl
{
    return HeaderPokerViewURl;
}

+(NSString *)getCellURL
{
    return CelljsonURL;
}
@end
