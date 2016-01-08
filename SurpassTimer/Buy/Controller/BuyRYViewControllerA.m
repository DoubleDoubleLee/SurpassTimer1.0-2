//
//  BuyRYViewControllerA.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/27.
//  Copyright © 2015年 L-J-C. All rights reserved.
//
//网友短评
#define PingLun_URL @"http://api.m.mtime.cn/Movie/HotLongComments.api?movieId=%@&pageIndex=0"

//精彩影评
//http://api.m.mtime.cn/Movie/HotLongComments.api?movieId=221682&pageIndex=1


//电影相关
//http://api.m.mtime.cn/Showtime/MovieDetail.api?locationId=290&movieId=221682

//一万张图片
//http://api.m.mtime.cn/Movie/ImageAll.api?movieId=221682


#import "BuyRYViewControllerA.h"
#import "BuyMaoBoLiImageView.h"
#import "ReYIngAHeaderView.h"
#import "BuyRYACell.h"
#import "BuyRYBCell.h"
#import "BuyRYCCell.h"
#import "ShangYingAHeaderView.h"
#import "Macro.h"
#import "LoginVC.h"
#import "Help.h"
#import "WBHttpRequest+WeiboShare.h"
#import "WBHttpRequest.h"


@interface BuyRYViewControllerA ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    OrekiNavigationBar * ob;
    UITableView * _tableView;
    NSMutableArray * _dataSource;
    ReYIngAHeaderView * headView;
    UIButton * reYingButton;
    UIButton * shangYingButton;
    ShangYingAHeaderView * headViewS;
}
@end

@implementation BuyRYViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    
    [self createTableView];
    
    
    ob = [OrekiNavigationBar BarType:BarTypeOfCollect andWithController:self];
    ob.backgroundColor = [UIColor clearColor];
    [self.view addSubview:ob];
    
    [self createBlock];
    
    [self createDataSource];
}



-(void)createBlock
{

    
    ob.block = ^(){
        
        NSString *access_token = [[NSUserDefaults standardUserDefaults] objectForKey:ACCESS_TOKEN];
        NSString * remind_in =[[NSUserDefaults standardUserDefaults] objectForKey:REMIND_IN];
        
        
        
        if (access_token == nil || [Help isExpired] || remind_in == nil) {
            
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"温馨提醒您" message:@"您的新浪微博登陆状态有误请确认重新登录" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                
                
                [self pushLogin];
            }];
            UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action1];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
        else
        {
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确认分享到新浪微博吗？" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self shareHttp:remind_in token:access_token];
            }];
            UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action1];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
            
            
        }

        
        
    };
}


-(void)pushLogin
{
    LoginVC *loginVC = [[LoginVC alloc] initWithNibName:@"LoginVC" bundle:nil];
    [self.navigationController pushViewController:loginVC animated:YES];
}


-(void)shareHttp:(NSString *)remind_in token:(NSString *)access_token
{
    [WBHttpRequest requestForRepostAStatus:remind_in repostText:[NSString stringWithFormat:@"我们一起来看%@吧！",_dic[@"title"]] withAccessToken:access_token andOtherProperties:nil queue:nil withCompletionHandler:^(WBHttpRequest *httpRequest, id result, NSError *error) {
        
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"恭喜您" message:@"分享到新浪微博成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        
    }];
}


