//
//  ErWeiMaViewControllViewController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/23.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "ErWeiMaViewControllViewController.h"


@interface ErWeiMaViewControllViewController ()
{
    UILabel *_contentLabel;
}
@end

@implementation ErWeiMaViewControllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
   OrekiNavigationBar * ob = [OrekiNavigationBar BarType:BarTypeOfBack andWithController:self];
    ob.title.text = @"扫描二维码";
    
    [self.view addSubview:ob];
    
    
    
    self.view.backgroundColor = [UIColor grayColor];
  
    
  
    self.tabBarController.tabBar.hidden = YES;
    UILabel * labIntroudction= [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 290)/2.0, 450, 290, 50)];
    labIntroudction.backgroundColor = [UIColor clearColor];
    labIntroudction.numberOfLines=0;
    labIntroudction.adjustsFontSizeToFitWidth = YES;
    labIntroudction.textColor=[UIColor whiteColor];
    labIntroudction.text=@"将二维码图像置于矩形方框内，离手机摄像头10CM左右,系统会自动识别,获取电影券.";
    [self.view addSubview:labIntroudction];
    
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake((K_MainScreenWidth-250)/2,120, 250, 250)];
    imageView.image = [UIImage imageNamed:@"scan_box"];
    [self.view addSubview:imageView];
    
    upOrdown = NO;
    num =0;
    _line = [[UIImageView alloc] initWithFrame:CGRectMake((K_MainScreenWidth-220)/2, 120, 220, 4)];
    _line.image = [UIImage imageNamed:@"scan_line"];
    [self.view addSubview:_line];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
    
    
    
    
}

+ (ErWeiMaViewControllViewController *)shareErWeiMaViewController
{
    static ErWeiMaViewControllViewController * shareManager = nil;
    static dispatch_once_t predicted;
    dispatch_once(&predicted, ^{
        shareManager = [[self alloc] init];
    });
    return shareManager;
}

-(void)animation1
{
    if (upOrdown == NO) {
        num ++;
        _line.frame = CGRectMake((K_MainScreenWidth-220)/2, 130+2*num, 220, 2);
        if (2*num == 230) {
            upOrdown = YES;
        }
    }
    else {
        num --;
        _line.frame = CGRectMake((K_MainScreenWidth-220)/2, 130+2*num, 220, 2);
        if (num == 0) {
            upOrdown = NO;
        }
    }
    
}


- (void)setupCamera
{
    // Device
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // Session
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input])
    {
        [_session addInput:self.input];
    }
    
    if ([_session canAddOutput:self.output])
    {
        [_session addOutput:self.output];
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    _output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode];
    
    // Preview
    _preview =[AVCaptureVideoPreviewLayer layerWithSession:self.session];
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _preview.frame =CGRectMake((K_MainScreenWidth-280)/2,100,280,280);
    _preview.frame =self.view.frame;
    [self.view.layer insertSublayer:self.preview atIndex:0];
    
    
    
    // Start
    [_session startRunning];
}
#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
    {
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    }
    
    [_session stopRunning];
    [timer invalidate];
    
    [self.delegate saoMiaoBackValue:stringValue];
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupCamera];
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}




@end
