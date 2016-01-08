//
//  BuyHelp.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/26.
//  Copyright © 2015年 L-J-C. All rights reserved.
//

#define CITY_LOCAL @"http://api.m.mtime.cn/GetCityByLongitudelatitude.api?latitude=%@&longitude=%@"


#import "BuyHelp.h"
#import "LJCSHDownload.h"


#import "BuyReYingViewController.h"

@implementation BuyHelp


+(NSArray *)monthSelect:(NSArray *)arr
{

    
    NSMutableArray * dictionary = [[NSMutableArray alloc] init];
    
        NSDictionary * dic = arr[0];
    NSDictionary * dic2 = [arr lastObject];
    
    
        
        NSString *  str = [NSString stringWithFormat:@"%@",dic[@"rMonth"]];
    NSString * str2 = [NSString stringWithFormat:@"%@",dic2[@"rMonth"]];
    
    int k = 0;
    if ([str intValue]<[str2 intValue]) {
        k = [str intValue] - [str2 intValue] + 1;
    }
    else{
        k = [str2 intValue] + 12 - [str intValue] + 1;
    }
        
        for (int i = [str intValue]; i<k+[str intValue]; i++) {
            NSMutableArray * muArr = [[NSMutableArray alloc] init];
            
   
            
            for (NSDictionary * dicc in arr) {
                int j;
                if (i>12) {
                    j = i-12;
                   }
                else{
                    j=i;
                }
                    
  
                
                if ([[NSString stringWithFormat:@"%@",dicc[@"rMonth"]]isEqualToString:[NSString stringWithFormat:@"%d",j]]) {
   
                    [muArr addObject:dicc];
                    
                }
            }
            
            [dictionary addObject:muArr];
        }
    
    return dictionary;
}



+(NSString *)priceString:(NSString *)price
{
   
    NSMutableString * muStr = [[NSMutableString alloc] initWithFormat:@"%@",price ];
    
     
    if (muStr.length>3) {
         NSString * str = [muStr substringToIndex:2];
        return str;
    }
    else
    {
        return muStr;
    }
   
    
    
}













@end
