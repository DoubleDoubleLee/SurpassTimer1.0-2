//
//  OrekiSetViewController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/27.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import "OrekiSetViewController.h"
#import "MineNoImagesCell.h"
#import "MineSet1Cell.h"
#import "MineSet2Cell.h"


@interface OrekiSetViewController ()

@end

@implementation OrekiSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self ready];
    
    [self createNavigationBar];
    
    [self createTableView];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}

-(void)ready
{
    self.dataSource = [NSMutableArray arrayWithContentsOfFile:[NSString stringWithFormat:@"%@/MineSet.plist",[[NSBundle mainBundle] resourcePath]]];
    
    NSLog(@"%@",self.dataSource);
    
}

-(void)createNavigationBar
{
    
    OrekiNavigationBar * ob = [OrekiNavigationBar BarType:BarTypeOfBack andWithController:self];
    
    ob.title.text = @"设置";
    
    [self.view addSubview:ob];
    
    
    
}

-(void)createTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, K_MainScreenWidth, K_MainScreenHeight-64)];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.bounces = NO;
    
    [self.view addSubview:self.tableView];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 30;
    }
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2)
    {
        return K_MainScreenHeight - 50 - 64 - 220;
    }

    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}
-(UIView * )tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K_MainScreenWidth, 30)];
        
        view.backgroundColor = [UIColor colorWithWhite:0.977 alpha:1];
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, K_MainScreenWidth-10, 20)];
        
        label.text = @"图片设置";
        
        label.font = [UIFont systemFontOfSize:12];
        
        label.textColor = [UIColor colorWithWhite:0.706 alpha:1];
        
        [view addSubview:label];
        
        return view;
    }
    
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%lu",(unsigned long)[[self.dataSource objectAtIndex:section] count]);
    return [[self.dataSource objectAtIndex:section] count];
}

-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellName = @"cell";
    if (indexPath.section == 0 || indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            MineSet1Cell * cell = [tableView dequeueReusableCellWithIdentifier:cellName];
            if (cell == nil)
            {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"MineSet1Cell" owner:self options:nil] lastObject];
            }
            cell.titleLabel.text = [[self.dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return  cell;
            
        }
        else
        {
        MineNoImagesCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MineNoImagesCell" owner:self options:nil] lastObject];
        }
        
            cell.title.text = [[self.dataSource objectAtIndex:0] objectAtIndex:indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        }
    }
    
    else
    {
        MineSet2Cell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MineSet2Cell" owner:self options:nil] lastObject];
        }
        NSArray * arr = [self.dataSource objectAtIndex:1];
        cell.titleLabel.text = [arr objectAtIndex:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    NSLog(@"免打扰模式");
                    break;
                case 1:
                    NSLog(@"广播退订");
                    break;
                case 2:
                    NSLog(@"通知管理");
                    break;
            }
            break;
        case 2:
            NSLog(@"清除缓存");
            break;
 
    }
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
