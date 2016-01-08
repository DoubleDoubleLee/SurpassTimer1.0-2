//
//  BuyRYBCell.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/29.
//  Copyright © 2015年 L-J-C. All rights reserved.
//


#define URL @"http://api.m.mtime.cn/Movie/HotLongComments.api?movieId=%@&pageIndex=1"

#import "BuyRYBCell.h"

@implementation BuyRYBCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}



-(void)createUI:(NSString *)ID
{
    NSString * path = [NSString stringWithFormat:URL,ID];
    
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:path parameters:nil sucess:^(NSData *data) {
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSArray * arr = dic[@"comments"];
        _count.text = [NSString stringWithFormat:@"精选影评  (%ld)",arr.count];
        int i = arc4random()%(arr.count-1);
        
        NSDictionary * dicc = arr[i];
        
        _titleLabel.text = dicc[@"title"];
        
        _detailText.text = dicc[@"content"];
        
        [_userPhoto sd_setImageWithURL:[NSURL URLWithString:dicc[@"headurl"]]];
        _userPhoto.layer.cornerRadius = _userPhoto.bounds.size.width/2.0;
        _userPhoto.layer.masksToBounds = YES;
        
        
        _userName.text = dicc[@"nickname"];
        
        NSString * number = [NSString stringWithFormat:@"%@",dicc[@"rating"]];
        _userGrade.text = [NSString stringWithFormat:@"%.1f",[number floatValue]];
        _userGrade.textColor = [UIColor whiteColor];
        _userGrade.backgroundColor = [UIColor colorWithRed:0.055 green:0.553 blue:0.314 alpha:1.000];
        _userGrade.textAlignment = NSTextAlignmentCenter;
        
    } fail:^(NSError *error) {
        
    }];
    
    
    
}





@end
