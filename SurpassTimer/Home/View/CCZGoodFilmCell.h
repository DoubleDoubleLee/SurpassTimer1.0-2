//
//  CCZGoodFilmCell.h
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotMove.h"

@interface CCZGoodFilmCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView * topCover;
@property (weak, nonatomic) IBOutlet UILabel * title;
@property (weak, nonatomic) IBOutlet UILabel * desc;
@property (weak, nonatomic) IBOutlet UILabel * titleCnAndYear;
@property (weak, nonatomic) IBOutlet UIImageView * image2;
@property (weak, nonatomic) IBOutlet UILabel *title2;


+ (instancetype)goodFilmWithTableView:(UITableView *)tableView;
@property(nonatomic,strong)HotMove * model;

@end
