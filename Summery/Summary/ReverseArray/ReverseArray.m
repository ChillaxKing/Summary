//
//  ReverseArray.m
//  Summery
//
//  Created by 路岗 on 2018/11/13.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import "ReverseArray.h"

@implementation ReverseArray

-(NSArray *)reverseArray:(NSArray *)oneArray another:(NSArray *)anotherArray
{
    
    NSMutableArray *resultArray = [NSMutableArray new];
  
    NSUInteger indexOne = oneArray.count-1,
              indexAnother = anotherArray.count-1;
    
    while (true) {
        NSNumber *tmpOne = indexOne
        !=NSUIntegerMax&&oneArray.count!=0?oneArray[indexOne]:@NSIntegerMin;
        NSNumber *tmpAnother = indexAnother
        !=NSUIntegerMax &&anotherArray.count!=0?anotherArray[indexAnother]:@NSIntegerMin;
        if ([tmpOne integerValue]>=[tmpAnother integerValue]) {
            [resultArray addObject:tmpOne];
            if (indexOne>0) {
                indexOne--;
            }else{
                indexOne = NSUIntegerMax;
            }
        }else{
            [resultArray addObject:tmpAnother];
            if (indexAnother>0) {
                indexAnother--;
            }else{
                indexAnother = NSUIntegerMax;
            }
        }
        if (resultArray.count == oneArray.count+anotherArray.count) {
            break;
        }
        
    }
    return [resultArray copy];
}
@end
