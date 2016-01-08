//
//  LYNewsTableViewCell.h
//  SurpassTimer
//
//  Created by qianfeng on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYNewsTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *cellImage;

@property(nonatomic,strong)UILabel *celltitle;
@property(nonatomic,strong)UILabel *celltitle2;
@property(nonatomic,strong)UILabel *commentCount;//评论数
@property(nonatomic,strong)UILabel *cellTimes;//时间


@end
