//
//  LJCSHDownload.h
//  firstApp
//
//  Created by qianfeng on 15/10/14.
//  Copyright (c) 2015年 L-J-C. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,LJCDownloadType) {
    LJCDownloadTypeGet,
    LJCDownloadTypePost
};
@interface LJCSHDownload : NSObject
//下载数据
+(void)downloadDataWithType:(LJCDownloadType)type Path:(NSString *)path parameters:(NSDictionary *)parameters sucess:(void(^)(NSData*data))sucess fail:(void(^)(NSError *error))fail;
+(void)uploadDataWithPath:(NSString *)path parameters:(NSDictionary *)parameters fileUrl:(NSURL *)fileUrl keyName:(NSString *)keyName fileName:(NSString *)fileName fileType:(NSString *)fileType sucess:(void (^)(NSData *data))sucess fail:(void (^)(NSError *error))fail;
@end
