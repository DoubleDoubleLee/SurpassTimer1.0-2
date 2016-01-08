//
//  ErWeiMaViewControllViewController.h
//  SurpassTimer
//
//  Created by qianfeng on 15/11/23.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "RootViewController.h"
#import <AVFoundation/AVFoundation.h>

@protocol saoMiaoDelegate <NSObject>



/**
 *  delegate 二维码返回值
 *
 *  @param string 该方法返回扫描二维码得到字符串
 *
 */



-(void)saoMiaoBackValue:(NSString *)string;







@end


























@interface ErWeiMaViewControllViewController : RootViewController<AVCaptureMetadataOutputObjectsDelegate>
{
    int num;
    BOOL upOrdown;
    NSTimer * timer;
}
@property (nonatomic,retain)id<saoMiaoDelegate>delegate;
@property (strong,nonatomic)AVCaptureDevice * device;
@property (strong,nonatomic)AVCaptureDeviceInput * input;
@property (strong,nonatomic)AVCaptureMetadataOutput * output;
@property (strong,nonatomic)AVCaptureSession * session;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * bgView;
@property (nonatomic, retain) UIImageView * line;


+ (ErWeiMaViewControllViewController *)shareErWeiMaViewController;

@end
