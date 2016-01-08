//
//  MineViewController.m
//  HandForLOLForMe
//
//  Created by 陈曹振 on 15/11/23.
//  Copyright © 2015年 ccz. All rights reserved.
//
#define urllllll @"https://api.weibo.com/2/users/show.json?access_token=%@&uid=%@"
#import "MineViewController.h"
#import "MineCell.h"
#import "MineNoImagesCell.h"
#import "OrekiHeadView.h"
#import "OrekiSetViewController.h"
#import "MyCollectViewController.h"
#import "MyMovieViewController.h"
#import "LoginVC.h"
#import "Macro.h"

@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIButton * login;
    UIImageView * headImageView;
}

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self ready];
    [self createTableView];

}

-(void)ready
{
    self.dataSource = [NSMutableArray arrayWithContentsOfFile:[NSString stringWithFormat:@"%@/Mine.plist",[[NSBundle mainBundle] resourcePath]]];
    NSLog(@"%@",self.dataSource);
}

-(void)createTableView
{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -20, K_MainScreenWidth, K_MainScreenHeight)];

    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    self.tableView.tableHeaderView = [self createTableHeadView];
    
    UIView * nilFootView = [[UIView alloc]init];
    
    self.tableView.tableFooterView = nilFootView;
    
    [self.view addSubview:self.tableView];
}

-(UIView *)createTableHeadView
{
    OrekiHeadView * oh = [[OrekiHeadView alloc]init];
    
    _headImage = [UIImage imageNamed:@"tx.jpg"];
    
    headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 25, 100, 100)];
    
    headImageView.layer.cornerRadius = 50;
    headImageView.layer.masksToBounds = YES;
    
    headImageView.image = _headImage;
    
    login = [UIButton buttonWithType:UIButtonTypeCustom];
    
    login.frame = CGRectMake(CGRectGetMaxX(headImageView.frame)+40, 60, 120, 30);
    
    [login setBackgroundImage:[UIImage imageNamed:@"icon_button_buy_ticket"] forState:UIControlStateNormal];
    
    [login setTitle:@"使用新浪微博登陆" forState:UIControlStateNormal];
    
    login.titleLabel.textColor = [UIColor whiteColor];
    
    login.titleLabel.font = [UIFont systemFontOfSize:12];
    
    [login addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    [oh addSubview:login];
    
    [oh addSubview:headImageView];

    return oh;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.dataSource objectAtIndex:section] count];
}

-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cell";
//    if (indexPath.section == 0) {
//        MineCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
//        if(cell == nil)
//        {
//            cell = [[[NSBundle mainBundle] loadNibNamed:@"MineCell" owner:self options:nil] lastObject];
//        }
//        
//        NSDictionary * dic = [[self.dataSource objectAtIndex:0] objectAtIndex:indexPath.row];
//        cell.image.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
//        cell.title.text = [dic objectForKey:@"title"];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }
//
//    else
//    {
        MineNoImagesCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MineNoImagesCell" owner:self options:nil] lastObject];
        }
        NSArray * arr = [self.dataSource objectAtIndex:0];
        cell.title.text = [arr objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
//    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 400) {
        
        self.tableView.bounces = NO;
    }
    else
    {
        self.tableView.bounces = YES;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            NSLog(@"我的电影");
            
            MyMovieViewController * mmvc = [MyMovieViewController shareMyMovieViewController];
            
            [self.navigationController pushViewController:mmvc animated:YES];
            
            
        }
        else
        {
            NSLog(@"我的收藏");
            
            MyCollectViewController * mcvc = [MyCollectViewController shareMyCollectViewController];
            [self.navigationController pushViewController:mcvc animated:YES];
        }
    }
    else
    {
            ErWeiMaViewControllViewController * erwei = [[ErWeiMaViewControllViewController alloc]init];
            [self.navigationController pushViewController:erwei animated:YES];
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.f;
}



-(void)login:(UIButton*)btn
{
   // NSLog(@"登陆");
    LoginVC * mlogin = [[LoginVC alloc] initWithNibName:@"LoginVC" bundle:nil];
    [self.navigationController pushViewController:mlogin animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSString *access_token = [[NSUserDefaults standardUserDefaults] objectForKey:ACCESS_TOKEN];
    NSString * uidd =[[NSUserDefaults standardUserDefaults] objectForKey:UID];
    
    
    // NSString * path = @"https://api.weibo.com/2/users/show.json?access_token=%@&uid=%@";
    NSString * pathh = [NSString stringWithFormat:urllllll,access_token,uidd];
    
   // NSLog(@"---------------%@",pathh);
    
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:pathh parameters:nil sucess:^(NSData *data) {
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSString * userName = dict[@"name"];
        NSString * userImage = dict[@"profile_image_url"];
        [login setTitle:userName forState:UIControlStateNormal];
        
        [headImageView sd_setImageWithURL:[NSURL URLWithString:userImage] placeholderImage:[UIImage imageNamed:@"icon_button_buy_ticket"]];
        
        
    } fail:^(NSError *error) {
        
    }];
    
    
    
}

@end
