//
//  LGGKnowledgeModelManager.h
//  Summary
//
//  Created by 路岗 on 2018/11/20.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LGGKnowledgeClassifyModel;
NS_ASSUME_NONNULL_BEGIN

@interface LGGKnowledgeModelManager : NSObject
//section分类
@property(nonatomic,copy,readonly)NSArray*sectionKeysArray;
@property(nonatomic, strong,readonly) NSString *aatest;
+(instancetype)shareManager;
//新的知识点加入时，第一级tableview使用该modelh初始化层级
-(void)addModel:(LGGKnowledgeClassifyModel*)classModel;
-(NSArray<LGGKnowledgeClassifyModel*>*)subArrayWithClassifyKey:(NSString *)superClassify;
@end

NS_ASSUME_NONNULL_END
