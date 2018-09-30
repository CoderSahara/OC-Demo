//
//  2-支持的数据类型.m
//  RealmDemoTests
//
//  Created by Sahara on 2018/9/27.
//  Copyright © 2018年 Sahara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StudentM.h"
@interface SupportType : XCTestCase

@end

@implementation SupportType

- (void)testExample {
    
    StudentM *stu = [[StudentM alloc] init];
    stu.num = 2;
    stu.name = @"小明";
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    stu.imageData = data;
//    stu.image = [UIImage imageNamed:@"1.png"];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
//        [realm addObject:stu];
        
        [realm addOrUpdateObject:stu];
    }];
}


@end