-(void)createTableView
{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.bounces = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    //向tableView注册一个cell类
    
    
    UINib * nib = [UINib nibWithNibName:@"BuyRYACell" bundle:[NSBundle mainBundle]];
    [_tableView registerNib:nib forCellReuseIdentifier:@"cellA"];
    
    UINib * nib2 = [UINib nibWithNibName:@"BuyRYBCell" bundle:[NSBundle mainBundle]];
    [_tableView registerNib:nib2 forCellReuseIdentifier:@"cellB"];
    
    
    
    if (![_isTwoPage isEqualToString:[NSString stringWithFormat:@"ok"]]) {
        
        
        
        
        headView = [[ReYIngAHeaderView alloc] initWithFrame:CGRectMake(0, 0, K_MainScreenWidth, 350) withBGDIC:_dic];
        reYingButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 260, K_MainScreenWidth-40, 35)];
        reYingButton.backgroundColor = [UIColor colorWithRed:1.000 green:0.451 blue:0.000 alpha:1.000];
        
        reYingButton.layer.cornerRadius = 15;
        reYingButton.layer.masksToBounds = YES;
        [reYingButton setTitle:@"正在热映" forState:UIControlStateNormal];
        
        
        
        UIImageView * line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 298, K_MainScreenWidth, 2)];
        line.backgroundColor  = [UIColor colorWithRed:1.000 green:0.451 blue:0.000 alpha:1.000];
        [headView addSubview:line];
        
        [headView addSubview:reYingButton];
        
        
        _tableView.tableHeaderView =headView;
    }else
    {
        headViewS = [[ShangYingAHeaderView alloc] initWithFrame:CGRectMake(0, 0, K_MainScreenWidth, 350) withBGDIC:_dic];
        shangYingButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 260, K_MainScreenWidth-40, 35)];
        shangYingButton.backgroundColor = [UIColor colorWithRed:1.000 green:0.451 blue:0.000 alpha:1.000];
        
        shangYingButton.layer.cornerRadius = 15;
        shangYingButton.layer.masksToBounds = YES;
        [shangYingButton setTitle:@"即将上映" forState:UIControlStateNormal];
        
        
        
        UIImageView * line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 298, K_MainScreenWidth, 2)];
        line.backgroundColor  = [UIColor colorWithRed:1.000 green:0.451 blue:0.000 alpha:1.000];
        [headViewS addSubview:line];
        
        [headViewS addSubview:shangYingButton];
        _tableView.tableHeaderView =headViewS;

    }
    
    
    
    
    
    
    
}








-(void)createDataSource
{
    
   
    
    
     _dataSource = [[NSMutableArray alloc] init];
    NSString * path = [NSString stringWithFormat:PingLun_URL,_dic[@"id"]];
    
    
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:path parameters:nil sucess:^(NSData *data) {
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray * arr = dic[@"comments"];
        
        for (NSDictionary * dicc in arr) {
            [_dataSource addObject:dicc];
        }
        [_tableView reloadData];
        
    } fail:^(NSError *error) {
        
    }];
    
}




-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_tableView.contentOffset.y<100) {
        
        float f = _tableView.contentOffset.y/100.0;
        
        ob.backgroundColor = [UIColor colorWithRed:0.137 green:0.725 blue:1.000 alpha:f];
        
    }
    else{
        ob.backgroundColor = [UIColor colorWithRed:0.137 green:0.725 blue:1.000 alpha:1];
    }
    
    
    

    
    
    
}







-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        BuyRYACell * cell =[tableView dequeueReusableCellWithIdentifier:@"cellA" forIndexPath:indexPath];
        [cell createUI:_dic[@"id"]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    else if (indexPath.row == 1){
    
        BuyRYBCell* cell =[tableView dequeueReusableCellWithIdentifier:@"cellB" forIndexPath:indexPath];
        [cell createUI:_dic[@"id"]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    else if (indexPath.row == 2){
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellC"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellC"];
        }
        cell.textLabel.text = @"网友评论";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    else
    {
        BuyRYCCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellD"];
        
        if (!cell) {
            cell = [[BuyRYCCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellD"];
        }
        [cell prepareUI:_dataSource[indexPath.row]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 120;
    }
    else if (indexPath.row == 1){
        return 200;
    }
    else if (indexPath.row == 2){
        return 30;
    }
    else
    {
        
        NSDictionary *dic = _dataSource[indexPath.row];
        NSString * detailStr = dic[@"content"];
        NSDictionary * detailAttribute =@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14]};

        CGSize detailSize = [detailStr sizeWithAttributes:detailAttribute];
        CGFloat f = (detailSize.width+100)/(K_MainScreenWidth-70)*20+55;
        
        return f;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
    
}



-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
}



@end
