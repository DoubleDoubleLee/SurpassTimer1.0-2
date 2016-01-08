//
//  LJCSHDownload.m
//  firstApp
//
//  Created by qianfeng on 15/10/14.
//  Copyright (c) 2015年 L-J-C. All rights reserved.
//

#import "LJCSHDownload.h"
#import "AFNetworking.h"
@implementation LJCSHDownload
+(void)downloadDataWithType:(LJCDownloadType)type Path:(NSString *)path parameters:(NSDictionary *)parameters sucess:(void (^)(NSData *))sucess fail:(void (^)(NSError *))fail
{
    AFHTTPRequestOperationManager * manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    if (type==LJCDownloadTypeGet)
    {
        [manager GET:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            sucess(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            fail(error);
        }];
    }
    else if (type==LJCDownloadTypePost)
    {
        [manager POST:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            sucess(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            fail(error);
        }];
    }
}

+(void)uploadDataWithPath:(NSString *)path parameters:(NSDictionary *)parameters fileUrl:(NSURL *)fileUrl keyName:(NSString *)keyName fileName:(NSString *)fileName fileType:(NSString *)fileType sucess:(void (^)(NSData *))sucess fail:(void (^)(NSError *))fail
{
    AFHTTPRequestOperationManager * manger=[AFHTTPRequestOperationManager manager];
    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manger POST:path parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:fileUrl name:keyName fileName:fileName mimeType:fileType error:nil];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"sucess");
        sucess(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
        fail(error);
        
    }];
}


@end
