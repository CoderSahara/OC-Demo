//
//  3-关系.m
//  RealmDemoTests
//
//  Created by Sahara on 2018/9/27.
//  Copyright © 2018年 Sahara. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PersonM.h"
@interface Relation : XCTestCase

@end

@implementation Relation

- (void)testExample {
    
//    PersonM *p = [[PersonM alloc] init];
//    p.num = 1;
//    p.name = @"小王";
//
//    Dog *pet = [[Dog alloc] init];
//    pet.num = 1;
//    pet.name = @"哮天犬";
//    pet.color = [UIColor blackColor];
//
//    Dog *pet2 = [[Dog alloc] init];
//    pet2.num = 2;
//    pet2.name = @"小犬犬";
//    pet2.color = [UIColor yellowColor];
//
//    [p.pets addObject:pet];
//    [p.pets addObject:pet2];
//
//    RLMRealm *realm = [RLMRealm defaultRealm];
//    [realm transactionWithBlock:^{
//        [realm addObject:p];
//    }];
    
    PersonM *pp = [PersonM allObjects].firstObject;
    NSLog(@"%@",pp.pets.firstObject.master);
    
}


@end
