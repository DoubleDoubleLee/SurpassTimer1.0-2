//
//  BuyRYACell.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/28.
//  Copyright © 2015年 L-J-C. All rights reserved.
//
#define URL @"http://api.m.mtime.cn/Movie/ImageAll.api?movieId=%@"

#import "BuyRYACell.h"

@implementation BuyRYACell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        
        
        
        
    }
    return self;
}




-(void)createUI:(NSString *)ID
{
    NSString * path = [NSString stringWithFormat:URL,ID];
    
    
    
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:path parameters:nil sucess:^(NSData *data) {
        
        NSDictionary * dic =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray * arr = dic[@"images"];
        int i = arc4random()%arr.count;
        int j = arc4random()%arr.count;
        int k = arc4random()%arr.count;
        int e = arc4random()%arr.count;
        NSDictionary * dic1 = arr[i];
        NSDictionary * dic2 = arr[j];
        NSDictionary * dic3 = arr[k];
        NSDictionary * dic4 = arr[e];
        
        [_first sd_setImageWithURL:[NSURL URLWithString:dic1[@"image"]]];
        
        [_second sd_setImageWithURL:[NSURL URLWithString:dic2[@"image"]]];
        
        [_third sd_setImageWithURL:[NSURL URLWithString:dic3[@"image"]]];
        
        [_four sd_setImageWithURL:[NSURL URLWithString:dic4[@"image"]]];
        
        
        
        _count.text = [NSString stringWithFormat:@"%ld张图片",arr.count];
        
        
    } fail:^(NSError *error) {
        
    }];
    
    
}

@end
