//
//  MyNavigationBar.m
//  IFood
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 Oreki. All rights reserved.
//

#import "OrekiNavigationBar.h"
#import "LocationViewController.h"
#import "SearchViewController.h"
#import "ShoppingCartViewController.h"
#import "XGFMDBTool.h"
#import "BuyRYViewControllerA.h"
#import "LYrooviewController.h"


@implementation OrekiNavigationBar
{
    BOOL flag;
    XGFMDBTool * tool;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, K_MainScreenWidth, 64);
        self.backgroundColor = K_NavigationBarColor;
        tool = [[XGFMDBTool alloc]init];
    }
    return self;
}

+ (instancetype)BarType:(OrekiNavigationBarType)type andWithController:(RootViewController *)controller
{
    
    OrekiNavigationBar * ob = [[OrekiNavigationBar alloc]init];
    
    switch (type) {
        case BarTypeOfHome:
            [ob typeOfHomeWithController:controller];
            break;
        case BarTypeOfBuy:
            [ob typeOfBuyWithController:controller];
            break;
        case BarTypeOfSearch:
             [ob typeOfSearchWithController:controller];
            break;
        case BarTypeOfShop:
            [ob typeOfShopWithController:controller];
            break;
        case BarTypeOfBack:
            [ob typeOfBackWithController:controller];
            break;
        case BarTypeOfDefault:
             [ob typeOfDefaultWithController:controller];
            break;
        case BarTypeOfNone:
            break;
        case BarTypeOfCollect:
            [ob typeOfCollectWithController:controller];
            break;
    }
  
    return ob;
}

/**
 *  二维码按钮
 *

 */
