//
//  AllMovieTableViewCell.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/26.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "AllMovieTableViewCell.h"
#import "BuyHelp.h"

@implementation AllMovieTableViewCell
{
    UILabel * _titleLabel;
    UILabel * addressLabel;
    UILabel * priceLabel;
    
    
    UIImageView * _3dImageView;
    UIImageView * _ImaxImageView;
    UIImageView * _vipImageView;
    UIImageView * _parkImageView;
    UIImageView * _serverImageView;
    UIImageView * _wifiImageView;
    UIImageView * _eatImageView;
    
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
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, K_MainScreenWidth-10-80, 25)];
    _titleLabel.font  = [UIFont systemFontOfSize:18 weight:0.5];
    [self.contentView addSubview:_titleLabel];
    
    addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, K_MainScreenWidth-50, 20)];
    addressLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:addressLabel];
    
    
    UILabel * leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_titleLabel.frame), 13, 15, 30)];
    leftLabel.font = [UIFont systemFontOfSize:14];
    leftLabel.textColor = [UIColor colorWithRed:0.984 green:0.392 blue:0.000 alpha:1.000];
    leftLabel.text = @"￥";
    [self.contentView addSubview:leftLabel];
    
    UILabel * rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_titleLabel.frame)+40, 13, 20, 30)];
    rightLabel.font = [UIFont systemFontOfSize:13];
    rightLabel.textColor = [UIColor colorWithRed:0.984 green:0.392 blue:0.000 alpha:1.000];
    rightLabel.text = @"起";
    [self.contentView addSubview:rightLabel];
    
    
    
    priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_titleLabel.frame)+15, 10, 40, 30)];
    priceLabel.font = [UIFont systemFontOfSize:22];
    priceLabel.textColor = [UIColor colorWithRed:0.984 green:0.392 blue:0.000 alpha:1.000];
    [self.contentView addSubview:priceLabel];
    
    _3dImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_3dImageView];
    _ImaxImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_ImaxImageView];
    _vipImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_vipImageView];
    _parkImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_parkImageView];
    _serverImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_serverImageView];
    _wifiImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_wifiImageView];
    _eatImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_eatImageView];
    
    
    

    
}


-(void)prepareUI:(NSDictionary *)dic
{
    
    _titleLabel.text = dic[@"cinameName"];
    
    addressLabel.text = dic[@"address"];
    
    priceLabel.text = [BuyHelp priceString:dic[@"minPrice"]];
    
    [self movieLeiXing:dic];
}



-(void)movieLeiXing:(NSDictionary *)dic
{
    
    
    NSDictionary * dicc = dic[@"feature"];
    
    
    if ([[NSString stringWithFormat:@"%@",dicc[@"hasVIP"]]isEqualToString:[NSString stringWithFormat:@"1"]]) {
        _vipImageView.frame = CGRectMake(10,CGRectGetMaxY(addressLabel.frame)+10, 20, 20);
        _vipImageView.image = [UIImage imageNamed:@"v10_small_VIP"];
    }
    else
    {
        _vipImageView.frame = CGRectMake(5,CGRectGetMaxY(addressLabel.frame)+10, 0, 0);
    }
    
    if ([[NSString stringWithFormat:@"%@",dicc[@"has3D"]]isEqualToString:[NSString stringWithFormat:@"1"]]) {
        _3dImageView.frame = CGRectMake(CGRectGetMaxX(_vipImageView.frame)+5, CGRectGetMaxY(addressLabel.frame)+10, 20, 20);
        _3dImageView.image = [UIImage imageNamed:@"v10_small_Feature3D"];
    }
    else
    {
        _3dImageView.frame = CGRectMake(CGRectGetMaxX(_vipImageView.frame), CGRectGetMaxY(addressLabel.frame)+10, 0, 0);
    }
    
    if ([[NSString stringWithFormat:@"%@",dicc[@"hasIMAX"]]isEqualToString:[NSString stringWithFormat:@"1"]]) {
        _ImaxImageView.frame = CGRectMake(CGRectGetMaxX(_3dImageView.frame)+5, CGRectGetMaxY(addressLabel.frame)+10, 20, 20);
        _ImaxImageView.image = [UIImage imageNamed:@"v10_small_FeatureIMAX"];
    }
    else
    {
        _ImaxImageView.frame = CGRectMake(CGRectGetMaxX(_3dImageView.frame), CGRectGetMaxY(addressLabel.frame)+10, 0, 0);
    }
    
    if ([[NSString stringWithFormat:@"%@",dicc[@"hasPark"]]isEqualToString:[NSString stringWithFormat:@"1"]]) {
        _parkImageView.frame = CGRectMake(CGRectGetMaxX(_ImaxImageView.frame)+5, CGRectGetMaxY(addressLabel.frame)+10, 20, 20);
        _parkImageView.image = [UIImage imageNamed:@"v10_small_park"];
    }
    else
    {
        _parkImageView.frame = CGRectMake(CGRectGetMaxX(_ImaxImageView.frame), CGRectGetMaxY(addressLabel.frame)+10, 0, 0);
    }
    
    if ([[NSString stringWithFormat:@"%@",dicc[@"hasServiceTicket"]]isEqualToString:[NSString stringWithFormat:@"1"]]) {
        _serverImageView.frame = CGRectMake(CGRectGetMaxX(_parkImageView.frame)+5, CGRectGetMaxY(addressLabel.frame)+10, 20, 20);
        _serverImageView.image = [UIImage imageNamed:@"v10_small_serviceTicket"];
    }
    else
    {
        _serverImageView.frame = CGRectMake(CGRectGetMaxX(_parkImageView.frame), CGRectGetMaxY(addressLabel.frame)+10, 0, 0);
    }
    
    
    if ([[NSString stringWithFormat:@"%@",dicc[@"hasWifi"]]isEqualToString:[NSString stringWithFormat:@"1"]]) {
        _wifiImageView.frame = CGRectMake(CGRectGetMaxX(_serverImageView.frame)+5, CGRectGetMaxY(addressLabel.frame)+10, 20, 20);
        _wifiImageView.image = [UIImage imageNamed:@"v10_small_wifi"];
    }
    else
    {
        _wifiImageView.frame = CGRectMake(CGRectGetMaxX(_serverImageView.frame), CGRectGetMaxY(addressLabel.frame)+10, 0, 0);
    }
    
    
    if ([[NSString stringWithFormat:@"%@",dicc[@"hasLoveseat"]]isEqualToString:[NSString stringWithFormat:@"1"]]) {
        _eatImageView.frame = CGRectMake(CGRectGetMaxX(_wifiImageView.frame)+5, CGRectGetMaxY(addressLabel.frame)+10, 20, 20);
        _eatImageView.image = [UIImage imageNamed:@"v10_small_facility"];
    }
    else
    {
        _eatImageView.frame = CGRectMake(CGRectGetMaxX(_wifiImageView.frame), CGRectGetMaxY(addressLabel.frame)+10, 0, 0);
    }
    
    
    
    
    
    
    
    
    
}




@end
