//
//  CCZHotCell.m
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "CCZHotCell.h"
#import "CustomToolsButton.h"
#import "CCZHotPreson.h"

@implementation CCZHotCell

- (void)awakeFromNib {
    
//    
//     [self addCustomButton];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

+ (instancetype)hotCellWithTableView:(UITableView *)tableView
{
    CCZHotCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HotCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CCZHotCell" owner:self options:nil] lastObject];
    }
    return cell;
}


- (void)setModelArr:(NSArray *)modelArr
{
    _modelArr = modelArr;
    
    CCZHotPreson * model1 = _modelArr[0];
    [self.image1 sd_setImageWithURL:[NSURL URLWithString:model1.img]];
     self.title1.text = model1.title;
     self.desc1.text = model1.desc;
    
    CCZHotPreson * model2 = _modelArr[1];
    [self.image2 sd_setImageWithURL:[NSURL URLWithString:model2.img]];
    self.title2.text = model2.title;
    self.desc2.text = model2.desc;
    
    CCZHotPreson * model3 = _modelArr[2];
    [self.image3 sd_setImageWithURL:[NSURL URLWithString:model3.img]];
    self.title3.text = model3.title;
    self.desc3.text = model3.desc;
}



- (void)addCustomButton
{
    CGFloat buttonX = 0;
    CGFloat buttonY = 260;
    CGFloat buttonW = self.contentView.bounds.size.width;
    CGFloat buttonH = 40;
    CGRect frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    NSArray * titleArr = @[@"新闻",@"预告片",@"排行榜",@"影评"];
    CustomToolsButton * button = [CustomToolsButton CustomButtonType:TextButtom andWithFrame:frame andWithButtonTitleArray:titleArr andWithButtonNumArray:nil ButtonClick:^(int buttonNum) {
       
        NSLog(@"%d",buttonNum);
        
        
    }];
    
    [self.contentView addSubview:button];
}
@end
