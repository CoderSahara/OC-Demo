//
//  StudentM.h
//  RealmDemo
//
//  Created by Sahara on 2018/9/27.
//Copyright © 2018年 Sahara. All rights reserved.
//

#import <Realm/Realm.h>
#import <UIKit/UIKit.h>
#import "PenM.h"

@interface StudentM : RLMObject

@property int num;
@property NSString *name;
@property (readonly) UIImage *image;
@property NSData *imageData;
//@property NSArray <NSString *>*arrays2;
// RLMArray 这个数组,里面存储的属性 必须是 继承自 RLMObject 类型的属性
@property RLMArray <PenM *><PenM>*arrays;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<StudentM *><StudentM>
RLM_ARRAY_TYPE(StudentM)
