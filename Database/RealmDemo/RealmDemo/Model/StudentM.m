//
//  StudentM.m
//  RealmDemo
//
//  Created by Sahara on 2018/9/27.
//  Copyright © 2018年 Sahara. All rights reserved.
//

#import "StudentM.h"

@implementation StudentM

// 设置主键
+ (NSString *)primaryKey {
    return @"num";
}

- (UIImage *)image {
    return [UIImage imageWithData:self.imageData];
}


// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
