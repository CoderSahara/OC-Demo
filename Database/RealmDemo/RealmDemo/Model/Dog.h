//
//  Dog.h
//  RealmDemo
//
//  Created by Sahara on 2018/9/28.
//Copyright © 2018年 Sahara. All rights reserved.
//

#import <Realm/Realm.h>
#import <UIKit/UIKit.h>
@interface Dog : RLMObject

@property int num;
@property NSString *name;
@property UIColor  *color;
@property NSString *colorStr;
@property (readonly) RLMLinkingObjects *master;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Dog *><Dog>
RLM_ARRAY_TYPE(Dog)
