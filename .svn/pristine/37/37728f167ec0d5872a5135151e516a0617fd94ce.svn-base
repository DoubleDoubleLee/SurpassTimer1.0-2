//
//  CustomToolsButton.m
//  exercise
//
//  Created by 陈曹振 on 15/11/24.
//  Copyright © 2015年 ccz. All rights reserved.
//

#import "CustomToolsButton.h"
#import "NumButtonView.h"
#import "TitleButton.h"

@interface CustomToolsButton ()<NSObject>

@property(nonatomic,copy)void (^buttonNum)(int);

@end

@implementation CustomToolsButton




+(CustomToolsButton *)CustomButtonType:(CustomButtonType)customButtonType andWithFrame:(CGRect)frame andWithButtonTitleArray:(NSArray *)titleArray andWithButtonNumArray:(NSArray *)numArray ButtonClick:(void (^)(int))buttonNum
{
    if (customButtonType == NumButton) {
        CustomToolsButton * toolsView = [[CustomToolsButton alloc] initWithFrame:frame andWithtitleArray:titleArray andWithNumArray:numArray andtype:0];
        toolsView.buttonNum = buttonNum;
        return toolsView;
    }
    else if (customButtonType == TextButtom)
    {
        CustomToolsButton * toolsView = [[CustomToolsButton alloc] initWithFrame:frame andWithtitleArray:titleArray andWithNumArray:numArray andtype:1];
        toolsView.buttonNum = buttonNum;
        return toolsView;
    }
    else
    {
        return nil;
    }
    
}

// 带数字的按钮
- (instancetype)initWithFrame:(CGRect)frame andWithtitleArray:(NSArray *)titleArray andWithNumArray:(NSArray *)numArray andtype:(int)A
{
    if (self == [super initWithFrame:frame]) {
      
        if (A == 0) {
            for (int i = 0; i < titleArray.count; i++) {
                CGFloat buttonW = frame.size.width/titleArray.count;
                CGFloat buttonX = i;
                CGFloat buttonY = 0;
                CGFloat buttonH = frame.size.height;
                CGRect buttonFrame = CGRectMake(buttonX*buttonW, buttonY, buttonW, buttonH);
                NSString * title = titleArray[i];
                NSString * num = numArray[i];
                
                NumButtonView * numButtonView = [NumButtonView numButtonFram:buttonFrame andwithTitle:title andWithNum:num tag:i];
                numButtonView.buttonNum = ^(int a){
                    self.buttonNum(a);
                };
                
                [self addSubview:numButtonView];
            }
        }
        else if (A == 1)
        {
            for (int i = 0; i < titleArray.count; i++) {
                CGFloat buttonW = frame.size.width/titleArray.count;
                CGFloat buttonX = i;
                CGFloat buttonY = 0;
                CGFloat buttonH = frame.size.height;
                CGRect buttonFrame = CGRectMake(buttonX*buttonW, buttonY, buttonW, buttonH);
                NSString * title = titleArray[i];
                
                TitleButton * titleButton = [[TitleButton alloc] init];
                titleButton.frame = buttonFrame;
                [titleButton setTitle:title forState:UIControlStateNormal];
                [titleButton setImage:[UIImage imageNamed:@"11"] forState:UIControlStateNormal];
                [titleButton addTarget:self action:@selector(titleButtonCilck:) forControlEvents:UIControlEventTouchUpInside];
                titleButton.tag = 1000+i;
                [self addSubview:titleButton];
            }
        }
        
      
    }
    return self;
}

- (void)titleButtonCilck:(UIButton *)button
{
    self.buttonNum((int)button.tag-1000);
}

@end
