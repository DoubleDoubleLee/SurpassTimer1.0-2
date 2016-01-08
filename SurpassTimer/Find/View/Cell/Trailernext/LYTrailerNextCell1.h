//
//  LYTrailerNextCell1.h
//  SurpassTimer
//
//  Created by qianfeng on 15/11/29.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYTrailerNextCell1 : UITableViewCell
//@property (weak, nonatomic) IBOutlet UIImageView *yuanImage; //圆
@property (weak, nonatomic) IBOutlet UIImageView *yuanImage;
@property (weak, nonatomic) IBOutlet UILabel *cellRankNum;
@property (weak, nonatomic) IBOutlet UIImageView *cellposterUrlimage;
@property (weak, nonatomic) IBOutlet UILabel *cellname;
@property (weak, nonatomic) IBOutlet UILabel *cellnameEN;
@property (weak, nonatomic) IBOutlet UILabel *celldirector;
@property (weak, nonatomic) IBOutlet UILabel *cellactor;
@property (weak, nonatomic) IBOutlet UILabel *cellreleaseDate;

//@property (weak, nonatomic) IBOutlet UIImageView *cellposterUrlimage;//图

//@property (weak, nonatomic) IBOutlet UILabel *cellname;//电影名

//@property (weak, nonatomic) IBOutlet UILabel *cellnameEN;
@property (weak, nonatomic) IBOutlet UILabel *cellrating;

//@property (weak, nonatomic) IBOutlet UILabel *celldirector;//导演

@property (weak, nonatomic) IBOutlet UILabel *cellSubBack;
//
//@property (weak, nonatomic) IBOutlet UILabel *cellactor;//主演

//
//@property (weak, nonatomic) IBOutlet UILabel *cellreleaseDate;//上映日期 +国籍
//
//@property (weak, nonatomic) IBOutlet UIImageView *cellBack;
//
//@property (weak, nonatomic) IBOutlet UIImageView *cellSubBack;//评分的北京
//@property (weak, nonatomic) IBOutlet UILabel *cellrating;//评分

//@property (weak, nonatomic) IBOutlet UILabel *cellremark;//电影描述









@property(nonatomic,strong)UILabel *cellremark;

//@property (weak, nonatomic) IBOutlet UILabel *cellRankNum;//电影排行



@end
