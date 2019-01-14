//
//  LGGKnowledgeModelManager.m
//  Summary
//
//  Created by 路岗 on 2018/11/20.
//  Copyright © 2018年 Gang. All rights reserved.
//
#import "LGGKnowledgeModelManager.h"
static LGGKnowledgeModelManager*_shareManager = nil;
@interface LGGKnowledgeModelManager()
@property (nonatomic,strong)NSMutableDictionary *modelMultiDic;
@end
@implementation LGGKnowledgeModelManager

+(instancetype)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManager = [[LGGKnowledgeModelManager alloc]init];
        _shareManager.modelMultiDic = [NSMutableDictionary new];
    });
    return _shareManager;
}
-(void)addModel:(LGGKnowledgeClassifyModel *)classModel{
    //查找所有数据
    if ([_modelMultiDic objectForKey:classModel.superClassification] != nil) {
        //插入新的数据
        //可变数组
        NSMutableArray *multiArray = [NSMutableArray arrayWithArray:[_modelMultiDic objectForKey:classModel.superClassification]];
        [multiArray addObject:[classModel copy]];
        [_modelMultiDic setObject:[NSArray arrayWithArray:multiArray]  forKey:classModel.superClassification];
    }else{
        //创建可变数组，插入
        NSMutableArray *multiArray = [NSMutableArray array];
        [multiArray addObject:[classModel copy]];
        [_modelMultiDic setObject:[NSArray arrayWithArray:multiArray] forKey:classModel.superClassification];
    }
    
}

-(NSArray<LGGKnowledgeClassifyModel *> *)subArrayWithClassifyKey:(NSString *)superClassify{
    return [[_modelMultiDic objectForKey:superClassify]copy];
}
-(NSArray *)sectionKeysArray{
    return [_modelMultiDic allKeys];
}
@end
