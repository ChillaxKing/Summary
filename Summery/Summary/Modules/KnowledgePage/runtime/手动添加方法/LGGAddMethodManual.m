//
//  LGGAddMethodManual.m
//  Summary
//
//  Created by 路岗 on 2019/3/17.
//  Copyright © 2019年 Gang. All rights reserved.
//手动给class 添加一个block块的方法。
#import <Objc/runtime.h>
#import "LGGAddMethodManual.h"
typedef void (^impBlock)(void);
@interface LGGAddMethodManual()
@property(nonatomic, weak) impBlock impBlock;
@end

@implementation LGGAddMethodManual

-(void)addNewMethodByIMP{
    if (YES ==[self respondsToSelector:@selector(newFunction)]) {
        [self performSelector:@selector(newFunction)];
        return;
    }
    self.impBlock = ^(void){
        
        NSLog(@"new function 调用成功");
    };
    
    SEL sel = NSSelectorFromString(@"newFunction");
    IMP imp = imp_implementationWithBlock(self.impBlock);
    
    
    Method addNewMethodByIMPMethod = class_getClassMethod([self class], @selector(addNewMethodByIMP));
    const char *type = method_getTypeEncoding(addNewMethodByIMPMethod);
    //添加方法
    BOOL success= class_addMethod([self class], sel, imp, type);
    
    if (success) {
        NSLog(@"newFunction 添加成功");
        [self performSelector:@selector(newFunction)];
    }
    
    
    
}
@end
