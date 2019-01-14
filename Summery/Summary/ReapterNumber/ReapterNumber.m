//
//  ReapterNumber.m
//  Summery
//
//  Created by 路岗 on 2018/11/13.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import "ReapterNumber.h"

@implementation ReapterNumber

-(int)findReapterNumber:(NSArray *)numberArray
{
    NSMutableDictionary *numberDic = [NSMutableDictionary new];
    for (NSNumber *number in numberArray) {
        if ([numberDic objectForKey:number]==nil) {
            [numberDic setObject:number forKey:number];
        }else{
            return [number intValue];
        }
    }
    return 0;
}
@end
