//
//  ReYingTableViewCell.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "ReYingTableViewCell.h"
#import "UIImageView+WebCache.h"



@interface ReYingTableViewCell ()
{
    UIImageView * _moveIMageView;
    UILabel * _titleLabel;
    UILabel * _gradeLabel;
    UILabel * _detailLabel;
    UILabel * _shangYingLabel;
    UILabel * _changCiLabel;
    UIButton * _buyTiketsButton;
    UIImageView * _imax3DImageView;
    UIImageView * _imaxImageView;
    UIImageView * _chinaImageView;
    UIImageView * _3DImageView;
    UIImageView * _moveStarImageVIew;
    
}
@end

@implementation ReYingTableViewCell

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
    
    
    _moveIMageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 80, 115)];
    _moveIMageView.userInteractionEnabled = YES;
    [self.contentView addSubview:_moveIMageView];
    
    _moveStarImageVIew = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 40, 40)];
    [self.contentView addSubview:_moveStarImageVIew];
    
    
    CGFloat padding = CGRectGetMaxX(_moveIMageView.frame)+10;
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:16 weight:16];
    [self.contentView addSubview:_titleLabel];
    
    
    _gradeLabel = [[UILabel alloc] init];
    _gradeLabel.textAlignment = NSTextAlignmentLeft;
    _gradeLabel.adjustsFontSizeToFitWidth = YES;
    _gradeLabel.font = [UIFont systemFontOfSize:25];
    _gradeLabel.textColor = [UIColor colorWithRed:0.263 green:0.525 blue:0.071 alpha:1.000];
    [self.contentView addSubview:_gradeLabel];
    
    _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding, 30, K_MainScreenWidth-padding, 15)];
    
    _detailLabel.font = [UIFont systemFontOfSize:14];
    _detailLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_detailLabel];
    
    
    _shangYingLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding, 50, K_MainScreenWidth-padding, 15)];
    _shangYingLabel.adjustsFontSizeToFitWidth = YES;
    _shangYingLabel.font = [UIFont systemFontOfSize:13];
    _shangYingLabel.textColor = [UIColor colorWithWhite:0.537 alpha:1.000];
    _shangYingLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_shangYingLabel];
    
    
    _changCiLabel = [[UILabel alloc] initWithFrame:CGRectMake(padding, 70, K_MainScreenWidth-padding, 20)];
    _changCiLabel.adjustsFontSizeToFitWidth = YES;
    _changCiLabel.font = [UIFont systemFontOfSize:13];
    _changCiLabel.textColor = [UIColor colorWithWhite:0.537 alpha:1.000];
    _changCiLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_changCiLabel];
    
    
    _3DImageView = [[UIImageView alloc] init];
    _3DImageView.image = [UIImage imageNamed:@"icon_hot_show_3D"];
    [self.contentView addSubview:_3DImageView];
    
    _imax3DImageView = [[UIImageView alloc] init];
    _imax3DImageView.image = [UIImage imageNamed:@"icon_hot_show_IMAX3D"];
    [self.contentView addSubview:_imax3DImageView];
    
    _chinaImageView = [[UIImageView alloc] init];
    _chinaImageView.image = [UIImage imageNamed:@"icon_hot_show_DMAX"];
    [self.contentView addSubview:_chinaImageView];
    
    _imaxImageView = [[UIImageView alloc] init];
    _imaxImageView.image = [UIImage imageNamed:@"icon_hot_show_IMAX"];
    [self.contentView addSubview:_imaxImageView];
    
    
    
    
    
}







-(void)prepareUI:(NSDictionary *)dic
{
    
    
    
//    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:25]};
//    CGSize size = [dic[@"tCn"] boundingRectWithSize:CGSizeMake(CGRectGetMaxX(_moveIMageView.frame)+10, 5) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.frame = CGRectMake(CGRectGetMaxX(_moveIMageView.frame)+10, 5, K_MainScreenWidth-CGRectGetMaxX(_moveIMageView.frame)-20, 25) ;
    
    _titleLabel.text = dic[@"tCn"];
    
    
    _gradeLabel.frame = CGRectMake(K_MainScreenWidth-80, 60, 80, 30);
    
    
    NSNumber * number = dic[@"r"];
    
    _gradeLabel.text = [NSString stringWithFormat:@"%.1f",[number floatValue]];
    
    
    
    
    [_moveIMageView sd_setImageWithURL:[NSURL URLWithString:dic[@"img"]] placeholderImage:nil];
    [self createDetailLabel:dic];
   
    _shangYingLabel.text = [self dateChange:dic[@"rd"]];
    _changCiLabel.text = [NSString stringWithFormat:@"今日%@家影院%@场",dic[@"NearestCinemaCount"],dic[@"NearestShowtimeCount"]];
    
    
    
    [self movieLeiXing:dic];
    
    [self isToday:dic];
}


