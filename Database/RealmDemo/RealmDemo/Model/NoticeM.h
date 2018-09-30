//
//  NoticeM.h
//  RealmDemo
//
//  Created by Sahara on 2018/9/28.
//Copyright © 2018年 Sahara. All rights reserved.
//

#import <Realm/Realm.h>

@interface NoticeM : RLMObject

@property int a;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<NoticeM *><NoticeM>
RLM_ARRAY_TYPE(NoticeM)
