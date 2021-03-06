//
//  LocationViewController.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/24.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#define ios_version [[UIDevice currentDevice].systemVersion floatValue]
#define CITY_LOCAL @"http://api.m.mtime.cn/GetCityByLongitudelatitude.api?latitude=%@&longitude=%@"


#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "LocationViewController.h"
#import "CustomCell.h"
#import "heareView.h"
#import "GPSBackValue.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManager.h>
#import "LJCSHDownload.h"


@interface LocationViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate,UICollectionViewDelegateFlowLayout,CLLocationManagerDelegate>

{
    UITableView *_tableview;
    NSMutableArray *_dataSource;  //数据源
    UITextField *_textField;   //搜索条
    UICollectionView * _collectionView; //视图集合
    CLLocationManager * _localManager;
    UILabel * label;
    UILabel * Nowcityslb;
    
}
@property (nonatomic, strong) NSMutableDictionary *cities;
@property (nonatomic, strong) NSMutableArray *keys; //城市首字母
@property (nonatomic, strong) NSMutableArray *arrayCitys;   //城市数据
@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self  getCityData];
    
    [self createTableview];
    
    OrekiNavigationBar *ob = [OrekiNavigationBar BarType:BarTypeOfBack andWithController:self];
    ob.title.text = @"定位";
    [self.view addSubview:ob];
    self.view.backgroundColor=[UIColor whiteColor];
    //Locationviewcontroller
    
    [self prepareGPS];
    
    
    
    
    
    
}


+ (LocationViewController *)shareLocationViewController
{
    static LocationViewController * shareManager = nil;
    static dispatch_once_t predicted;
    dispatch_once(&predicted, ^{
        shareManager = [[self alloc] init];
    });
    return shareManager;
}


#pragma mark -------------定位服务代理

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    //得到当前位置
    CLLocation * current = locations.lastObject;
    
    
    
    CLGeocoder * geocoder = [[CLGeocoder alloc] init];
    CLLocation * location = [[CLLocation alloc] initWithLatitude:current.coordinate.latitude longitude:current.coordinate.longitude];
    
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%f",current.coordinate.latitude] forKey:@"latitude"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%f",current.coordinate.longitude] forKey:@"longitude"];
    
    
    
    [self jsonCity];
    //反向地理编码
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        
        for (CLPlacemark *mark in placemarks) {
            if (mark.locality.length>1) {
                
                
                Nowcityslb.text = mark.locality;
                
                [[NSUserDefaults standardUserDefaults] setObject:mark.locality forKey:@"city"];
                [_localManager stopUpdatingLocation];//关闭服务
                
            }
 
        }
    }];
    
    
    
}





-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_localManager startUpdatingLocation];//开启定位
    
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_localManager stopUpdatingLocation];//关闭服务
    
}



-(void)prepareGPS
{
    //创建定位管理
    if ([CLLocationManager locationServicesEnabled]) {
        _localManager = [[CLLocationManager alloc] init];
        //指定代理
        _localManager.delegate = self;
        
        _localManager.desiredAccuracy = kCLLocationAccuracyBest; //定位精度
        _localManager.distanceFilter = 1; // 位置过滤
        
        //授权
        if (ios_version>=8) {
            [_localManager requestWhenInUseAuthorization];
        }
        
        
    }
}



-(void)getCityData
{
    _dataSource=[[NSMutableArray alloc]init];
    NSString *path=[[NSBundle mainBundle] pathForResource:@"citydict" ofType:@"plist"];
    NSDictionary * dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *hostArr=@[@"上海",@"北京",@"深圳",@"重庆",@"广州",@"成都",@"东莞",@"武汉",@"杭州",@"天津",@"西安",@"扎兰屯"];
    [_dataSource addObject:hostArr];
     
    for (char a='A'; a<='Z'; a++) {
        if(a != 'O' && a !='I' && a !='V' && a !='U')
        {
            NSArray * arr = [dic objectForKey:[NSString stringWithFormat:@"%c",a]];
            [_dataSource addObject:arr];
         }
    }
    
    
}
//正向地理编码
-(void)zhengxiangbianma:(NSString *)name
{
    //获得地名
 
    if (!name || name.length<=0) {//没输入地名
        return;
    }
    
    [_textField resignFirstResponder];
    
    //iOS5之后使用
    CLGeocoder * geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:name completionHandler:^(NSArray *placemarks, NSError *error) {
        //CLPlacemark 描述位置相关信息
        for (CLPlacemark* mark in placemarks) {
            //取得坐标信息
            CLLocation * location = mark.location;
            CLLocationCoordinate2D coordinate = location.coordinate;
            NSLog(@"(%g,%g)",coordinate.latitude,coordinate.longitude);
            
            
            
            [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%f",coordinate.latitude] forKey:@"latitude"];
            [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%f",coordinate.longitude] forKey:@"longitude"];
            
            NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"latitude"]);
            
            [self jsonCity];
            
            
        }
    }];

}




