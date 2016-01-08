//
//  BadgeButton.m
//  HandForLOLForMe
//
//  Created by 陈曹振 on 15/11/11.
//  Copyright © 2015年 ccz. All rights reserved.
//

#import "BadgeButton.h"
#import "UIImage+CCZ.h"

@implementation BadgeButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.userInteractionEnabled = NO;
        self.hidden = YES;
        [self setBackgroundImage:[UIImage resizedImageWithName:@"hero_red_dot"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:8];
        
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    
    // 设置提醒数字
    if (badgeValue) {
        self.hidden = NO;
        [self setTitle:badgeValue forState:UIControlStateNormal];
        NSDictionary * dic = @{NSFontAttributeName : [UIFont systemFontOfSize:8]};
        
        // 设置frame
        CGRect frame = self.frame;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        if (badgeValue.length > 1) {
            // 文字的尺寸
            CGSize size = [badgeValue boundingRectWithSize:CGSizeMake(MAXFLOAT, 8) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
            badgeW =  size.width + 5;
        }
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        self.frame = frame;
        
    }
    else{
        self.hidden = YES;
    }
}

@end
