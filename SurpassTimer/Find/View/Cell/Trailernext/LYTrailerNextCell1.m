//
//  LYTrailerNextCell1.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/29.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "LYTrailerNextCell1.h"

@implementation LYTrailerNextCell1

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
    self.cellremark=[[UILabel alloc]init];
    
    //    _cellremark.numberOfLines=0;
    
    _cellremark.backgroundColor=[UIColor colorWithWhite:0.909 alpha:1.000];
    _cellremark.textColor=[UIColor colorWithWhite:0.273 alpha:1.000];
    [self.contentView addSubview:_cellremark];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
