//
//  BuyScrollView.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/24.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "BuyScrollView.h"
#import "ButTitleView.h"


@interface BuyScrollView ()<UIScrollViewDelegate>
{
    UIScrollView * _scrollView;
    ButTitleView * _titleView;
}
@end
@implementation BuyScrollView

-(instancetype)initWithFrame:(CGRect)frame title:(NSArray *)titleNames pushControllers:(NSArray *)ControllerS
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self cgreateUI:titleNames pushControllers:ControllerS];
    }
    return self;
}



-(void)cgreateUI:(NSArray *)titleName pushControllers:(NSArray *)ControllerS
{
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 29,K_MainScreenWidth,K_MainScreenHeight-64-49-29)];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(K_MainScreenWidth*ControllerS.count, 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.directionalLockEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
    [self addSubviewsToScrollView:_scrollView pushControllers:ControllerS];
    
    
    __weak UIScrollView * scrollview = _scrollView;
    _titleView = [[ButTitleView alloc]initWithFrame:CGRectMake(0, 0,K_MainScreenWidth , 35)];
    _titleView.backgroundColor = [UIColor colorWithWhite:0.983 alpha:1.000];
    _titleView.titles = titleName;
    _titleView.buttonSelectAtIndex = ^(NSInteger index){
        scrollview.contentOffset = CGPointMake(K_MainScreenWidth*index, 0);
    };
    [self addSubview:_titleView];
}



-(void)addSubviewsToScrollView:(UIScrollView*)scrollView pushControllers:(NSArray *)ControllerS
{
    
    
    
    for (int i = 0; i < ControllerS.count; i++) {
        UIViewController * vc = ControllerS[i];
        vc.view.frame = CGRectMake(i*K_MainScreenWidth, -20, K_MainScreenWidth, K_MainScreenHeight);
        
        
        [_scrollView addSubview:vc.view];
        
    }
    
    
}



#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/K_MainScreenWidth;
    _titleView.currentPage = index;
}



@end
