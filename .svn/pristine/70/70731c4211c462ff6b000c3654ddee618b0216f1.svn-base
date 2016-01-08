//
//  ScrollButtonViewController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/23.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "ScrollButtonViewController.h"
#import "TitleView.h"


@interface ScrollButtonViewController ()<UIScrollViewDelegate>
{
    UIScrollView * _scrollView;
    TitleView * _titleView;
}
@end

@implementation ScrollButtonViewController


-(instancetype)initWithFrame:(CGRect)frame title:(NSArray *)titleNames pushControllers:(NSArray *)ControllerS
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self cgreateUI:titleNames pushControllers:ControllerS];
    }
    return self;
}

//隐藏状态栏
-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)cgreateUI:(NSArray *)titleName pushControllers:(NSArray *)ControllerS
{
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64,K_MainScreenWidth,K_MainScreenHeight-64-49)];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(K_MainScreenWidth*ControllerS.count, 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.directionalLockEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
    [self addSubviewsToScrollView:_scrollView pushControllers:ControllerS];
    
    
    __weak UIScrollView * scrollview = _scrollView;
    _titleView = [[TitleView alloc]initWithFrame:CGRectMake(0, 0,K_MainScreenWidth , 64)];
    _titleView.backgroundColor=K_NavigationBarColor;
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
