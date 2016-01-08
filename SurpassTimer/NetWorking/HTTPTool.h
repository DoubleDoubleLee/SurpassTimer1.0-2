//
//  HTTPTool.h
//  Exercise
//
//  Created by 陈曹振 on 15/11/20.
//  Copyright © 2015年 ccz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPTool : NSObject

/**
 *  发送一个POST请求
 *
 *  @param URL     请求路径
 *  @param params  请求参数
 *  @param succeed 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)POSTWithURL:(NSString *)URL params:(NSDictionary *)params succeed:(void (^)(id obj))succeed failure:(void (^)(NSError * error))failure;

/**
 *  发送一个POST请求(上传文件数据)
 *
 *  @param URL     请求路径
 *  @param params  请求参数
 *  @param formDataArray 文件参数
 *  @param succeed 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)POSTWithURL:(NSString *)URL params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray succeed:(void (^)(id obj))succeed failure:(void (^)(NSError * error))failure;
/**
 *  发送一个GET请求
 *
 *  @param URL     请求路径
 *  @param params  请求参数
 *  @param succeed 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)GETWithURL:(NSString *)URL params:(NSDictionary *)params succeed:(void (^)(id obj))succeed failure:(void (^)(NSError * error))failure;

@end



/**
 *  用来封装文件数据的模型
 */
@interface FormDataModel : NSObject
/** 文件数据 */
@property(nonatomic,strong)NSData * data;
/** 参数名 */
@property(nonatomic,copy)NSString * name;
/** 文件名 */
@property(nonatomic,copy)NSString * fileName;
/** 文件类型 */
@property(nonatomic,copy)NSString * mimeType;
@end


