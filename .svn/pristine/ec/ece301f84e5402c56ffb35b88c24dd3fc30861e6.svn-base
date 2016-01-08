//
//  CCZPokerView.m
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/24.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "CCZPokerView.h"
#import "UIImage+ImageEffects.h"
#import "CCZRoundView.h"
#import "CustomToolsButton.h"
#import "CCZDownLoadUrl.h"
#import "CCZHeaderFilmModel.h"
#import "UIImageView+WebCache.h"

@implementation CCZPokerView
{
    UIImageView * _backgroundImageView;
    CCZRoundView * _roundView;
    NSMutableArray * _dataSource;
    NSMutableArray * _imageSource;
    UIButton * _gradeButton;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageSource = [[NSMutableArray alloc] init];
        _dataSource = [[NSMutableArray alloc] init];
        
        [self addPokerView];
        [self loadView];
        [self prepareDataSource];
    }
    return self;
}
#pragma mark - 添加视图

- (void)addPokerView
{
    CGFloat rectW = self.bounds.size.width/2;
    CGFloat rectX = self.frame.size.width - rectW-80;
    CGFloat rectY = 64;
    CGFloat rectH = 220;
    CGRect rect = CGRectMake(rectX, rectY, rectW, rectH);
    slideImageView = [[SlideImageView alloc]initWithFrame:rect ZMarginValue:5 XMarginValue:10 AngleValue:0.3 Alpha:1000];
    slideImageView.borderColor = [UIColor lightGrayColor];
    slideImageView.delegate = self;
    
}
- (void)loadView
{
    // 添加背景
    _backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _backgroundImageView.backgroundColor = [UIColor blackColor];
    [self addSubview:_backgroundImageView];
    // 添加poker翻页驶视图
    [self addSubview:slideImageView];
    
    // 影片名字
    indexLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, slideImageView.bounds.size.height + 84, K_MainScreenWidth, 40)];
    indexLabel.font = [UIFont boldSystemFontOfSize:16];
    indexLabel.textColor = [UIColor whiteColor];
    indexLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:indexLabel];
    // 影片评分Label
    _gradeButton = [[UIButton alloc] init];
    _gradeButton.backgroundColor = [UIColor colorWithRed:0.40f green:0.61f blue:0.06f alpha:1.00f];;
    [indexLabel addSubview:_gradeButton];
    // 添加弧线图
    CGFloat viewX = 0;
    CGFloat viewY = indexLabel.frame.origin.y + indexLabel.frame.size.height +20;
    CGFloat viewW = K_MainScreenWidth;
    CGFloat viewH = 80;
    
    CCZRoundView * roundView = [[CCZRoundView alloc] initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
    _roundView = roundView;
    [self addSubview:roundView];
    
    // 添加自定义按钮
    [self addCustomButton];

    
}

// 添加自定义按钮
- (void)addCustomButton
{
    CGFloat frameX = 0;
    CGFloat frameY = _roundView.frame.origin.y + _roundView.frame.size.height-1;
    CGFloat frameW = K_MainScreenWidth;
    CGFloat frameH = 55;
    CGRect frame = CGRectMake(frameX, frameY, frameW, frameH);
//    NSArray * titleArray = @[@"正在热映",@"正在上映",@"找影院"];
//    NSArray * numArray = @[@"124",@"53",@"533"];
//    CustomToolsButton * toolsButton = [CustomToolsButton CustomButtonType:NumButton andWithFrame:frame andWithButtonTitleArray:titleArray andWithButtonNumArray:numArray ButtonClick:^(int buttonNum) {
//        if (buttonNum == 0) {
//            NSLog(@"正在热映");
//        }
//        else if (buttonNum == 1)
//        {
//            NSLog(@"正在上映");
//        }
//        else if (buttonNum == 2)
//        {
//            NSLog(@"找影院");
//        }
//    }];
//    
//    [self addSubview:toolsButton];
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    view.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:view];
    
    
}
#pragma mark - 代理方法
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)SlideImageViewDidClickWithIndex:(int)index
{
    NSString* indexStr = [[NSString alloc]initWithFormat:@"点击了第%d张",index];
    NSLog(@"%@",indexStr);
    clickLabel.text = indexStr;
}

- (void)SlideImageViewDidEndScorllWithIndex:(int)index
{
    CCZHeaderFilmModel * model = _dataSource[index];
    indexLabel.text = model.titleCn;
    _backgroundImageView.image = ((UIImage *)_imageSource[index]).applyLightEffect;
    CGRect strSize = [model.titleCn boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil];
    
    // button位置
    CGFloat buttonX = indexLabel.frame.size.width/2 + strSize.size.width/2+20;
    _gradeButton.frame = CGRectMake(buttonX, 0, 35, 35);
    NSString * strNum = [NSString stringWithFormat:@"%.1f",[model.ratingFinal floatValue]];
    [_gradeButton setTitle:strNum forState:UIControlStateNormal];
    
    // text
    _roundView.lable.text = [NSString stringWithFormat:@"“%@",model.commonSpecial];
}

#pragma mark - 获取数据
- (void)prepareDataSource
{
    // 下载数据
    NSString * pokerUrl = [CCZDownLoadUrl getHeaderPokerViewURl];
    [HTTPTool GETWithURL:pokerUrl params:nil succeed:^(id obj) {
        
        id Json = [NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingMutableContainers error:nil];
        [Json[@"movies"] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDictionary * dic = obj;
            CCZHeaderFilmModel * model = [[CCZHeaderFilmModel alloc] initWithDict:dic];
            [_dataSource addObject:model];
        }];
        [self addImageForDataSource];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)addImageForDataSource
{
    // 缓存图片
    for(int i= 0 ; i<_dataSource.count; i++)
    {
        CCZHeaderFilmModel * model = _dataSource[i];
        NSURL * url = [NSURL URLWithString:model.img];
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"actor_default_image_170×254@3x"] options:0 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            [slideImageView addImage:imageView.image];
            [_imageSource addObject:imageView.image];
            [slideImageView reLoadUIview];
            if (_imageSource.count == 1) {
                _backgroundImageView.image = ((UIImage *)_imageSource[0]).applyLightEffect;
                [self SlideImageViewDidEndScorllWithIndex:0];
            }

        }];
        
    }
    [slideImageView setImageShadowsWtihDirectionX:5 Y:5 Alpha:0.7];
}
@end
