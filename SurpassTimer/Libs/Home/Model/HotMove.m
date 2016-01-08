//
//  HotMove.m
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "HotMove.h"

@implementation HotMove



+ (instancetype)hotMoveWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return self;
}

@end
