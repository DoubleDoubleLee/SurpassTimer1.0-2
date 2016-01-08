//
//  CCZAdvertView.m
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/26.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "CCZAdvertView.h"
#import "CCZAdvertModel.h"

@interface CCZAdvertView ()<SDCycleScrollViewDelegate>

@property (nonatomic , strong) NSMutableArray * dataSource; // 装广告信息的数组

@end

@implementation CCZAdvertView
{
    CCZAdvertModel * _model; //获取模型
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

- (instancetype)initWithFrame:(CGRect)frame andWithModelArray:(NSArray *)modelArr
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self preapreDataSource:modelArr];
         [self addScrollView];
        
    }
    return self;
}
// 获取每个图片的URL
- (void)preapreDataSource:(NSArray *)modelArr
{
    [modelArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CCZAdvertModel * model = obj;
        NSString * strUrl = model.img2;
        [self.dataSource addObject:strUrl];
    }];
}

- (void)addScrollView
{
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = self.dataSource;
    //网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds imageURLStringsGroup:nil]; // 模拟网络延时情景
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.delegate = self;
    cycleScrollView2.dotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    cycleScrollView2.placeholderImage = [UIImage imageNamed:@"placeholder"];
    [self addSubview:cycleScrollView2];

    
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;

    
    
    // 清除缓存
    //    [cycleScrollView2 clearCache];
    
    
    
}


#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{

    NSString * str = [NSString stringWithFormat:@"%ld",index+1];
    self.pushAdvertView(str);
}

@end
