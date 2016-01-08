//
//  TitleButton.h
//  exercise
//
//  Created by 陈曹振 on 15/11/24.
//  Copyright © 2015年 ccz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleButton : UIButton


+ (TitleButton *)numButtonFram:(CGRect)buttonFrame andwithTitle:(NSString *)title ButtonClick:(void(^)(void))buttonClick;


@end
