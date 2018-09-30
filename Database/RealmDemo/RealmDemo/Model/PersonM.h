//
//  PersonM.h
//  RealmDemo
//
//  Created by Sahara on 2018/9/28.
//Copyright © 2018年 Sahara. All rights reserved.
//

#import <Realm/Realm.h>
#import "Dog.h"
@interface PersonM : RLMObject

@property int num;
@property NSString *name;
//@property Dog *pet;
@property RLMArray <Dog *><Dog> *pets;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<PersonM *><PersonM>
RLM_ARRAY_TYPE(PersonM)