-(void)isToday:(NSDictionary*)dic
{
    
    
    NSString * today = [NSString stringWithFormat:@"%@",dic[@"rd"]];
    
    NSDateFormatter * _dateFormatter = [[NSDateFormatter alloc]init];
    NSString * str = [[NSString alloc]initWithFormat:@"yyyyMMdd"];
    [_dateFormatter setDateFormat:str];
    NSDate * date = [NSDate date];
    NSString * dateString = [_dateFormatter stringFromDate:date];
    
    
    
    
    
    if ([dateString isEqualToString:today]) {
        _moveStarImageVIew.image = [UIImage imageNamed:@"icon_homepage_new_movie"];
    }
    else{
        _moveStarImageVIew.image = [UIImage imageNamed:@""];
    }
    
}



-(void)movieLeiXing:(NSDictionary *)dic
{
    
    if ([[NSString stringWithFormat:@"%@",dic[@"is3D"]]isEqualToString:[NSString stringWithFormat:@"1"]]) {
        _3DImageView.frame = CGRectMake(CGRectGetMaxX(_moveIMageView.frame)+10,CGRectGetMaxY(_changCiLabel.frame)+10, 30, 20);
    }
    else
    {
        _3DImageView.frame = CGRectMake(CGRectGetMaxX(_moveIMageView.frame)+5,CGRectGetMaxY(_changCiLabel.frame)+10, 0, 0);
    }
    
    if ([[NSString stringWithFormat:@"%@",dic[@"isDMAX"]]isEqualToString:[NSString stringWithFormat:@"1"]]) {
        _chinaImageView.frame = CGRectMake(CGRectGetMaxX(_3DImageView.frame)+5, CGRectGetMaxY(_changCiLabel.frame)+10, 50, 20);
    }
    else
    {
        _chinaImageView.frame = CGRectMake(CGRectGetMaxX(_3DImageView.frame), CGRectGetMaxY(_changCiLabel.frame)+10, 0, 0);
    }
    
    if ([[NSString stringWithFormat:@"%@",dic[@"isIMAX"]]isEqualToString:[NSString stringWithFormat:@"1"]]) {
        _imaxImageView.frame = CGRectMake(CGRectGetMaxX(_chinaImageView.frame)+5, CGRectGetMaxY(_changCiLabel.frame)+10, 50, 20);
    }
    else
    {
        _imaxImageView.frame = CGRectMake(CGRectGetMaxX(_chinaImageView.frame), CGRectGetMaxY(_changCiLabel.frame)+10, 0, 0);
    }
    
    if ([[NSString stringWithFormat:@"%@",dic[@"isIMAX3D"]]isEqualToString:[NSString stringWithFormat:@"1"]]) {
        _imax3DImageView.frame = CGRectMake(CGRectGetMaxX(_imaxImageView.frame)+5, CGRectGetMaxY(_changCiLabel.frame)+10, 60, 20);
    }
   else
   {
       _imax3DImageView.frame = CGRectMake(CGRectGetMaxX(_imaxImageView.frame), CGRectGetMaxY(_changCiLabel.frame)+10, 0, 0);
   }
    
   
}





-(NSString *)dateChange:(NSString * )string
{
    NSRange range = NSMakeRange(4, 2);
    NSString * str = [string substringWithRange:range];
    
    NSRange range2 = NSMakeRange(6, 2);
    NSString * str2 = [string substringWithRange:range2];
    NSString * backString = [NSString stringWithFormat:@"%@月%@日上映",str,str2];
    
    return backString;
    
}

-(void)createDetailLabel:(NSDictionary *)dic
{
    NSString * string = dic[@"commonSpecial"];
    if (string.length > 2) {
       _detailLabel.text = [NSString stringWithFormat:@"“%@",dic[@"commonSpecial"]];
    _detailLabel.textColor = [UIColor colorWithRed:0.988 green:0.443 blue:0.039 alpha:1.000];
    }
    else{
        
        _detailLabel.text = [NSString stringWithFormat:@"%@人想看-%@",dic[@"wantedCount"],dic[@"movieType"]];
        _detailLabel.textColor = [UIColor colorWithWhite:0.537 alpha:1.000];
    
    }
}

@end
