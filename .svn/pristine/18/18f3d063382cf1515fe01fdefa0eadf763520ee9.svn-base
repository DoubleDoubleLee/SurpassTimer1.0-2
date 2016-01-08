//
//  CCZSelectSeatController.m
//  SurpassTimer
//
//  Created by 陈曹振 on 15/11/27.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "CCZSelectSeatController.h"
#import "CCZDownLoadUrl.h"
#import "CCZSelectSeatModel.h"
#import "CCZSelectSeatCell.h"

@interface CCZSelectSeatController ()

@end

@implementation CCZSelectSeatController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self downLoadDataSource];

    [self addTableView];
}

- (void)addTableView
{
    [self.view addSubview:self.tableView];
    self.tableView.rowHeight = 100;
}

- (void)downLoadDataSource
{
 
    NSString * str = [CCZDownLoadUrl getSelectSeatURL];
    
    [HTTPTool GETWithURL:str params:nil succeed:^(id obj) {
        
        NSArray * JsonArr = [NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingMutableContainers error:nil];
        [JsonArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            CCZSelectSeatModel * model = [[CCZSelectSeatModel alloc] initWithDict:obj];
            [self.dataSource addObject:model];
            
        }];
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CCZSelectSeatCell * cell = [CCZSelectSeatCell selectSeatCellWithTableView:tableView];
    cell.moel = self.dataSource[indexPath.row];
    return cell;
}







@end
