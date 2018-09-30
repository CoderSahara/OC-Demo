//
//  6-数据库操作.m
//  RealmDemoTests

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "Data.h"
@interface DataBase : XCTestCase 
@end

@implementation DataBase

// 多个数据库
- (void)testExample {
    
    [self setDefaultRealmForUser:@"zhangsan"];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    Data *data = [Data new];
    data.a = 10;
    [realm transactionWithBlock:^{
        [realm addObject:data];
    }];
    
    
    [self setDefaultRealmForUser:@"lis"];
    
    RLMRealm *realm2 = [RLMRealm defaultRealm];
    
    Data *data2 = [Data new];
    data2.a = 11;
    [realm2 transactionWithBlock:^{
        [realm2 addObject:data2];
    }];
    
}

- (void)setDefaultRealmForUser:(NSString *)username {
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    // 使用默认的目录, 但是使用用户名来替换默认的文件名
    config.fileURL = [[[config.fileURL URLByDeletingLastPathComponent] URLByAppendingPathComponent:username] URLByAppendingPathExtension:@"realm"];
    // 将这个配置应用到默认的 Realm 数据库当中
    [RLMRealmConfiguration setDefaultConfiguration:config];
}

// 只读的数据库
- (void)testReadOnly {
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    // 以只读模式打开文件, 因为应用数据包并不可写
    config.readOnly = YES;
    
    [RLMRealmConfiguration setDefaultConfiguration:config];
    
    // 通过配置打开 Realm 数据库
    RLMRealm *realm = [RLMRealm defaultRealm];
    // 从打包的 Realm 数据库中读取某些数据
    
    Data *data2 = [Data new];
    data2.a = 11;
    [realm transactionWithBlock:^{
        [realm addObject:data2];
    }];
}

// 删除数据库
- (void)testDeleteDataBase {
    
    NSFileManager *manager = [NSFileManager defaultManager];
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    NSArray <NSURL *>* realmFileURLs = @[
                                         config.fileURL,
                                         [config.fileURL URLByAppendingPathExtension:@"lock"],
                                         [config.fileURL URLByAppendingPathExtension:@"log_a"],
                                         [config.fileURL URLByAppendingPathExtension:@"log_b"],
                                         [config.fileURL URLByAppendingPathExtension:@"note"]
                                         ];
    
    for (NSURL *URL in realmFileURLs) {
        NSError *error = nil;
        [manager removeItemAtURL:URL error:&error];
        if (error) {
            // 错误处理
        }
    }
}

@end
