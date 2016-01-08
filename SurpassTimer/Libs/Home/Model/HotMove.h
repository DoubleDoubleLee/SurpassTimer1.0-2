//
//  HotMove.h
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotMove : NSObject

@property(nonatomic,copy)NSString * newsId;
@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * topCover;
@property(nonatomic,copy)NSDictionary * movie;


+ (instancetype)hotMoveWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;


@end
