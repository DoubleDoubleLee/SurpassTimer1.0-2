//
//  BuyScrollView.h
//  SurpassTimer
//
//  Created by qianfeng on 15/11/24.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuyScrollView : UIView


/**
 *  创建可滑动Controllers
 *
 *  @param titleNames       标题名
 *  @param pushControllers   将要推出的控制器
 */

-(instancetype)initWithFrame:(CGRect)frame title:(NSArray *)titleNames pushControllers:(NSArray *)ControllerS;

@end
