//
//  LGGKnowledgeClassifyModel.h
//  Summary
//
//  Created by 路岗 on 2018/11/20.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGGKnowledgeClassifyModel : NSObject<NSCopying>
//知识点分类,属于哪个知识点,如果属于第一级分类，传nil
@property (nonatomic,copy,readonly)NSString* superClassification;

//知识点名称
@property (nonatomic,copy,readonly)NSString *title;
//知识点类
@property (nonatomic,copy,readonly)NSString *className;

-(instancetype)initWithSuperClassify:(NSString *)superClassify withTitle:(NSString*)title withClassName:(NSString *)className;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
