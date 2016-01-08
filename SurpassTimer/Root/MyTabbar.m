//
//  MyTabbar.m
//  HandForLOLForMe
//
//  Created by 陈曹振 on 15/11/10.
//  Copyright © 2015年 ccz. All rights reserved.
//

#import "MyTabbar.h"
#import "MyCustomTabbarButton.h"


@interface MyTabbar ()

@property(nonatomic,strong)MyCustomTabbarButton * selectButton;

@end

@implementation MyTabbar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
//        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_bar_background"]];
    }
    return self;
}


- (void)addTabbarButtonWithItem:(UITabBarItem *)item
{
    // 1. 创建按钮
    MyCustomTabbarButton * button = [MyCustomTabbarButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:button];
    // 2.  设置数据
    button.item = item;
    
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
}

/**
 *  监听按钮点击
 */
- (void)buttonClick:(MyCustomTabbarButton *)button
{
    
    self.pushViewController(self.selectButton.tag,button.tag);
    
    self.selectButton.selected = NO;
    button.selected = YES;
    self.selectButton = button;
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonY = 0;
    CGFloat buttonH = self.frame.size.height;
    
    for (int index = 0; index < self.subviews.count; index++) {
        // 1. 取出按钮
        MyCustomTabbarButton * button = self.subviews[index];
        
        // 2. 设置按钮的frame
        CGFloat buttonX = index * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 3.绑定tag
        button.tag = index;
    }
}

@end
