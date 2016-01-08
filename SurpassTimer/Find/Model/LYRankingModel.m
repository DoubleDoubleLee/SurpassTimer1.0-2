//
//  LYRankingModel.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/27.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "LYRankingModel.h"

@implementation LYRankingModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.LYid=value;
    }
}
@end
