//
//  TitleButton.m
//  exercise
//
//  Created by 陈曹振 on 15/11/24.
//  Copyright © 2015年 ccz. All rights reserved.
//

#import "TitleButton.h"

@implementation TitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.adjustsImageWhenHighlighted = NO; // 高亮的时候不要自动调整图标
                self.titleLabel.font = [UIFont boldSystemFontOfSize:15]; // 字体
        self.imageView.contentMode = UIViewContentModeLeft; // 图片居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter; // 文字右对齐
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal]; // 文字颜色
    }
    return self;
}


- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = 20;
    CGFloat imageX = contentRect.size.width - contentRect.size.width/2+3;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    CGFloat titleY = 0;
    CGFloat titleX = 0;
    CGFloat titleW = contentRect.size.width - 40;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}



@end
