#import <XCTest/XCTest.h>
#import "StudentM.h"
@interface ModelOperation : XCTestCase
@end

@implementation ModelOperation
// 增
- (void)testAddExample {
//    StudentM *stu = [[StudentM alloc] initWithValue:@{@"num":@1, @"name":@"土豆"}];
    
    StudentM *stu = [[StudentM alloc] initWithValue: @[@2, @"地瓜"] ];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
//    // 开启事务
//    [realm beginWriteTransaction];
//
//    // 执行动作
//    [realm addObject:stu];
//
//    // 提交事务
//    [realm commitWriteTransaction];
    
    // 简便写法
    [realm transactionWithBlock:^{
//        [realm addObject:stu];
        
        // 没有就添加,有就更新
        [realm addOrUpdateObject:stu];
    }];
}

// 删
- (void)testDeleteExalmple {
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    // 删除的模型, 一定要是被 realm 管理的
    // 查找出StudentM表中 name = '土豆' 的 数据表
//    RLMResults *results = [StudentM objectsWhere:@"name = '土豆'"];
    
//    // 拿出搜索结果的第一个数据表对象
//    StudentM *stu = (StudentM *)results.firstObject;
//    // 执行事务
//    [realm transactionWithBlock:^{
//        // 删除一个数据表对象
//        [realm deleteObject:stu];
//    }];
    
//    // 执行事务
//    [realm transactionWithBlock:^{
//        // 删除一个数据表模型的数组集合
//        [realm deleteObjects:results];
//    }];
    
    // 删除某一种数据类型表的所有模型对象
    // 拿到对应数据表的所有模型对象
//    RLMResults *stuRes = [StudentM allObjects];
//    for (StudentM *stu in stuRes) {
//        [realm transactionWithBlock:^{
//            [realm deleteObject:stu];
//        }];
//    }
    
//    [realm deleteObjects:stuRes];
    
    
    // 根据主键删除一个模型
    // 1. 根据主键, 查询到这个模型(这个模型, 一定是被realm数据库管理的模型)
    StudentM *stuDel = [StudentM objectInRealm:realm forPrimaryKey:@2];
    
    // 2. 删除该模型
    // 执行事务
    [realm transactionWithBlock:^{
        
        [realm deleteObject:stuDel];
    }];
}

// 改
- (void)testUpdateExalmple {
    
//    StudentM *stu = [[StudentM alloc] initWithValue:@[@2, @"马铃薯"]];
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    // 方法1:
    // 这个模型stu, 已经被realm所管理, 并且已经和磁盘上对象的地址进行映射
//    [realm transactionWithBlock:^{
//        [realm addObject:stu];
//    }];
    
    // 这里修改的类型, 一定是被realmd所管理的模型
//    [realm transactionWithBlock:^{
//        stu.name = @"哮天犬在山边吃草";
//    }];
    
    // 方式2:
//    RLMResults *results = [StudentM objectsWhere:@"name = '哮天犬'"];
//    StudentM *stu2 = (StudentM *)results.firstObject;
//    [realm transactionWithBlock:^{
//        stu2.name = @"哮天犬真是2";
//    }];
    
    // 方式3:
    [realm transactionWithBlock:^{
        // 添加或更新
//        [realm addOrUpdateObject:stu];
        
        [StudentM createOrUpdateInRealm:realm withValue:@[@2, @"马铃薯是地瓜么?"]];
    }];
    
}

// 查
- (void)testQueryExalmple {
    
    // 1. 所有的查询 (包括查询和属性访问) 在 Realm 中都是延时加载的, 只有当属性被访问时, 才能够读取相对应的数据
    RLMResults *stuRes = [StudentM allObjects];
    NSLog(@"%@", stuRes);
    
    StudentM *stu = [[StudentM alloc] initWithValue:@[@4, @"土豆"]];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
//        [realm addObject:stu];
        
        [realm addOrUpdateObject:stu];
    }];
    
    NSLog(@"%@", stuRes);

}

- (void)testQuery2Exalmple {
    // 查找出 StudentM表模型 中所有 num > 1 的数据表对象
    RLMResults <StudentM *>*stus = [StudentM objectsWhere:@"num > 1"];
    NSLog(@"%@", stus);
    
    // 按照 name 进行升序或者降序排列
    RLMResults *sortRes = [stus sortedResultsUsingKeyPath:@"name" ascending:NO];
    NSLog(@"%@", sortRes);
    
    // 1. 把 stus 中 num > 2 的取出来
    RLMResults *subRes = [stus objectsWhere:@"num > 2"];
    // 2. 把 subRes 中 num > 3 的取出来
    [subRes objectsWhere:@"num > 3"];
    
    // sql
    // 第一个参数: 跳过几条
    // 第二个参数: 取几条
    // select * from stu limit 3,3;
    RLMResults *allObj = [StudentM allObjects];
    for (int i = 3; i < 6; i++) {
        StudentM *stu = allObj[i];
    }
}

@end
