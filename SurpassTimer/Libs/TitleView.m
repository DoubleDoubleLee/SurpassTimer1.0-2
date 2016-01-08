//
//  TitleView.m
//  茶百科
//
//  Created by 刘宁 on 15/10/28.
//  Copyright (c) 2015年 liuning. All rights reserved.
//

#import "TitleView.h"

@implementation TitleView
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
    _view.backgroundColor = [UIColor whiteColor];
    _view.frame = CGRectMake(0, 60, width, 4);
    [self addSubview:_view];
    
    for (int i = 0; i < titles.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(width*i, 0, width, height);
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithWhite:0.928 alpha:1.000] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
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
                 _view.frame = CGRectMake(i*_width, 60, _width, 4);
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
                _view.frame = CGRectMake(i*_width, 60, _width, 4);
            }];
        }else{
            button.selected = NO;
        }
    }
}

@end
