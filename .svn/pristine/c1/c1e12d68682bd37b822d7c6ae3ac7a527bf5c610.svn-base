//
//  MyMovieViewController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/29.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "MyMovieViewController.h"
#import "ShangYingTableViewCell.h"
#import "ReYingTableViewCell.h"
#import "XGFMDBTool.h"

@interface MyMovieViewController ()

@end

@implementation MyMovieViewController
{
    NSMutableArray * _dataSrouce1;
    NSMutableArray * _dataSrouce2;
    XGFMDBTool * xt;
}
+ (MyMovieViewController * )shareMyMovieViewController
{
    static MyMovieViewController * shareManager = nil;
    static dispatch_once_t predicted;
    dispatch_once(&predicted, ^{
        shareManager = [[self alloc] init];
    });
    return shareManager;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavigationBar];
    [self ready];
    [self createTableView];
}

-(void)ready
{
    xt = [[XGFMDBTool alloc]init];
    
    
    _dataSrouce1 = [[NSMutableArray alloc]init];
    
    _dataSrouce2 = [[NSMutableArray alloc]init];

}

-(void)createNavigationBar
{
    OrekiNavigationBar * ob = [OrekiNavigationBar BarType:BarTypeOfBack andWithController:self];
    
    ob.title.text = @"我的电影";
    
    [self.view addSubview:ob];
}


-(void)createTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, K_MainScreenWidth, K_MainScreenHeight-64) style:UITableViewStylePlain]
    ;

    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSrouce1.count+_dataSrouce2.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < _dataSrouce1.count) {
        ReYingTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"reYingCell"];
        if (!cell) {
            
            cell = [[ReYingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reYingCell"];
        }
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell prepareUI:_dataSrouce1[indexPath.row]];
        
        return cell;
    }

    else
    {
        ShangYingTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"shangCell"];
        if (!cell) {
            cell = [[ShangYingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"shangCell"];
        }
        
        NSDictionary * dic = _dataSrouce2[indexPath.row - _dataSrouce1.count];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell prepareUI:dic];
        
        return cell;
    }
    
}


-(void)viewWillAppear:(BOOL)animated
{

    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewDidAppear:(BOOL)animated
{

    _dataSrouce1 = [NSMutableArray arrayWithArray:[xt getAllObjsWithPositionFromTable:MOVIE_1_TABLE]];
    
    _dataSrouce2 = [NSMutableArray arrayWithArray:[xt getAllObjsWithPositionFromTable:MOVIE_2_TABLE]];
    
    [self.tableView reloadData];
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
