//
//  ReYIngAHeaderView.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/28.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#define URL @"http://api.m.mtime.cn/Showtime/MovieDetail.api?locationId=290&movieId=%@"

#import "ShangYingAHeaderView.h"
#import "BuyMaoBoLiImageView.h"


@implementation ShangYingAHeaderView

-(instancetype)initWithFrame:(CGRect)frame withBGDIC:(NSDictionary *)DIC
{
    self =[super initWithFrame:frame];
    if (self) {
        
        
        
        
        self.layer.masksToBounds = YES;
        [self createHeaderView:DIC];
        
    }
    return self;
    
}



-(void)createHeaderView:(NSDictionary * )DIC
{
    
    
    
    BuyMaoBoLiImageView * bgImage = [[BuyMaoBoLiImageView alloc] initWithFrame:CGRectMake(0, -50, K_MainScreenWidth, K_MainScreenHeight) withImageUrl:DIC[@"image"]];
    [self addSubview:bgImage];
    
    
    
    UIView * artic = [[UIView alloc] initWithFrame:CGRectMake(-K_MainScreenWidth*3, 150, K_MainScreenWidth*7, K_MainScreenWidth*2)];
    artic.layer.cornerRadius = K_MainScreenWidth*3.5;
    artic.layer.masksToBounds = YES;
    artic.backgroundColor = [UIColor whiteColor];
    [self addSubview:artic];
    
    
    
    UIImageView * moviePhoto = [[UIImageView alloc] initWithFrame:CGRectMake(20, 74, 100, 150)];
    [moviePhoto sd_setImageWithURL:[NSURL URLWithString:DIC[@"image"]]];
    [self addSubview:moviePhoto];
    
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 74, K_MainScreenWidth-140, 20)];
    titleLabel.text = DIC[@"title"];
    titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:titleLabel];
    
    UILabel * engTitLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 100, K_MainScreenWidth-140, 20)];
    engTitLabel.textColor = [UIColor whiteColor];
    engTitLabel.text = DIC[@"locationName"];
    [self addSubview:engTitLabel];
    
    
    UILabel * gradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(K_MainScreenWidth - 70, 130,60, 40)];
    gradeLabel.adjustsFontSizeToFitWidth = YES;
    gradeLabel.backgroundColor = [UIColor colorWithRed:0.123 green:0.627 blue:0.377 alpha:1.000];
    
    
    
    NSArray * arr = DIC[@"videos"];
    
    if (arr.count>0) {
        NSDictionary * diccc = arr[0];
        
        gradeLabel.text = [NSString stringWithFormat:@"%@分钟",diccc[@"length"]];
        gradeLabel.textColor = [UIColor whiteColor];
        gradeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:gradeLabel];
    }
    
    
    
    UILabel * minutesLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 160, 80, 15)];
    minutesLabel.text= [NSString stringWithFormat:@"%@",DIC[@"rYear"]];
    minutesLabel.textColor = [UIColor colorWithWhite:0.398 alpha:1.000];
    minutesLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:minutesLabel];
    
    UILabel * leiXing = [[UILabel alloc] initWithFrame:CGRectMake(140, 180, 180, 15)];
    leiXing.text = DIC[@"type"];
    leiXing.textColor = minutesLabel.textColor;
    leiXing.font = minutesLabel.font;
    [self addSubview:leiXing];
    
    
    UILabel * dateSHangYing = [[UILabel alloc] initWithFrame:CGRectMake(140, 200, 180, 15)];
    dateSHangYing.text = DIC[@"releaseDate"];
    dateSHangYing.textColor = minutesLabel.textColor;
    dateSHangYing.font = minutesLabel.font;
    [self addSubview:dateSHangYing];
    
    
    
    
}













@end
