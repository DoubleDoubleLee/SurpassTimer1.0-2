//
//  CCZMallCell.h
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCZAreaSecond.h"

@interface CCZMallCell : UITableViewCell

// 上Image
@property (weak, nonatomic) IBOutlet UIImageView *Image1;
//@property (weak, nonatomic) IBOutlet UIButton *allButton;
@property (weak, nonatomic) IBOutlet UILabel *title1;
@property (weak, nonatomic) IBOutlet UILabel *titleSmall1;
@property (weak, nonatomic) IBOutlet UILabel *dianyingshangcheng;

// 下image 竖
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UILabel *titleSmall2;
@property (weak, nonatomic) IBOutlet UILabel *shangoutehui;

// 下image 横1
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UILabel *titleSmall3;
@property (weak, nonatomic) IBOutlet UILabel *rexiaotuijian;


// 下 image横2
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@property (weak, nonatomic) IBOutlet UILabel *titleSmall4;
@property (weak, nonatomic) IBOutlet UILabel *chaungyizhoubian;


@property(nonatomic,strong)CCZAreaSecond * model;

+ (instancetype)mallTableViewCelllWithTableView:(UITableView *)tableView;

@property(nonatomic,copy)void(^pushWebView)(NSURL * url);


@end
