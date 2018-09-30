//
//  Cat.h
//  RealmDemo
//
//  Created by Sahara on 2018/9/28.
//Copyright © 2018年 Sahara. All rights reserved.
//

#import <Realm/Realm.h>

@interface Cat : RLMObject

@property int a;
@property int b;
@property NSString *c;
@property NSTimeInterval time;
// 重用价值非常高
//@property (readonly) NSString *timeFormat;
// 格式化的时间, 弱业务逻辑

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Cat *><Cat>
RLM_ARRAY_TYPE(Cat)
