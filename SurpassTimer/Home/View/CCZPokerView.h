//
//  CCZPokerView.h
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/24.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideImageView.h"

@interface CCZPokerView : UIView<SlideImageViewDelegate>
{
    SlideImageView* slideImageView;
    UILabel* indexLabel;
    UILabel* clickLabel;
}



@end
