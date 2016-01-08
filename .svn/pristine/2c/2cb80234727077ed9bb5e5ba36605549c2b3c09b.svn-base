//
//  CustomCell.m
//  citylistluyu
//
//  Created by qianfeng on 15/11/24.
//  Copyright © 2015年 陆宇. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "CustomCell.h"

@implementation CustomCell

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        [self createUI];
    }
    
    
    return self;
    
}
-(void)createUI
{

    _Cityslable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH/4, 44)];
    _Cityslable.textAlignment=NSTextAlignmentCenter;
    _Cityslable.font=[UIFont systemFontOfSize:15];
    
    [self.contentView addSubview:_Cityslable];

    
}
@end
