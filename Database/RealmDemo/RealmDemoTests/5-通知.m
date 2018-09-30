//
//  5-通知.m
//  RealmDemoTests
//
//  Created by Sahara on 2018/9/28.
//  Copyright © 2018年 Sahara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "NoticeM.h"

@interface NoticeTest : XCTestCase

@property (nonatomic, strong) RLMNotificationToken *token;
@property (nonatomic, strong) RLMNotificationToken *token2;

@end

@implementation NoticeTest

- (void)setUp {
    [super setUp];
    
//    RLMRealm *realm = [RLMRealm defaultRealm];
//    self.token = [realm addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
//        NSLog(@"监听到修改通知");
//    }];
    
    RLMResults *results = [NoticeM allObjects];
    self.token2 = [results addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
        
        NSLog(@"results:\n%@\nchange:\n%@\nerror:\n%@", results, change, error);
    }];
}

- (void)tearDown {
    [self.token invalidate];
    [self.token2 invalidate];
    [super tearDown];
}

- (void)testExample {
    
    NoticeM *model = [[NoticeM alloc] initWithValue:@{@"a" : @2}];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:model];
    }];
    
    [realm transactionWithBlock:^{
        [realm addObject:model];
    }];

    [realm transactionWithBlock:^{
        [realm deleteObject:model];
    }];
}

@end