-(void)createErWeiMaWithController:(RootViewController *)controller andWithX:(CGFloat)x
{
    UIImage * erWeiMa = [UIImage imageNamed:@"icon_scan_barcode_white"];
    OrekiButton * erWeiMaBtn = [OrekiButton buttonWithType:UIButtonTypeCustom];
    erWeiMaBtn.frame = CGRectMake(x, 20, 40, 40);
    [erWeiMaBtn setImage:erWeiMa forState:UIControlStateNormal];
    erWeiMaBtn.controller = controller;
    [erWeiMaBtn addTarget:self action:@selector(erWeiMaClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:erWeiMaBtn];
}

/**
 *  搜索按钮
 *
 */
-(void)createSearchWithController:(RootViewController *)controller andWithSel:(SEL)sel
{
    
//    UIImage * search = [UIImage imageNamed:@"v10_search_icon"];
//    OrekiButton * searchBth = [OrekiButton buttonWithType:UIButtonTypeCustom];
//    searchBth.frame = CGRectMake(K_MainScreenWidth-50, 20, 40, 40);
//    [searchBth setImage:search forState:UIControlStateNormal];
//    searchBth.controller = controller;
//    [searchBth addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
//    
//    [self addSubview:searchBth];

}

/**
 *  城市位置按钮
 *
 */
-(void)createLocationWithController:(RootViewController *)controller
{
    _locationButton = [OrekiButton buttonWithType:UIButtonTypeCustom];


    _locationButton.frame = CGRectMake(10, 30, 80, 20);
    
    //_locationButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _locationButton.controller = controller;
    
    
    
//    UIImage * image = [UIImage imageNamed:@"icon_index_selectcity"] ;
//     image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 40, 9, 5)];
//    imageView.image = image;
    [_locationButton addTarget:self action:@selector(locationClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:imageView];
    [self addSubview:_locationButton];
}

/**
 *  分页管理器
 *
 */
-(void)createSegmentedWithController:(RootViewController *)controller
{
    NSArray * arr = @[@"电影",@"影院"];
    _segmented = [[UISegmentedControl alloc]initWithItems:arr];
    _segmented.selectedSegmentIndex = 0;
    _segmented.frame = CGRectMake(K_MainScreenWidth/2.0 - 70, 25, 140, 30);
    
    _segmented.backgroundColor = [UIColor clearColor];
    _segmented.tintColor = [UIColor whiteColor];
 
//    segmented.layer.cornerRadius = 10;
//    segmented.layer.masksToBounds = YES;
    _movie = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    _movie.backgroundColor = [UIColor redColor];
    _cinema = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    _cinema.backgroundColor = [UIColor greenColor];
    
    [controller.view addSubview:_cinema];
    [controller.view addSubview:_movie];
    
    
    
    [_segmented addTarget:self action:@selector(segmentChangedValue:) forControlEvents:UIControlEventValueChanged];

 
    [self addSubview:_segmented];
    
}

/**
 *  分页管理器切换方法
 *
 *  @param sender 本类调用使用参数类型：UISegmentedControl 他类调用使用参数类型：NSString
 */
- (void)segmentChangedValue:(id)sender
{
    NSString * str = [NSString string];
    if ([sender isKindOfClass:[UISegmentedControl class]])
    {
        //获得seg的标题
        UISegmentedControl * seg = sender;
        str = [seg titleForSegmentAtIndex:seg.selectedSegmentIndex];
    }
    if ([sender isKindOfClass:[NSString class]]) {
        str = sender;
    }
    
    if ([str isEqualToString:@"电影"])
    {
        flag = YES;
        [_cinema.superview sendSubviewToBack:_cinema];
    }
    else if ([str isEqualToString:@"影院"])
    {
        flag = NO;
        [_movie.superview sendSubviewToBack:_movie];
    }
    
}

/**
 *  返回按钮
 *
 */
-(void)createBackWithController:(RootViewController *)controller
{
    OrekiButton * back = [OrekiButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(10, 20, 40, 40);
    back.controller = controller;
    UIImage * image = [UIImage imageNamed:@"v10_photoNewsLeft"];
    [back setImage:image forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:back];
}

/**
 *  搜索栏
 *
 */
-(void)createSearchBarWithControllerWithFrame:(CGRect)frame
{
    _searchBar = [[UISearchBar alloc]initWithFrame:frame];
    [self addSubview:_searchBar];
    

    
}

-(void)createClearBtnWithSEL:(SEL)sel
{
    UIButton * clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clearBtn.frame = CGRectMake(K_MainScreenWidth-60, 20, 40, 40);
    clearBtn.backgroundColor = K_NavigationBarColor;
    [clearBtn setTitle:@"取消" forState:UIControlStateNormal];
    [clearBtn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:clearBtn];
}

-(void)createShopWithController:(RootViewController *)controller
{
}


/**
 *  标题栏
 */
-(void)createBackWithTitle
{
    _title = [[UILabel alloc]initWithFrame:CGRectMake(K_MainScreenWidth/2.0 - 75, 30, 150, 20)];
    _title.textColor = [UIColor whiteColor];
    _title.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_title];
}
/**
 *  购物车按钮
 *
 */
-(void)createShopButtonWithController:(RootViewController *)controller
{
    OrekiButton * shopBtn = [OrekiButton buttonWithType:UIButtonTypeCustom];
    
    shopBtn.frame = CGRectMake(K_MainScreenWidth-60, 20, 40, 40);
    
    UIImage * image = [UIImage imageNamed:@"v10_cart_notify"];
    
    [shopBtn setImage:image forState:UIControlStateNormal];
    
    [shopBtn addTarget:shopBtn action:@selector(shopClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:shopBtn];
    
}
/**
 *  右侧自定义按钮
 */
-(void)createCustomButtonForRight
{
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _rightButton.frame = CGRectMake(K_MainScreenWidth-60, 20, 40, 40);
    
    [self addSubview:_rightButton];
}
/**
 *  收藏和分享按钮
 *
 */
-(void)createCollectAndShareButtonWithController:(RootViewController *)controller
{
    

    UIImage * collectButtonImage;
    if ([controller isKindOfClass:[BuyRYViewControllerA class]])
    {
        BuyRYViewControllerA * rc = (BuyRYViewControllerA *)controller;
        
        if(![[NSUserDefaults standardUserDefaults] boolForKey:[[rc.dic objectForKey:@"id"] stringValue]])
        {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:[[rc.dic objectForKey:@"id"] stringValue]];
            
            collectButtonImage = [UIImage imageNamed:@"icon_bookmark"];
        }
        else
        {
            collectButtonImage = [UIImage imageNamed:@"icon_bookmark 2"];
        }
        
        
    }
    else if ([controller isKindOfClass:[LYrooviewController class]])
    {
        LYrooviewController * lc = (LYrooviewController *)controller;
        
        NSNumber *key = [NSNumber numberWithInteger:lc.LYid.integerValue];
        
        if (![[NSUserDefaults standardUserDefaults] boolForKey:[key stringValue]])
        {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:[key stringValue]];
            
            collectButtonImage = [UIImage imageNamed:@"icon_bookmark"];
        }
        else
        {
            collectButtonImage = [UIImage imageNamed:@"icon_bookmark 2"];
        }
        
    }


    
    
    OrekiButton * shareButton = [OrekiButton buttonWithType:UIButtonTypeCustom];
    
    shareButton.frame = CGRectMake(K_MainScreenWidth-50, 20, 40, 40);
    
    [shareButton setImage:[UIImage imageNamed:@"icon_sharing"] forState:UIControlStateNormal];
    shareButton.controller = controller;
    
    [shareButton addTarget:self action:@selector(shareButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:shareButton];
    
    OrekiButton * collectButton = [OrekiButton buttonWithType:UIButtonTypeCustom];
    
    collectButton.frame = CGRectMake(K_MainScreenWidth-90, 20, 40, 40);
    
    [collectButton setImage:collectButtonImage forState:UIControlStateNormal];
    
    collectButton.controller = controller;
    
    [collectButton addTarget:self action:@selector(collectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
//    [self addSubview:collectButton];
}

#pragma mark - 导航条类型

-(void)typeOfHomeWithController:(RootViewController *)controller
{
    
    [self createLocationWithController:controller];
    
    [self createErWeiMaWithController:controller andWithX:K_MainScreenWidth-90];
    
    [self createSearchWithController:controller andWithSel:@selector(searchClick:)];
    
    
    
}
-(void)typeOfBuyWithController:(RootViewController *)controller
{
    
    flag = YES;
    
    [self createLocationWithController:controller];
    
    [self createSegmentedWithController:controller];
    
    [self createSearchWithController:controller andWithSel:@selector(search:)];
    
    
}
-(void)typeOfSearchWithController:(RootViewController *)controller
{
    
    [self createSearchBarWithControllerWithFrame:CGRectMake(10, 20, K_MainScreenWidth-90, 40)];
    
    [self createClearBtnWithSEL:@selector(backClick:)];
     
    
}
-(void)typeOfShopWithController:(RootViewController *)controller
{

    [self createSearchBarWithControllerWithFrame:CGRectMake(80, 20, K_MainScreenWidth-160, 40)];
    
    [self createErWeiMaWithController:controller andWithX:20];
    
    [self createShopButtonWithController:controller];
}
-(void)typeOfBackWithController:(RootViewController *)controller
{
    [self createBackWithController:controller];
    
    [self createBackWithTitle];
}

-(void)typeOfDefaultWithController:(RootViewController *)controller
{
    [self createBackWithController:controller];
    
    [self createBackWithTitle];
    
    [self createCustomButtonForRight];
    
}
-(void)typeOfCollectWithController:(RootViewController *)controller
{
    
    [self createBackWithController:controller];
    
    [self createCollectAndShareButtonWithController:controller];
    
}

#pragma mark - 一些跳转方法

-(void)locationClick:(OrekiButton *)btn
{
    LocationViewController * evc = [LocationViewController shareLocationViewController];
    
    [btn.controller.navigationController pushViewController:evc animated:YES];
}

-(void)erWeiMaClick:(OrekiButton *)btn
{
    
    ErWeiMaViewControllViewController * evc = [ErWeiMaViewControllViewController shareErWeiMaViewController];
    
    [btn.controller.navigationController pushViewController:evc animated:YES];
}

-(void)searchClick:(OrekiButton *)btn
{
    SearchViewController * evc = [[SearchViewController alloc]init];
    
    [btn.controller.navigationController pushViewController:evc animated:YES];
}

-(void)search:(OrekiButton *)btn
{
    
    if (flag)
    {
        SearchViewController * evc = [SearchViewController shareSearchViewController];
        
        [btn.controller.navigationController pushViewController:evc animated:YES];
    }
    else
    {
        [self createSearchBarWithControllerWithFrame:CGRectMake(10, 20, K_MainScreenWidth-90, 40)];
        
        [self createClearBtnWithSEL:@selector(clearBtnClick:)];
    }
    
}
//取消searchbar背景色
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
-(void)clearBtnClick:(UIButton *)btn
{
    
    [_searchBar removeFromSuperview];
    
    [btn removeFromSuperview];
}

-(void)backClick:(OrekiButton *)btn
{
    [btn.controller.navigationController popViewControllerAnimated:YES];
}

-(void)shopClick:(OrekiButton *)btn
{
    ShoppingCartViewController * scvc = [ShoppingCartViewController shareShoppingCartViewController];
    
    [btn.controller.navigationController pushViewController:scvc animated:YES];
}

-(void)shareButtonClick:(OrekiButton * )btn
{
    //分享
    self.block();
}

-(void)collectButtonClick:(OrekiButton * )btn
{
    if ([btn.controller isKindOfClass:[BuyRYViewControllerA class]])
    {
        BuyRYViewControllerA * con = (BuyRYViewControllerA *)btn.controller;
 
        NSString * table;
        
        if (!con.isTwoPage)
        {
            table = MOVIE_1_TABLE;
        }
        else
        {
            table = MOVIE_2_TABLE;
        }
        
        if (![[NSUserDefaults standardUserDefaults] boolForKey:[[con.dic objectForKey:@"id"] stringValue]])
        {
            [tool insertDBwithId:[[con.dic objectForKey:@"id"] stringValue]type:@"dic" position:[[con.dic objectForKey:@"id"] stringValue] WithObject:con.dic fromTable:table];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:[[con.dic objectForKey:@"id"] stringValue]];
            [btn setImage:[UIImage imageNamed:@"icon_bookmark 2"] forState:UIControlStateNormal];
        }
        else
        {
            [tool deleteObjById:[[con.dic objectForKey:@"id"] stringValue] fromTable:table];
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:[[con.dic objectForKey:@"id"] stringValue]];
            [btn setImage:[UIImage imageNamed:@"icon_bookmark"] forState:UIControlStateNormal];
        }
    }
    else if ([btn.controller isKindOfClass:[LYrooviewController class]])
    {
        LYrooviewController * lvc = (LYrooviewController *)btn.controller;
        
        NSNumber * key = [NSNumber numberWithInteger:lvc.LYid.integerValue];
        
        if (![[NSUserDefaults standardUserDefaults] boolForKey:key.stringValue]) {
            [tool insertDBwithId:key.stringValue type:@"str" position:key.stringValue WithObject:key.stringValue fromTable:COLLECT_TABLE];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:key.stringValue];
            [btn setImage:[UIImage imageNamed:@"icon_bookmark 2"] forState:UIControlStateNormal];
        }
        else
        {
            [tool deleteObjById:key.stringValue fromTable:COLLECT_TABLE];
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:key.stringValue];
            [btn setImage:[UIImage imageNamed:@"icon_bookmark"] forState:UIControlStateNormal];
        }
    }
}

@end
