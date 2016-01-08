//
//  LYTrailerNextModel.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/29.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "LYTrailerNextModel.h"

@implementation LYTrailerNextModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.LYid=value;
    }
    
}
@end
