//
//  NumButtonView.m
//  exercise
//
//  Created by 陈曹振 on 15/11/24.
//  Copyright © 2015年 ccz. All rights reserved.
//

#import "NumButtonView.h"
#import "NumButton.h"

@interface NumButtonView ()
@property(nonatomic,assign)int i;
@end


@implementation NumButtonView


+ (NumButtonView *)numButtonFram:(CGRect)buttonFrame andwithTitle:(NSString *)title andWithNum:(NSString *)num tag:(int)i
{
    NumButtonView * view = [[NumButtonView alloc] initWithFrame:buttonFrame andwithTitle:title andWithNum:num tag:i];
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame andwithTitle:(NSString *)title andWithNum:(NSString *)num tag:(int)i
{
    self = [super initWithFrame:frame];
    if (self) {
        self.i = i;
        [self addButtonWithTitle:title];
        [self addNumWithNum:num];
        self.backgroundColor = [UIColor whiteColor];
        
        
    }
    return self;
}

- (void)addButtonWithTitle:(NSString *)title
{
    NumButton * numBtn = [[NumButton alloc] init];
    CGFloat numBtnX = 0;
    CGFloat numBtnY = self.frame.size.height*2/3;
    CGFloat numBtnW = self.frame.size.width;
    CGFloat numBtnH = self.frame.size.height*1/3;
    numBtn.frame = CGRectMake(numBtnX, numBtnY, numBtnW, numBtnH);
    [numBtn setTitle:title forState:UIControlStateNormal];
    [numBtn setTitleColor:[UIColor colorWithRed:0.65f green:0.65f blue:0.65f alpha:1.00f] forState:UIControlStateNormal];
    [numBtn setImage:[UIImage imageNamed:@"11"] forState:UIControlStateNormal];
    numBtn.tag = 2000+self.i;
    [numBtn addTarget:self action:@selector(numBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:numBtn];
    UIImageView * view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"input-bar-flat"]];
    view.frame = CGRectMake(numBtnW, 20, 1, numBtnH);
    [self addSubview:view];
}

- (void)addNumWithNum:(NSString *)num
{
    UIButton * button = [[UIButton alloc] init];
    CGFloat labelX = 0;
    CGFloat labelY = 0;
    CGFloat labelW = self.frame.size.width;
    CGFloat labelH = self.frame.size.height*2/3;
    button.frame = CGRectMake(labelX, labelY, labelW, labelH);
    [button setTitle:num forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.tag = 2000+self.i;
    [button addTarget:self action:@selector(numBtn:) forControlEvents:UIControlEventTouchUpInside];
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 12);
    [self addSubview:button];
}

- (void)numBtn:(UIButton *)btn
{
    self.buttonNum((int)btn.tag-2000);

}




@end
