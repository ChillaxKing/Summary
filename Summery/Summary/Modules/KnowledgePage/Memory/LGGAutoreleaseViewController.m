//
//  LGGAutoreleaseViewController.m
//  Summary
//
//  Created by 路岗 on 2018/11/16.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import "LGGAutoreleaseViewController.h"
extern void _objc_autoreleasePoolPrint(void);

@interface LGGAutoreleaseViewController ()

@end

@implementation LGGAutoreleaseViewController
id ocObject;
CFTypeRef sCfArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    id aa = @"ddf";
    NSString *stra = aa;
    NSLog(@"%@",stra);
    // Do any additional setup after loading the view.
    NSError *error = nil;
    NSError *__strong *pError = &error;
    @autoreleasepool {
        NSObject *obj1 = [NSObject new];
        //能打印出释放池中的信息。
        _objc_autoreleasePoolPrint();

    }
    
    id obj = [[NSObject alloc]init];
    void *p = (__bridge void *)(obj);
    
    id obj2 = (__bridge id)(p);
    
    [self testCFContext];
    
    NSLog(@"after ocObject cout%d",CFGetRetainCount((__bridge void *)(ocObject)));
    
    [self testOCContext];
    NSLog(@"ascfarray cout %d",CFGetRetainCount(sCfArray));

}
//测试oc对象在离开作用域内自动释放
-(void)testOCContext{
    NSArray *tmpArray = [NSArray new];
    sCfArray = CFBridgingRetain(tmpArray);
    NSLog(@"scfarray cout %d",CFGetRetainCount(sCfArray));
}
//测试cf在作用域内是否可以自己释放。编译器不能够自动管理cf变量
-(void)testCFContext{
    //cf object
    CFMutableArrayRef cfObject = CFArrayCreateMutable(kCFAllocatorDefault, 0, NULL);
    NSLog(@"cfobject cout%d",CFGetRetainCount(cfObject));
    
//    ocObject = CFBridgingRelease(cfObject);
    ocObject = (__bridge_transfer id)cfObject;
    NSLog(@"cfobject cout%d",CFGetRetainCount(cfObject));
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
