//
//  CustomToolsButton.h
//  exercise
//
//  Created by 陈曹振 on 15/11/24.
//  Copyright © 2015年 ccz. All rights reserved.
//

/**
 *  样本:
         CGRect fram = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width,30);
         NSArray * array1 = @[@"按钮1",@"按钮2",@"按钮3",@"按钮3"];
         NSArray * array2 = @[@"123",@"321",@"142",@"142"];
         
         __weak typeof(self) weakSelf = self;
         CustomToolsButton * toolsButton = [CustomToolsButton CustomButtonType:NumButton andWithFrame:fram andWithButtonTitleArray:array1 andWithButtonNumArray:array2 ButtonClick:^(int buttonNum) {
         
                这个block会在点击按钮的时候调用 buttonNum是返回的按钮的tag 从0开始
         
         }];
 *
 */


#import <UIKit/UIKit.h>

typedef enum {
    NumButton = 0,
    TextButtom =  1,
    Defaultbutton = 2
}CustomButtonType;

@interface CustomToolsButton : UIView


+(CustomToolsButton *)CustomButtonType:(CustomButtonType)customButtonType andWithFrame:(CGRect)frame andWithButtonTitleArray:(NSArray *)titleArray andWithButtonNumArray:(NSArray *)numArray ButtonClick:(void(^)(int buttonNum))buttonNum;

@end
