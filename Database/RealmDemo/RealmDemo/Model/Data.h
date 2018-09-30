//
//  Data.h
//  RealmDemo
//
//  Created by Sahara on 2018/9/28.
//Copyright © 2018年 Sahara. All rights reserved.
//

#import <Realm/Realm.h>

@interface Data : RLMObject

@property int a;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Data *><Data>
RLM_ARRAY_TYPE(Data)
