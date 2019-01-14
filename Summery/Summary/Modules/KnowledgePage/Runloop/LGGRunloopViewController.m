//
//  LGGRunloopViewController.m
//  Summary
//
//  Created by 路岗 on 2018/12/15.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import "LGGRunloopViewController.h"
#import "LGGPermanentThread.h"
#import "LGGPermanentCFThread.h"
@interface LGGRunloopViewController ()
@property (nonatomic,strong)LGGPermanentThread *thread;
@property (nonatomic,strong)LGGPermanentCFThread *cfThread;
@end

@implementation LGGRunloopViewController
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"Runloop" withTitle:@"runloop" withClassName:@"LGGRunloopViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:2.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
    }];
    // Do any additional setup after loading the view.
    NSDefaultRunLoopMode;kCFRunLoopDefaultMode;
    UITrackingRunLoopMode;
//    GSEventReceiveRunLoopMode;
    
    
//    NSLog(@"main runloop%@",[NSRunLoop mainRunLoop]);
    [NSRunLoop currentRunLoop];
    //lldb bt 打印函数栈
    
    
    //具体应用场景
    //线程保活 点击屏幕，打印字符串
    self.thread = [[LGGPermanentThread alloc]init];
    self.cfThread = [[LGGPermanentCFThread alloc]init];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [self.thread excuteTask:^{
//        NSLog(@"点击了屏幕 %@",[NSThread currentThread]);
//    }];
    [self.cfThread excuteTask:^{
        NSLog(@"点击屏幕 cfthread %@",[NSThread currentThread]);
    }];
}

- (void)dealloc
{
    NSLog(@"runloop controller dealloc");
}
@end
