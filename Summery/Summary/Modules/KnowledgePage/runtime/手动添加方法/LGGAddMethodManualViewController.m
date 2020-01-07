//
//  LGGAddMethodManualViewController.m
//  Summary
//
//  Created by 路岗 on 2019/3/17.
//  Copyright © 2019年 Gang. All rights reserved.
//
#import "LGGAddMethodManual.h"
#import "LGGAddMethodManualViewController.h"

@interface LGGAddMethodManualViewController ()

@end

@implementation LGGAddMethodManualViewController


+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"Runtime" withTitle:@"手动添加方法" withClassName:@"LGGAddMethodManualViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    LGGAddMethodManual *manual = [LGGAddMethodManual new];
    [manual addNewMethodByIMP];
    
    [self performSelector:NSSelectorFromString(@"notReallyfunction")];
}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    
    DLog(@"__function%s ",__func__);
    return [super resolveInstanceMethod:sel];
}

-(id)forwardingTargetForSelector:(SEL)aSelector{
    DLog(@"__function%s ",__func__);

    return [super forwardingTargetForSelector:aSelector];
}

-(void)forwardInvocation:(NSInvocation *)anInvocation{
    DLog(@"__function%s ",__func__);

}
/**
 通过imp 直接调用方法
 */
- (void)testIMPInvocation {
    NSLog(@"通过imp直接调用 testIMPInvocation方法");
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