-(void)createTableview
{
    
    _keys=[[NSMutableArray alloc]init];
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 64, K_MainScreenWidth-8-28, 30)];
    _textField.borderStyle=UITextBorderStyleRoundedRect;
    
    _textField.placeholder=@"输入城市名";
    _textField.textAlignment=NSTextAlignmentLeft;
    _textField.textColor=[UIColor grayColor];
    _textField.font=[UIFont systemFontOfSize:10];
    _textField.clearButtonMode=UITextFieldViewModeAlways;
    _textField.tag=10010;
    
    _textField.delegate=self;
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(6, 6, 15, 15)];
    imageview.image=[UIImage imageNamed:@"icon_magnifier"];
    _textField.leftView=imageview;
    
    _textField.leftViewMode=UITextFieldViewModeAlways;
    
 
    
    
    [self.view addSubview:_textField];
    
    UILabel *cityslable = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 80, 25)];
    cityslable.text=[NSString stringWithFormat:@"当前城市"];
    cityslable.font=[UIFont systemFontOfSize:16];
    cityslable.textColor=[UIColor colorWithWhite:0.706 alpha:1.000];
    
    Nowcityslb=[[UILabel alloc]initWithFrame:CGRectMake(90, 100, 80, 25)];
    
    NSString * string = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];
    if (string.length>2) {
        Nowcityslb.text = string;
    }else{
        
        Nowcityslb.text = @"定位中";
    }
    
    
    Nowcityslb.font=[UIFont systemFontOfSize:15];
    Nowcityslb.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:Nowcityslb];
    [self.view addSubview:cityslable];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    UICollectionViewFlowLayout *flowayout= [[UICollectionViewFlowLayout alloc]init];
    //设置滚动方向  //垂直
    flowayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    
    flowayout.itemSize=CGSizeMake(K_MainScreenWidth/5, 44);
    flowayout.minimumLineSpacing=3;
    flowayout.minimumInteritemSpacing=3;
    
    //上左下右
    flowayout.sectionInset=UIEdgeInsetsMake(0, 0, 0, 20);
    flowayout.headerReferenceSize=CGSizeMake(K_MainScreenWidth, 25);
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 135, K_MainScreenWidth, K_MainScreenHeight) collectionViewLayout:flowayout];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    //注册页眉
    [_collectionView registerClass:[heareView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [_collectionView registerClass:[CustomCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:_collectionView];
    
}







-(NSInteger )numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  _dataSource.count;
}







-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    NSArray *array=[_dataSource objectAtIndex:section];

    return array.count;
}







-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
     CustomCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
     cell.Cityslable.text=_dataSource[indexPath.section][indexPath.row];
    
    return cell;
}








//当textFiled检测到return被点击 委托代理 调用这个方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    
    [self zhengxiangbianma:textField.text];
    
    [textField resignFirstResponder];
    
 //   NSString *str=[[NSUserDefaults standardUserDefaults]objectForKey:@"cityID"];
    
    
    return YES;
}








//当textFile结束编辑 跳转
-(void)textFieldDidEndEditing:(UITextField *)textField
{
   
       _Textfiledstr=_textField.text;
    [[NSUserDefaults standardUserDefaults] setObject:_Textfiledstr forKey:@"city"];
    
    [self zhengxiangbianma:_Textfiledstr];
                                                   
    [self.navigationController popViewControllerAnimated:YES];
    
}







-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    heareView *view;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        NSArray *arr=@[@"  热门城市",@"  A",@"  B",@"  C",@"  D",@"  E",@"  F",@"  G",@"  H",@"  J",@"  K",@"  L",@"  M",@"  N",@"  P",@"  Q",@"  R",@"  S",@"  T",@"  W",@"  X",@"  Y",@"  Z"];
        
        view=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        view.lable.textAlignment=NSTextAlignmentLeft;
        view.lable.frame=CGRectMake(0, 0, K_MainScreenWidth, 25);
        view.lable.textColor=[UIColor colorWithWhite:0.706 alpha:1.000];
        if ([arr[indexPath.section] isEqualToString:@"  热门城市"]) {
            view.backgroundColor=[UIColor whiteColor];
        }else{
            view.backgroundColor=[UIColor colorWithWhite:0.933 alpha:1.000];
        }
        
        view.lable.font=[UIFont systemFontOfSize:18];
        view.lable.text=arr[indexPath.section];
        
    }
    
    return view;
}
//选中具体哪一个collectionview
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    _Textfiledstr=_dataSource[indexPath.section][indexPath.row];
   
    
    [self zhengxiangbianma:_Textfiledstr];
    
    
    [[NSUserDefaults standardUserDefaults] setObject:_Textfiledstr forKey:@"city"];
   
    
 
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
    
}





-(void)jsonCity
{
    NSString * latStr =[[NSUserDefaults standardUserDefaults] objectForKey:@"latitude"];
    NSString * lonStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"longitude"];
    NSString * cityNum = [NSString stringWithFormat:CITY_LOCAL,latStr,lonStr];
    
    
    
    [LJCSHDownload downloadDataWithType:LJCDownloadTypeGet Path:cityNum parameters:nil sucess:^(NSData *data) {
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        
        
        NSString * dateStr = dic[@"cityId"];
        
        [[NSUserDefaults standardUserDefaults] setObject:dateStr forKey:@"cityID"];
        
         
        
        self.block();
        
        
    } fail:^(NSError *error) {
        
    }];
    
    
}





@end
