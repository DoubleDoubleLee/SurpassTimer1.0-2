//
//  LYNewsTableViewCell.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//
#define Fonts  15  //cell上标题文字大小i
#import "LYNewsTableViewCell.h"

@implementation LYNewsTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    
    return self;
}
-(void)createUI
{
    _cellImage=[[UIImageView alloc]initWithFrame:CGRectMake(6, 6, 80, 80)];
    [self.contentView addSubview:_cellImage];
    
    UIImageView *images=[[UIImageView alloc]initWithFrame:CGRectMake(46, 46, 25, 25)];
    images.image=[UIImage imageNamed:@"icon_preview_play"];
    [_cellImage addSubview:images];
    
    
    _celltitle=[[UILabel alloc]initWithFrame:CGRectMake(86+10, 7, K_MainScreenWidth-86+10, 35)];
    _celltitle.font=[UIFont systemFontOfSize:Fonts];
    _celltitle.textAlignment=NSTextAlignmentLeft;
    [self.contentView addSubview:_celltitle];

    _celltitle2=[[UILabel alloc]initWithFrame:CGRectMake(86+10, 30+7, K_MainScreenWidth-86+10, 35)];
    _celltitle2.font=[UIFont systemFontOfSize:12];
    _celltitle2.numberOfLines=0;
    _celltitle2.adjustsFontSizeToFitWidth=YES;
    _celltitle2.textAlignment=NSTextAlignmentLeft;
    [self.contentView addSubview:_celltitle2];
    
    _cellTimes=[[UILabel alloc]initWithFrame:CGRectMake(86+10, 35+30+7, 60, 35)];
    _cellTimes.font=[UIFont systemFontOfSize:Fonts];
    _cellTimes.textAlignment=NSTextAlignmentLeft;
    
    [self.contentView addSubview:_cellTimes];
    
    _commentCount=[[UILabel alloc]initWithFrame:CGRectMake(86+10+60+35, 35+30+7, 60, 35)];
    _commentCount.font=[UIFont systemFontOfSize:Fonts];
    _commentCount.textAlignment=NSTextAlignmentLeft;
    [self.contentView addSubview:_commentCount];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
