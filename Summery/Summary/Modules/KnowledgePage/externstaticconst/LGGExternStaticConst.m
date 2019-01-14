//
//  LGGExternStaticConst.m
//  Summary
//
//  Created by 路岗 on 2018/11/20.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import "LGGExternStaticConst.h"
NSString * const constVar = @"constvar";

NSString const *constvara = @"constvara";
@implementation LGGExternStaticConst
- (void)constUse{
    NSString *var = [NSString stringWithFormat:@"aa"];
    NSLog(@"%@",constVar);
    
    NSLog(@"%p",constvara);
    constvara = var;
    NSLog(@"%p",constvara);
    
}
- (void)staticUse{
    
}
- (void)externUse{
    
}
@end
