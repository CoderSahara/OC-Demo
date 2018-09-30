//
//  MigrationM.h
//  RealmDemo
//
//  Created by Sahara on 2018/9/29.
//Copyright © 2018年 Sahara. All rights reserved.
//

#import <Realm/Realm.h>

@interface MigrationM : RLMObject

@property NSString *name;
@property int age;
//@property NSString *preName;
//@property NSString *lastName;
//@property NSString *fullName;
@property NSString *fullName2;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<MigrationM *><MigrationM>
RLM_ARRAY_TYPE(MigrationM)
