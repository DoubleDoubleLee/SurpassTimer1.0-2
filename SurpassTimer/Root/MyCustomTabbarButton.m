//
//  MyCustomTabbarButton.m
//  HandForLOLForMe
//
//  Created by 陈曹振 on 15/11/10.
//  Copyright © 2015年 ccz. All rights reserved.
//

#import "MyCustomTabbarButton.h"
#import "UIImage+CCZ.h"
#import "BadgeButton.h"

@interface MyCustomTabbarButton ()
@property(nonatomic,strong)BadgeButton * badgeButton;

@end

@implementation MyCustomTabbarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithRed:0.25f green:0.53f blue:0.77f alpha:1.00f] forState:UIControlStateSelected];
        
        [self setBackgroundImage:[UIImage imageNamed:@"tab_bar_background"] forState:UIControlStateSelected];
        
        // 添加一个提醒数字按钮
        BadgeButton * badgeButton = [BadgeButton buttonWithType:UIButtonTypeCustom];
        badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:badgeButton];
        self.badgeButton = badgeButton;
        
        
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted{};


- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * 0.6+13;
    return CGRectMake(0, 0, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * 0.4;
    return CGRectMake(0, contentRect.size.height * 0.6, imageW, imageH);
}

// 设置item
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    // KVO监听属性改变
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
}
// 记得释放
- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
    [self.item removeObserver:self forKeyPath:@"image"];
}

/**
 *  监听到某个对象的属性改变就会调用
 *
 *  @param keyPath 属性名
 *  @param object  那个对象的属性改变
 *  @param change  属性发生改变
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    
    // 设置文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
    // 设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    // 设置提醒数字
    self.badgeButton.badgeValue = self.item.badgeValue;
    // 设置提醒数字的位置
    CGFloat badgeY = 5;
    CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width - 30;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeButton.frame = badgeF;
    
}

@end
