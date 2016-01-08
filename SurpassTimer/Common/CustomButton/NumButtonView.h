//
//  NumButtonView.h
//  exercise
//
//  Created by 陈曹振 on 15/11/24.
//  Copyright © 2015年 ccz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumButtonView : UIView

@property(nonatomic,copy)void (^buttonNum)(int);
+ (NumButtonView *)numButtonFram:(CGRect)buttonFrame andwithTitle:(NSString *)title andWithNum:(NSString *)num tag:(int)i;

@end
