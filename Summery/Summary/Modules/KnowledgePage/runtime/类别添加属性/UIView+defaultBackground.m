//
//  LGGViewCatagary.m
//  Summary
//
//  Created by 路岗 on 2019/1/17.
//  Copyright © 2019年 Gang. All rights reserved.
//
#import <objc/runtime.h>
#import "UIView+defaultBackground.h"

@implementation UIView(defaultColor)
@dynamic defaultColor;
static char kDefaultColor;
-(void)setDefaultColor:(UIColor *)defaultColor{
    
    objc_setAssociatedObject(self, &kDefaultColor, defaultColor, OBJC_ASSOCIATION_RETAIN);
    self.backgroundColor = defaultColor;
}

-(id)defaultColor{
   return  objc_getAssociatedObject(self, &kDefaultColor);
}

- (void)removeAssociatedDefaultColor {
    
    objc_removeAssociatedObjects(self);
}
@end

