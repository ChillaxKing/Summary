//
//  LGGNSThreadViewController.m
//  Summary
//
//  Created by 路岗 on 2019/1/6.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import "LGGNSThreadViewController.h"

@interface LGGNSThreadViewController ()

@end

@implementation LGGNSThreadViewController
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"multithreading" withTitle:@"NSThread" withClassName:@"LGGNSThreadViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self creatThread];
}
//NSThread创建线程 执行方法选择器。
-(void)creatThread{
    [NSThread detachNewThreadSelector:@selector(threadSelector) toTarget:self withObject:nil];
}
-(void)threadSelector{
    NSLog(@"%s %@",__func__,[NSThread currentThread]);
}
@end
