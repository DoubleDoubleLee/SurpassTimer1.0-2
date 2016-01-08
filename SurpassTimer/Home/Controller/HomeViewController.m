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
#import "CCZHotPreson.h"
#import "CCZAreaSecond.h"
#import "HotMove.h"


#import "CCZMallCell.h"
#import "CCZHotCell.h"
#import "CCZGoodFilmCell.h"
#import "CCZAdvertView.h"
#import "CCZSelectSeatController.h"
#import "CCZRoundView.h"

#import "LYNewsnextController.h"

@interface HomeViewController ()

@property(nonatomic,strong)NSMutableArray * advList;

@end


@implementation HomeViewController
{
    OrekiNavigationBar * _navgationBar;
}
//@synthesize advList = _advList;


- (NSMutableArray *)advList
{
    if (!_advList) {
        _advList = [[NSMutableArray alloc] init];
    }
    return _advList;
}

//- (void)setAdvList:(NSMutableArray *)advList
//{
//    self.advList = advList;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBlock];
    
    [self addBlock]; // 注册Block
    [self addtableView]; // 添加设置tableView
    [self addNavGationBar]; // 添加导航条
    [self prepareDataSource]; // 准备数据
}

-(void)createBlock
{
    LocationViewController * lvc = [LocationViewController shareLocationViewController];
    
    lvc.block = ^(){
        NSLog(@"sb");
    };
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSString * string = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];
    
    
    if (string.length>1) {
        [_navgationBar.locationButton setTitle:string forState:UIControlStateNormal];
    }
    
    else
    {
        [_navgationBar.locationButton setTitle:@"定位" forState:UIControlStateNormal];
    }
    
}




- (void)addBlock
{
    // 点击广告的
    __weak typeof(self) weakSelf = self;
    self.pushAdvertView = ^(NSString * str)
    {
        NSString * string = [NSString stringWithFormat:@"你点击刚点击了第%@个广告",str];
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"警告" message:string preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:action1];
        [weakSelf presentViewController:alert animated:YES completion:nil];
        
    };
    
    // push WebView
    self.pushWebView = ^(NSURL * url)
    {
        RootViewController * vc = [[RootViewController alloc] init];
        UIWebView * webView = [[UIWebView alloc] initWithFrame:weakSelf.view.bounds];
        webView.scrollView.bounces = NO;
        NSURLRequest * request = [NSURLRequest requestWithURL:url];
        [webView loadRequest:request];
        [vc.view addSubview:webView];
        [weakSelf.navigationController pushViewController:vc animated:YES];
        OrekiNavigationBar * nav = [OrekiNavigationBar BarType:BarTypeOfBack andWithController:vc];
        [vc.view addSubview:nav];
    };
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushSelectSetController) name:@"pushSelectObject" object:nil];
}

- (void)pushSelectSetController
{
    CCZSelectSeatController * vc = [[CCZSelectSeatController alloc] init];
    OrekiNavigationBar * nav = [OrekiNavigationBar BarType:BarTypeOfBack andWithController:vc];
    [vc.view addSubview:nav];
    [self.navigationController pushViewController:vc animated:YES];
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

        [UIColor colorWithRed:0.11f green:0.49f blue:0.75f alpha:1];
        
        
        self.tableView.bounces = YES;
    }
}

#pragma mark - 下载数据 转换成模型
- (void)prepareDataSource
{
    NSString * URL = [CCZDownLoadUrl getCellURL];
    [HTTPTool GETWithURL:URL params:nil succeed:^(id obj) {
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingMutableContainers error:nil];
        
        // advList数据
        NSArray * advListArray = dic[@"advList"];
        [advListArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CCZAdvertModel * moeld = [[CCZAdvertModel alloc] initWithDict:obj];
            [self.advList addObject:moeld];
        }];
        
        
        // ateaSecond数据
        NSMutableArray * areaSecondArr = [[NSMutableArray alloc] init];
        CCZAreaSecond * model2 = [[CCZAreaSecond alloc] initWithDict:dic[@"areaSecond"]];
        [areaSecondArr addObject:model2];
        [self.dataSource addObject:areaSecondArr];
        
        // hotPoints 数据
        NSMutableArray * hothotpointsArr = [[NSMutableArray alloc] init];
        for (NSDictionary * hothotpointsKey in dic[@"hotPoints"]) {
            CCZHotPreson * model = [[CCZHotPreson alloc] initWithDict:hothotpointsKey];
            [hothotpointsArr addObject:model];
        }
        [self.dataSource addObject:hothotpointsArr];
        
        // HotMove 数据
        NSMutableArray * hotMoveArr = [[NSMutableArray alloc] init];
        HotMove * model = [[HotMove alloc] initWithDict:dic[@"hotMovie"]];
        [hotMoveArr addObject:model];
        [self.dataSource addObject:hotMoveArr];

        
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}


#pragma mark - tableView的代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        CCZMallCell * cell = [CCZMallCell mallTableViewCelllWithTableView:tableView];
        cell.pushWebView = self.pushWebView;
        NSArray * arr = self.dataSource[indexPath.section];
        cell.model = arr[indexPath.row];
        return cell;
        
    }
    else if (indexPath.section == 1)
    {
        CCZHotCell * cell = [CCZHotCell hotCellWithTableView:tableView];
        cell.modelArr = self.dataSource[indexPath.section];
        return cell;
    }
    else
    {
        CCZGoodFilmCell * cell = [CCZGoodFilmCell goodFilmWithTableView:tableView];
        cell.model = self.dataSource[indexPath.section][indexPath.row];
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1) {
        CCZHotPreson *model=self.dataSource[indexPath.section][indexPath.row];
        LYNewsnextController *newsnext=[[LYNewsnextController alloc]init];
        newsnext.LYid=model.ID;
        [self.navigationController pushViewController:newsnext animated:NO];
        
    }

}

//设置脚标题视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        CCZAdvertView * view = [[CCZAdvertView alloc]initWithFrame:CGRectMake(0, 0, K_MainScreenWidth, 100) andWithModelArray:self.advList];
        view.pushAdvertView = self.pushAdvertView;
        
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
