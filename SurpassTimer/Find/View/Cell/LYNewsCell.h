//
//  LYNewsCell.h
//  SurpassTimer
//
//  Created by qianfeng on 15/11/26.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYNewsCell : UITableViewCell

//横向图片
@property(nonatomic,strong)UILabel *celltitle;//大标题

@property(nonatomic,strong)UILabel *commentCount;//评论数

@property(nonatomic,retain)NSArray *images;//装图片数组
@property(nonatomic,strong)UIImageView *cellurl1;//三张图

@end
