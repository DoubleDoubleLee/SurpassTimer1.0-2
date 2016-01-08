//
//  LYTrailerTableViewCell.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//
#define Fonts  15  //cell上标题文字大小i

#import "LYTrailerTableViewCell.h"

@implementation LYTrailerTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createUI];
        
    }
    return self;

}
-(void)createUI
{
     _coverImg=[[UIImageView alloc]initWithFrame:CGRectMake(8, 6, 140+15, 90)];
    _coverImg.contentMode=UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_coverImg];
    
    UIImageView *imageviews=[[UIImageView alloc]initWithFrame:CGRectMake(115, 50, 35, 35)];
    imageviews.image=[UIImage imageNamed:@"icon_preview_play"];
    
    [_coverImg addSubview:imageviews];
    
    _cellmovieName=[[UILabel alloc]initWithFrame:CGRectMake(148+15+6+6, 6, K_MainScreenWidth-148+6+6, 45)];
    _cellmovieName.font=[UIFont systemFontOfSize:Fonts];
    _cellmovieName.textAlignment=NSTextAlignmentLeft;
    [self.contentView addSubview:_cellmovieName];
    
    
    _summary=[[UILabel alloc]initWithFrame:CGRectMake(148+15+6+6+5, 56, K_MainScreenWidth-148+12, 45)];
    _summary.font=[UIFont systemFontOfSize:12];
    _summary.textAlignment=NSTextAlignmentLeft;
    [self.contentView addSubview:_summary];

    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
