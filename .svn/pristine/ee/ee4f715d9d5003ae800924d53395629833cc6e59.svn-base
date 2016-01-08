//
//  CCZSelectSeatCell.m
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/27.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "CCZSelectSeatCell.h"

@implementation CCZSelectSeatCell

- (void)awakeFromNib {
    // Initialization code
}


+ (CCZSelectSeatCell *)selectSeatCellWithTableView:(UITableView *)tableView
{
    CCZSelectSeatCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CCZSelectSeatCell" owner:self options:nil] lastObject];
    }
    
    return cell;
}


- (void)setMoel:(CCZSelectSeatModel *)moel
{
    _moel = moel;
    self.cinameName.text = _moel.cinameName;
    self.address.text = _moel.address;
    NSString * str = [NSString stringWithFormat:@"%ld",[_moel.minPrice integerValue]/100];
    self.minPrice.text = str;
}



@end
