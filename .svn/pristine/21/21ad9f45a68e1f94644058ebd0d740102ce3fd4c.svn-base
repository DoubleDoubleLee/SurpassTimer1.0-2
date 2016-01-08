//
//  ShangYingTableViewCell.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/26.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "ShangYingTableViewCell.h"




@implementation ShangYingTableViewCell

{
    UILabel * _dayLabel;
    UIImageView * _movieImageView;
    UILabel * _titleLabel;
    UILabel * _wantLabel;
    UILabel * _leiXIngLabel;
    UILabel * _daoYanLabel;
    UIButton * _leftButton;
    UIButton * _rightButton;
    UILabel * buttonLabel;
    
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createUI];
        
    }
    return self;
}



-(void)createUI
{
    _dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 40, 20)];
    _dayLabel.textAlignment = NSTextAlignmentLeft;
    _dayLabel.adjustsFontSizeToFitWidth = YES;
    _dayLabel.textColor = [UIColor colorWithWhite:0.533 alpha:1.000];
    [self.contentView addSubview:_dayLabel];
    
    
    _movieImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 10, 80, 120)];
    [self.contentView addSubview:_movieImageView];
    
    
    CGFloat padding = CGRectGetMaxX(_movieImageView.frame)+10;
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding, 10, K_MainScreenWidth-padding, 25)];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:18 weight:16];
    [self.contentView addSubview:_titleLabel];
    
    _wantLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding, 45, 40, 20)];
    _wantLabel.textColor = [UIColor colorWithRed:0.988 green:0.420 blue:0.000 alpha:1.000];
    _wantLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_wantLabel];
    
    _leiXIngLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding+40, 45, K_MainScreenWidth-padding-40, 20)];
    _leiXIngLabel.font = [UIFont systemFontOfSize:15];
    _leiXIngLabel.textColor = [UIColor colorWithWhite:0.388 alpha:1.000];
    [self.contentView addSubview:_leiXIngLabel];
    
    
    _daoYanLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding, 75, K_MainScreenWidth-padding, 20)];
    _daoYanLabel.textColor = _leiXIngLabel.textColor;
    _daoYanLabel.font = _leiXIngLabel.font;
    [self.contentView addSubview:_daoYanLabel];
    
    _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(padding, 105, 80, 28)];
    [self.contentView addSubview:_leftButton];
    
    
    buttonLabel = [[UILabel alloc] initWithFrame:_leftButton.bounds];
   
    buttonLabel.textAlignment = NSTextAlignmentCenter;
    buttonLabel.font = [UIFont systemFontOfSize:12];
    [_leftButton addSubview:buttonLabel];
    
    
}







-(void)prepareUI:(NSDictionary *)dic
{
    
    
    
    _dayLabel.text = [NSString stringWithFormat:@"%@日",dic[@"rDay"]];
    
    [_movieImageView sd_setImageWithURL:[NSURL URLWithString:dic[@"image"]] placeholderImage:nil];
    
    _titleLabel.text = dic[@"title"];
    
    _wantLabel.text = [NSString stringWithFormat:@"%@",dic[@"wantedCount"]];
    
    _leiXIngLabel.text = [NSString stringWithFormat:@"人想看-%@",dic[@"type"]];
    
    _daoYanLabel.text = [NSString stringWithFormat:@"导演:  %@",dic[@"director"]];
    
    [self isTikets:dic];
    
    
    
}


-(void)isTikets:(NSDictionary *)dic
{
    
    if ([[NSString stringWithFormat:@"%@",dic[@"isTicket"]] isEqualToString:[NSString stringWithFormat:@"0"]]) {
        [_leftButton setImage:[UIImage imageNamed:@"icon_movie_trailer"] forState:UIControlStateNormal];
        
        buttonLabel.text = @"上映提醒";
        buttonLabel.textColor = [UIColor colorWithRed:0.329 green:0.537 blue:0.086 alpha:1.000];
       
        

    }
    else{
        [_leftButton setImage:[UIImage imageNamed:@"icon_hot_show_see"] forState:UIControlStateNormal];
        
        
        
        buttonLabel.text = @"已上映";
        buttonLabel.textColor = [UIColor whiteColor];
        
        
    }
    
}

























@end
