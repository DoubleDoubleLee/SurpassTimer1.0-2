//
//  DBManager.m
//  SurpassTimer
//
//  Created by qianfeng on 15/11/23.
//  Copyright © 2015年 Oreki. All rights reserved.
//

#import "DBManager.h"
#import "FMDatabase.h"
@implementation DBManager

{
    FMDatabase * _db;
}

+(id)shareDBManager
{
    static DBManager * manager = nil;
    if (manager == nil) {
        manager = [[DBManager alloc] init];
    }
    return manager;
}


-(instancetype)init
{
    self = [super init];
    if (self) {
        [self createDB];
    }
    return self;
}


-(void)createDB
{
    NSString * dbPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/app"];
    if (_db == nil) {
        _db = [FMDatabase databaseWithPath:dbPath];
    }
    BOOL sucess = [_db open];
    if (sucess) {
    }
    [_db close];
}

-(void)createTableWithName:(NSString *)name andTableWithColumn:(NSArray *)column
{
    [_db open];
    NSString * sql = [NSString stringWithFormat:@"create table if not exists%@(%@ text)",name,[column componentsJoinedByString:@" text,"]];
    BOOL sucess = [_db executeUpdate:sql];
    if (sucess) {
    }
    [_db close];
}


-(void)deleteTableWithName:(NSString *)name andWithIdentifier:(NSString *)identifier
{
    
    [_db open];
    NSString * sql = [NSString stringWithFormat:@"delete from %@ where %@ = ?",name,identifier];
    //@"delete from FoodList where ID = ?;";
    @synchronized(self) {
        BOOL sucess = [_db executeUpdate:sql,identifier];
        if (sucess) {
            
        }
    }
    [_db close];
}



-(NSArray *)selectAllItemWithName:(NSString *)name andWithColumn:(NSArray *)column
{
    [_db open];
    NSString * sql = [NSString stringWithFormat:@"select * from %@",name];
    //@"select * from FoodList;";
    FMResultSet * set = nil;
    @synchronized(self) {
        set = [_db executeQuery:sql];
    }
    NSMutableArray * array =[[NSMutableArray alloc] init];
    while (set.next) {
        NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
        
        for (NSString * s in column)
        {
            [dic setObject:[set stringForColumn:s] forKey:s];
        }
        
        //        [dic setObject:[set stringForColumn:@"ID"] forKey:@"ID"];
        //        [dic setObject:[set stringForColumn:@"thumb_2"] forKey:@"thumb_2"];
        //        [dic setObject:[set stringForColumn:@"title"] forKey:@"title"];
        [array addObject:dic];
    }
    [_db close];
    return array;
}

-(BOOL)searchMessageWithName:(NSString *)name andWithIdentifier:(NSString *)identifier
{
    [_db open];
    
    
    NSString * searchSql = [NSString stringWithFormat:@"select * from %@ where %@ = ?",name,identifier];
    // @"select * from FoodList where ID = ?;";
    FMResultSet * set = [_db executeQuery:searchSql,identifier];
    //    if (set.next == YES) {
    //        return nil;
    //    }
    
    //    NSString * sql = @"select * from FoodList where ID = ?;";
    //    FMResultSet * set = [_db executeQuery:sql,ID];
    
    
    [_db close];
    return set.next;
}


@end
