//
//  CCZHotPreson.h
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCZHotPreson : NSObject


@property(nonatomic,copy)NSString * commentCount;
@property(nonatomic,copy)NSString * desc;
@property(nonatomic,copy)NSString * ID;
@property(nonatomic,copy)NSString * img;
@property(nonatomic,copy)NSString * img2;
@property(nonatomic,copy)NSString * img3;
@property(nonatomic,copy)NSString * publishTime;
@property(nonatomic,copy)NSString * tag;
@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * type;


+ (instancetype)cczHotPresonWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
