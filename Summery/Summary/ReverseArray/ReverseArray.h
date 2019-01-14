//
//  ReverseArray.h
//  Summery
//
//  Created by 路岗 on 2018/11/13.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReverseArray : NSObject

@property (nonatomic,strong)NSArray *a;
@property (nonatomic,strong)NSArray *b;

-(NSArray *)reverseArray : (NSArray *)oneArray another : (NSArray *)anotherArray;
@end

NS_ASSUME_NONNULL_END
