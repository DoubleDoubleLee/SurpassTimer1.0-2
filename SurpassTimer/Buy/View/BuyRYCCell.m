//
//  BuyRYCCell.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/29.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "BuyRYCCell.h"
#define URL @"http://api.m.mtime.cn/Movie/HotLongComments.api?movieId=%@&pageIndex=0"


@implementation BuyRYCCell

{
    UIImageView * userPhoto;
    UILabel * userName;
    UILabel * gradeLabel;
    UILabel * detailLabel;
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
    
    userPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    userPhoto.layer.masksToBounds = YES;
    userPhoto.layer.cornerRadius = 15;
    [self.contentView addSubview:userPhoto];
    
    userName = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 150, 15)];
    userName.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:userName];
    
    gradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(K_MainScreenWidth-30, 0, 20, 20)];
    gradeLabel.backgroundColor = [UIColor colorWithRed:0.055 green:0.553 blue:0.314 alpha:1.000];
    gradeLabel.adjustsFontSizeToFitWidth = YES;
    gradeLabel.font = [UIFont systemFontOfSize:12];
    gradeLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:gradeLabel];
    
    detailLabel = [[UILabel alloc] init];
    detailLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:detailLabel];
    
}



-(void)prepareUI:(NSDictionary * )dic
{
    [userPhoto sd_setImageWithURL:[NSURL URLWithString:dic[@"headurl"]]];
    userName.text = dic[@"nickname"];
   
    NSNumber * number = dic[@"rating"];
    
    gradeLabel.text = [NSString stringWithFormat:@"%.1f",[number floatValue]];
    
    
    NSString * detailStr = dic[@"content"];
    
    NSDictionary * detailAttribute =@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14]};
    
    CGSize detailSize = [detailStr sizeWithAttributes:detailAttribute];
    
 
    detailLabel.frame = CGRectMake(50, 35, K_MainScreenWidth-70, ((detailSize.width+100)/(K_MainScreenWidth-70))*20);
    detailLabel.text = detailStr;
    detailLabel.numberOfLines = 0;
    
}




@end
