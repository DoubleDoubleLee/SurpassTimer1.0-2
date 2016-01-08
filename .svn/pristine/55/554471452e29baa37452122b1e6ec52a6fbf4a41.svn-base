//
//  ButTitleView.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/24.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "ButTitleView.h"

@implementation ButTitleView

{
    UIScrollView * scrollView;
    NSMutableArray * _array;
    UIView * _view;
    CGFloat _width;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        _array = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)setTitles:(NSArray *)titles
{
    [self addsubviewsWithTitles:titles];
}

-(void)addsubviewsWithTitles:(NSArray*)titles
{
    
    
    CGFloat width = self.frame.size.width/titles.count;
    CGFloat height = self.frame.size.height;
    _width = width;
    _view = [[UIView alloc]init];
    _view.backgroundColor = [UIColor colorWithRed:0.137 green:0.725 blue:1.000 alpha:1.000];
    _view.frame = CGRectMake(0, 35, width, 3);
    [self addSubview:_view];
    
    for (int i = 0; i < titles.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(width*i, 0, width, height);
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitleColor:[UIColor colorWithWhite:0.218 alpha:1.000] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:0.137 green:0.725 blue:1.000 alpha:1.000] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        [_array addObject:button];
        
    }
}

-(void)buttonClick:(UIButton*)button
{
    int i = 0;
    for (UIButton * but in _array) {
        if (button == but ) {
            but.selected = YES;
            self.buttonSelectAtIndex(i);
            [UIView animateWithDuration:0.4 animations:^{
                _view.frame = CGRectMake(i*_width, 35, _width, 3);
            }];
            
        }else{
            but.selected = NO;
        }
        
        i++;
    }
}

-(void)setCurrentPage:(NSInteger)currentPage
{
    
    for (int i = 0 ; i < _array.count; i++) {
        UIButton * button = _array[i];
        if (i == currentPage) {
            button.selected = YES;
            [UIView animateWithDuration:0.4 animations:^{
                _view.frame = CGRectMake(i*_width, 35, _width, 3);
            }];
        }else{
            button.selected = NO;
        }
    }
}


@end
