//
//  HTTPTool.m
//  Exercise
//
//  Created by 陈曹振 on 15/11/20.
//  Copyright © 2015年 ccz. All rights reserved.
//

#import "HTTPTool.h"
#import "AFNetworking.h"

@implementation HTTPTool

// post下载
+ (void)POSTWithURL:(NSString *)URL params:(NSDictionary *)params succeed:(void (^)(id))succeed failure:(void (^)(NSError *))failure
{
    // 1.创建管理对象
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 2.发送请求
    [manager POST:URL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if (succeed) {
            succeed(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
// post上传
+(void)POSTWithURL:(NSString *)URL params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray succeed:(void (^)(id))succeed failure:(void (^)(NSError *))failure
{
    // 1.创建管理对象
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 2.发送请求
    [manager POST:URL parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (FormDataModel * model in formDataArray) {
            [formData appendPartWithFileData:model.data name:model.name fileName:model.fileName mimeType:model.mimeType];
        }
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if (succeed) {
            succeed(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
// get下载
+ (void)GETWithURL:(NSString *)URL params:(NSDictionary *)params succeed:(void (^)(id))succeed failure:(void (^)(NSError *))failure
{
    // 1.创建管理对象
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 2.发送请求
    [manager GET:URL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if (succeed) {
            succeed(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}



@end

/**
 *  用来封装文件数据的模型
 */
@implementation FormDataModel

@end

