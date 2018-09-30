//
//  PenM.h
//  RealmDemo
//
//  Created by Sahara on 2018/9/27.
//Copyright © 2018年 Sahara. All rights reserved.
//

#import <Realm/Realm.h>
#import <UIKit/UIKit.h>
@interface PenM : RLMObject

@property UIColor  *color;
@property NSString *colorStr;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<PenM *><PenM>
RLM_ARRAY_TYPE(PenM)
