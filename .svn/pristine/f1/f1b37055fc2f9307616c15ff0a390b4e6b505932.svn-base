//
//  MyNavigationBar.h
//  IFood
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 Oreki. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OrekiButton;

typedef NS_OPTIONS(NSUInteger, OrekiNavigationBarType)
{
    BarTypeOfHome,
    //带有定位，二维码，搜索按钮
    BarTypeOfSearch,
    //搜索栏，取消（返回）按钮
    BarTypeOfBuy,
    //有分页选择器，定位，搜索按钮（搜索栏）用于购票页
    BarTypeOfShop,
    //有二维码，购物车按钮，搜索栏
    BarTypeOfBack,
    //有返回按钮，标题（需设置）
    BarTypeOfDefault,
    //有返回按钮 标题 右自定义按钮
    BarTypeOfCollect,
    //收藏和分享，返回按钮
    BarTypeOfNone
    //没有
    
};

@interface OrekiNavigationBar : UIView
/**
 *  当你用到定位界面时需要设置该button的labeltext，默认值为设置的默认城市名
 */
@property (nonatomic,strong) OrekiButton * locationButton;

/**
 *  分页选择器
 */
@property (nonatomic,strong) UISegmentedControl * segmented;

/**
 *  右侧自定义按钮（默认大小40*40，按需重写），需设置图片或文字
 */
@property (nonatomic,strong) UIButton * rightButton;

/**
 *  购票界面 影院分页
 */
@property (nonatomic,strong) UIView * cinema;

/**
 *  搜索栏(默认)
 */
@property (nonatomic,strong) UISearchBar * searchBar;
/**
 *  购票界面 电影分页
 */
@property (nonatomic,strong) UIView * movie;

/**
 *  返回界面（主要） 标题
 */
@property (nonatomic,strong) UILabel * title;
/**
 *  获取导航条
 *
 *  @param type       所需导航条类型
 *  @param controller 需要加载该Bar的视图控制器，一般情况下写self
 *
 */
+ (instancetype)BarType:(OrekiNavigationBarType)type andWithController:(RootViewController *)controller;

/**
 *  如果有本类以外的事件造成segmented发生变化，则需要调用该方法，需将segmented发生变化后所处的界面标题（电影或影院）作为NSString类型参数传入
 *
 *  @param sender 必须使用NSString类型
 */

- (void)segmentChangedValue:(id)sender;

@property(nonatomic,copy)void (^block)();

@end
