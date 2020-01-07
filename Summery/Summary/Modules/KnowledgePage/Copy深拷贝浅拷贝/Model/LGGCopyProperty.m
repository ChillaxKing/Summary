//
//  LGGCopyProperty.m
//  Summary
//
//  Created by 路岗 on 08/12/2019.
//  Copyright © 2019 Gang. All rights reserved.
//
#import <Foundation/Foundation.h>

#import "LGGCopyProperty.h"
@interface LGGCopyProperty()
@property(nonatomic, copy) NSMutableString  *multString;
@end
@implementation LGGCopyProperty
- (void)copyTest {
    NSMutableString *mutableStr = [NSMutableString stringWithFormat:@"可变的字符"];
    
       _multString = mutableStr;
       [self.multString appendFormat:@"aa"];
}
@end
