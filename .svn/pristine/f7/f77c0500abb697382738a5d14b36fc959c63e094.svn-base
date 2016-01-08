//
//  OrekiHeadView.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/26.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "OrekiHeadView.h"
#import "UIImage+ImageEffects.h"

@implementation OrekiHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, K_MainScreenWidth, 160);
        UIImage * image = [UIImage imageNamed:@"bc378d389af4887956e5cf557303cb88.jpg"];
        image = image.applyLightEffect;
        UIImageView * view = [[UIImageView alloc]initWithFrame:self.frame];
        view.image = image;
        [self addSubview:view];
    }
    return self;
}



@end
