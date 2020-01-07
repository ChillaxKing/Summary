//
//  UIViewController+statisticsHook.m
//  Summary
//
//  Created by 路岗 on 2019/3/13.
//  Copyright © 2019年 Gang. All rights reserved.
//通过method_swizzing的方式，实现viewdidload 和 hook_viewdidload互换，达到hook的目的，用于无侵入埋点viewdidload数据
#import "objc/runtime.h"
#import "UIViewController+statisticsHook.h"

@implementation UIViewController (statisticsHook)
+(void)load{
    [UIViewController hookUIViewController];
}
+(void)hookUIViewController{

    Method _viewDidLoadMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
    Method _hookViewDidLoadMethod = class_getInstanceMethod([self class], @selector(hook_viewDidLoad));
    method_exchangeImplementations(_viewDidLoadMethod, _hookViewDidLoadMethod);
}

//hook 方式，先exchange 两个mothod ，然后在新的方法里，调用原来的方法，
-(void)hook_viewDidLoad{
    DLog(@"hook viewdidload class name %@, function%s",[self class],__func__);
    
    [self hook_viewDidLoad];//实际是调用viewdidload
}

@end
