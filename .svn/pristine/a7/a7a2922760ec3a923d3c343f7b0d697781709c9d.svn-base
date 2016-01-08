//
//  HomeViewController.m
//  HandForLOLForMe
//
//  Created by 陈曹振 on 15/11/23.
//  Copyright © 2015年 ccz. All rights reserved.
//

#import "HomeViewController.h"
#import "ScrollButtonViewController.h"
#import "CCZTableHeaderView.h"
#import "CCZDownLoadUrl.h"
#import "CCZAdvertModel.h"
#import "CCZMallCell.h"
#import "CCZHotCell.h"
#import "CCZGoodFilmCell.h"


@interface HomeViewController ()
@end

@implementation HomeViewController
{
    OrekiNavigationBar * _navgationBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addtableView]; // 添加设置tableView
    [self addNavGationBar]; // 添加导航条
    [self prepareDataSource]; // 准备数据
}
- (void)addNavGationBar
{
    OrekiNavigationBar * navgationBar = [OrekiNavigationBar BarType:BarTypeOfHome andWithController:self];
    _navgationBar = navgationBar;
    [navgationBar.locationButton setTitle:@"城市" forState:UIControlStateNormal];
    navgationBar.backgroundColor = [UIColor colorWithRed:0.11f green:0.49f blue:0.75f alpha:1.00f];
    [self.view addSubview:navgationBar];
}
- (void)addtableView
{
    self.tableView.frame = CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height+20);
    self.tableView.rowHeight = 300;
    [self.view addSubview:self.tableView];
    
    CGFloat viewW = [UIScreen mainScreen].bounds.size.width;
    CGFloat viewH = 497;
    CGRect frame = CGRectMake(0, 0, viewW, viewH);
    CCZTableHeaderView * view = [[CCZTableHeaderView alloc] initWithFrame:frame];
    self.tableView.tableHeaderView = view;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 100) {
        
        self.tableView.bounces = NO;
        CGFloat x = scrollView.contentOffset.y/100;
        _navgationBar.backgroundColor = [UIColor colorWithRed:0.11f green:0.49f blue:0.75f alpha:x];
    }
    else
    {
        self.tableView.bounces = YES;
    }
}


- (void)prepareDataSource
{
    
    NSString * URL = [CCZDownLoadUrl getCellURL];
    [HTTPTool GETWithURL:URL params:nil succeed:^(id obj) {
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingMutableContainers error:nil];
        // advList数据
        NSArray * advListArray = dic[@"advList"];
        NSMutableArray * advArr = [[NSMutableArray alloc] init];
        [advListArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CCZAdvertModel * moeld = [[CCZAdvertModel alloc] initWithDict:obj];
            [advArr addObject:moeld];
        }];
        [self.dataSource addObject:advArr];
        // hot数据
        
        
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}


#pragma mark - tableView的代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        CCZMallCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MallCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"CCZMallCell" owner:self options:nil] lastObject];
        }
        return cell;
        
    }
    else if (indexPath.section == 1)
    {
        CCZHotCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HotCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"CCZHotCell" owner:self options:nil] lastObject];
        }
        return cell;
    }
    else
    {
        CCZGoodFilmCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GoodFilmCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"CCZGoodFilmCell" owner:self options:nil] lastObject];
        }
        return cell;
    }
}


//设置脚标题视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K_MainScreenWidth, 100)];
        view.backgroundColor = [UIColor redColor];
        //    view.backgroundColor = [UIColor blueColor];
        return view;
    }
    else
        return nil;
    
    
}//  脚标题高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 100;
    }
    else
        return 0;
}


@end
