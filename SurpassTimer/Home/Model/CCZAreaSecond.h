//
//  CCZAreaSecond.h
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCZAreaSecond : NSObject

//@property(nonatomic,copy)NSString * goodsId;
//@property(nonatomic,copy)NSString * ID;
//@property(nonatomic,copy)NSString * image;
//@property(nonatomic,copy)NSString * image2;
//@property(nonatomic,copy)NSString * title;
//@property(nonatomic,copy)NSString * titleColor;
//@property(nonatomic,copy)NSString * titleSmall;
//@property(nonatomic,copy)NSDictionary * gotoPage;

@property(nonatomic,strong)NSDictionary * subFirst;
@property(nonatomic,strong)NSDictionary * subSecond;
@property(nonatomic,strong)NSDictionary * subThird;
@property(nonatomic,strong)NSDictionary * subFourth;
@property(nonatomic,strong)NSDictionary * subFifth;


+ (instancetype)cczAreaSecondWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
