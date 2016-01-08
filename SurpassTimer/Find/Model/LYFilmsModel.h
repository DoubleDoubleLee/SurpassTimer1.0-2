//
//  LYFilmsModel.h
//  SurpassTimer
//
//  Created by qianfeng on 15/11/27.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYFilmsModel : NSObject
@property(nonatomic,copy)NSString *nickname;//用户名
@property(nonatomic,copy)NSString *userImage;//用户头像
@property(nonatomic,copy)NSString *title; //标题
@property(nonatomic,copy)NSString *summary;//简述
@property(nonatomic,copy)NSString *LYid;
@property(nonatomic,copy)NSString *image;//图片
@property(nonatomic,copy)NSString *rating;//评分
@property(nonatomic,retain)NSDictionary *relatedObj;
@end
