//
//  DBManager.h
//  SurpassTimer
//
//  Created by qianfeng on 15/11/23.
//  Copyright © 2015年 Oreki. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DBManagerDelegate <NSObject>

-(void)insertTabele;

@end

@interface DBManager : NSObject

@property (nonatomic,weak) id<DBManagerDelegate> delegate;

+(id)shareDBManager;

/**
 *  创建表的方法
 *
 *  @param name   表名
 *  @param column 表的属性
 */
-(void)createTableWithName:(NSString *)name andTableWithColumn:(NSArray *)column;

/**
 *  删除某表的数据
 *
 *  @param name       表名
 *  @param identifier 删除标识符，表的任意唯一属性
 */
-(void)deleteTableWithName:(NSString *)name andWithIdentifier:(NSString *)identifier;

/**
 *  查询某表的某数据
 *
 *  @param name       表名
 *  @param identifier 要查询的数据名
 *
 */
-(BOOL)searchMessageWithName:(NSString *)name andWithIdentifier:(NSString *)identifier;

/**
 *  查询某表的所有数据
 *
 *  @param name   表名
 *  @param column 该表的所有属性名
 *
 *  @return 该表的所有数据
 */
-(NSArray *)selectAllItemWithName:(NSString *)name andWithColumn:(NSArray *)column;
@end
