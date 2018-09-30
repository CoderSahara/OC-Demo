//
//  7-数据库迁移.m
//  RealmDemoTests
//
//  Created by Sahara on 2018/9/29.
//  Copyright © 2018年 Sahara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "MigrationM.h"
@interface DataBaseMigration : XCTestCase
@end

@implementation DataBaseMigration

- (void)setUp {
    [super setUp];
    // 1. 获取默认配置
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    
    // 2. 叠加版本号(要比上一次的版本号搞) 0
    int newVersion = 2;
    config.schemaVersion = newVersion;
    
    // 3. 具体怎样迁移
    [config setMigrationBlock:^(RLMMigration * _Nonnull migration, uint64_t oldSchemaVersion) {
        if (oldSchemaVersion < newVersion) {
            NSLog(@"需要做迁移动作");
            // 无需做任何动作就可以完成 数据结构 以及 数据的迁移
            
            [migration enumerateObjects:@"MigrationM" block:^(RLMObject * _Nullable oldObject, RLMObject * _Nullable newObject) {
                
                // 执行更名操作
//                newObject[@"fullName2"] = oldObject[@"fullName"];
                [migration renamePropertyForClass:@"MigrationM" oldName:@"fullName" newName:@"fullName2"];
                
                // 把升级之前数据库字段根据一定规则,赋值给升级后的数据库的新字段
//                newObject[@"fullName"] = [NSString stringWithFormat:@"%@%@", oldObject[@"preName"], oldObject[@"lastName"]];
                
            }];
        }
    }];
    
    // 4. 让配置生效
    [RLMRealmConfiguration setDefaultConfiguration:config];
    
    // 如果需要,立即迁移
    [RLMRealm defaultRealm];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testExample {
//    MigrationM *model = [[MigrationM alloc] initWithValue:@{@"name": @"zhangsan",@"age":@18}];
    
    MigrationM *model = [[MigrationM alloc] init];
    model.age = 10;
//    model.preName2 = @"xx";
//    model.lastName = @"123";
    
    model.fullName2 = @"123456";
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:model];
    }];
}

@end
