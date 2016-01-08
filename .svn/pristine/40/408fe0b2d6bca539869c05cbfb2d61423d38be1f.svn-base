//
//  CCZRoundView.m
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/24.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "CCZRoundView.h"
#import "UIImage+CCZ.h"
#import "CCZDownLoadUrl.h"

@implementation CCZRoundView
{
    UILabel * _label;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addBackgroundImage];
        [self addBuyTickets];
        [self addSubview:self.lable];
        
    }
    return self;
}

- (void)addBackgroundImage
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.image = [UIImage imageNamed:@"icon_arc+rectangle8"];
    [self addSubview:imageView];
    
}


- (void)addBuyTickets
{
    UIButton * buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat buyBtnY = -20;
    CGFloat buyBtnW = 180;
    CGFloat buyBtnX = K_MainScreenWidth/2 - buyBtnW/2;
    CGFloat buyBtnH = 40;
    buyBtn.frame = CGRectMake(buyBtnX, buyBtnY, buyBtnW, buyBtnH);
    [buyBtn setTitle:@"选座购票" forState:UIControlStateNormal];
    [buyBtn setBackgroundImage:[UIImage resizedImageWithName:@"icon_button_buy_ticket"] forState:UIControlStateNormal];
    [buyBtn addTarget:self action:@selector(buyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buyBtn];
}

#pragma mark - 选座购票方法
- (void)buyBtnClick:(UIButton *)buyBtn
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pushSelectObject" object:self];
    
}

- (UILabel *)lable
{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textColor = [UIColor colorWithRed:1.00f green:0.54f blue:0.00f alpha:1.00f];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.numberOfLines = 0;
        CGFloat labelY = 40;
        CGFloat labelW = K_MainScreenWidth;
        CGFloat labelX = K_MainScreenWidth/2 - labelW/2;;
        CGFloat labelH = 30;
        _label.frame = CGRectMake(labelX, labelY, labelW, labelH);
    }
    return _label;
}

@end
