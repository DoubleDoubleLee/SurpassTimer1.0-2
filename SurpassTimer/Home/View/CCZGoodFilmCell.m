//
//  CCZGoodFilmCell.m
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "CCZGoodFilmCell.h"

@implementation CCZGoodFilmCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;

}

+ (instancetype)goodFilmWithTableView:(UITableView *)tableView
{
    CCZGoodFilmCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GoodFilmCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CCZGoodFilmCell" owner:self options:nil] lastObject];
    }
    return cell;
}

- (void)setModel:(HotMove *)model
{
    _model = model;
    NSLog(@"%@",_model);
    [self.topCover sd_setImageWithURL:[NSURL URLWithString:_model.topCover]];
    self.title.text = _model.title;
    self.desc.text = _model.movie[@"desc"];
    NSString * str = [NSString stringWithFormat:@"%@(%@)",_model.movie[@"titleCn"],_model.movie[@"year"]];
    self.titleCnAndYear.text = str;
    self.title2.text = _model.movie[@"titleEn"];
    [self.image2 sd_setImageWithURL:[NSURL URLWithString:_model.movie[@"image"]]];
    
    
    
}
@end
