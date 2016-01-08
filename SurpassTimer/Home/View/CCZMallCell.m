//
//  CCZMallCell.m
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/25.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "CCZMallCell.h"

@implementation CCZMallCell

- (void)awakeFromNib {
    // Initialization code
    
}


+ (instancetype)mallTableViewCelllWithTableView:(UITableView *)tableView
{
    CCZMallCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MallCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CCZMallCell" owner:self options:nil] lastObject];
    }
    return cell;
}



- (void)setModel:(CCZAreaSecond *)model
{
    _model = model;
    // 左下
    NSURL * url1 = [NSURL URLWithString:_model.subFirst[@"image2"]];
    [self.image2 sd_setImageWithURL:url1];
    self.titleSmall2.text =_model.subFirst[@"titleSmall"];
    self.shangoutehui.text =_model.subFirst[@"title"];
    // 右上
    NSURL * url2 = [NSURL URLWithString:_model.subSecond[@"image2"]];
    [self.image3 sd_setImageWithURL:url2];
    self.titleSmall3.text =_model.subSecond[@"titleSmall"];
    self.rexiaotuijian.text =_model.subSecond[@"title"];
    
    
    // 右下
    
    NSURL * url3 = [NSURL URLWithString:_model.subThird[@"image2"]];
    [self.image4 sd_setImageWithURL:url3];
    self.titleSmall4.text =_model.subThird[@"titleSmall"];
    self.chaungyizhoubian.text =_model.subThird[@"title"];
    
    // 上
    
    NSURL * url4 = [NSURL URLWithString:_model.subFifth[@"image2"]];
    [self.Image1 sd_setImageWithURL:url4];
    self.titleSmall1.text =_model.subFifth[@"titleSmall"];
    self.title1.text =_model.subFifth[@"title"];
    
}

- (IBAction)button:(UIButton *)sender {
    
    if (sender.tag == 101)
    {
        NSString * str = _model.subFifth[@"gotoPage"][@"url"];
        NSURL * url = [NSURL URLWithString:str];
        self.pushWebView(url);
    }
    else if (sender.tag == 102)
    {
        NSString * str = _model.subFirst[@"gotoPage"][@"url"];
        NSURL * url = [NSURL URLWithString:str];
        self.pushWebView(url);
    }
    else if (sender.tag == 103)
    {
        NSString * str = _model.subSecond[@"gotoPage"][@"url"];
        NSURL * url = [NSURL URLWithString:str];
        self.pushWebView(url);
    }
    else
    {
        NSString * str = _model.subThird[@"gotoPage"][@"url"];
        NSURL * url = [NSURL URLWithString:str];
        self.pushWebView(url);
    }
    
}


@end
