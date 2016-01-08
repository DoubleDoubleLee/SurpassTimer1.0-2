//
//  LYTrailerTableViewCell.h
//  SurpassTimer
//
//  Created by qianfeng on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYTrailerTableViewCell : UITableViewCell
//@property(nonatomic,strong)UILabel *cellmovieName;
//@property(nonatomic,strong)UIImageView *coverImg;
//@property(nonatomic,strong)UILabel *summary;

@property (weak, nonatomic) IBOutlet UIImageView *coverImg;

@property (weak, nonatomic) IBOutlet UILabel *cellmovieName;

@property (weak, nonatomic) IBOutlet UILabel *summary;


@end
