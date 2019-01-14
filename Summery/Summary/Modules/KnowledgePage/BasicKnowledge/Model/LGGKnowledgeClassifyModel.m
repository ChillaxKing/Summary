//
//  LGGKnowledgeClassifyModel.m
//  Summary
//
//  Created by 路岗 on 2018/11/20.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import "LGGKnowledgeClassifyModel.h"

@implementation LGGKnowledgeClassifyModel
-(instancetype)initWithSuperClassify:(NSString *)superClassify withTitle:(NSString *)title withClassName:(NSString *)className{
    
    self = [super init];
    if (self) {
        _superClassification = [superClassify copy];
        _title = [title copy];
        _className = [className copy];
    }
    
    return self;
}
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    LGGKnowledgeClassifyModel *model = [LGGKnowledgeClassifyModel new];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}
-(id)copyWithZone:(NSZone *)zone{
    typeof(self) newModel = [[[self class]alloc]initWithSuperClassify:_superClassification withTitle:_title withClassName:_className];
    return newModel;
}

@end
