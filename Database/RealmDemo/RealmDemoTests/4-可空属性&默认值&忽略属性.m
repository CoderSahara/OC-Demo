//
//  4-可空属性&默认值&忽略属性.m
//  RealmDemoTests
//
//  Created by Sahara on 2018/9/28.
//  Copyright © 2018年 Sahara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Cat.h"
@interface Properties : XCTestCase

@end

@implementation Properties

- (void)testNil {
    
    Cat *cat = [[Cat alloc] init];
    cat.a = 1;
//    cat.b = 2;
//    cat.c = @"sx";
    
//    NSString *createSql = @"create table stu(id integer primary key, sex text not null default value)";
    
    // 1. 获取realm对象
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    // 2. 开启写入事务
    [realm beginWriteTransaction];
    
    // 3. 执行修改动作
    [realm addObject:cat];
    
    // 4. 提交写入事务
    [realm commitWriteTransaction];
    
//    [realm transactionWithBlock:^{
//        [realm addObject:cat];
//    }];
}

@end
