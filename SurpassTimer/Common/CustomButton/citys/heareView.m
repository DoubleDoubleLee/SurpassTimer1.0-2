//
//  heareView.m
//  citylistluyu
//
//  Created by qianfeng on 15/11/24.
//  Copyright © 2015年 陆宇. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "heareView.h"

@implementation heareView
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _lable=[[UILabel alloc]init];

        [self addSubview:_lable];
        
    }

    return self;
}

@end
