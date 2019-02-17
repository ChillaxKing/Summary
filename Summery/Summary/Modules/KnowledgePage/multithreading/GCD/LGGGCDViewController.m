//
//  LGGGCDViewController.m
//  Summary
//
//  Created by 路岗 on 2018/11/15.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import "LGGGCDViewController.h"
#import "LGGKnowledgeModelManager.h"
@interface LGGGCDViewController ()
@property (nonatomic,strong)dispatch_source_t timer;//定时器
@property (nonatomic,strong)UITextView *textView;

@end

@implementation LGGGCDViewController
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"multithreading" withTitle:@"GCD" withClassName:@"LGGGCDViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //后台执行
//    QOS_CLASS_USER_INTERACTIVE
//    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, <#unsigned long flags#>)
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
//    timespec
//    struct timespec
//    modf(<#double#>, <#double *#>)
//    dispatch_walltime(<#const struct timespec * _Nullable when#>, <#int64_t delta#>)
    
    //主线程执行
    dispatch_async(dispatch_get_main_queue(), ^{
        
    });
    //一次性执行 一般用于单例的定义中
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
    });
    NSLog(@"%ld",onceToken);
    double delay = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay*NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        //code to excute after 2s
    });
    //serial queue
    dispatch_queue_t serailTaskQueue = dispatch_queue_create("com.gang.summary.gcd.serailTaskQueue", NULL);
    dispatch_async(serailTaskQueue, ^{
        NSLog(@"com.gang.summary.gcd.serailTaskQueue work");
    });
    
    //Concurrent dispatch 尽量使用globedispatch，无需创建新的。
    //多个serail dispatch 之间是并行关系
//    LGGKnowledgeModelManager *manager = [LGGKnowledgeModelManager shareManager];
    //dispatch group notify
    dispatch_queue_t globeQueue =  dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t serialQueue = dispatch_queue_create("com.gang.Summary.GCDGroupSerial", NULL);
    //可以通过dispatch_set_target_queue 来设置serail queue的优先级
    dispatch_queue_t globeQueueHighPriority = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_set_target_queue(globeQueueHighPriority, serialQueue);
    
    //创建多个相同优先级的serail  当多个serail queue，通过dispatch_set_target_queue 指定的函数目标为某一个serial queue,则多个serail queue 不会不行运行，只会在目标serail queue上串行执行。
    dispatch_queue_t serailQueue1 = dispatch_queue_create("com.gang.Summary.gcd.serailQueue1", NULL);
    dispatch_set_target_queue(serialQueue, serailQueue1);
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, globeQueue, ^{
        NSLog(@" group globel queue 1");
    });
    dispatch_group_async(group, globeQueue, ^{
        NSLog(@"group globel queue 2");
    });
    dispatch_group_notify(group, globeQueue, ^{
        NSLog(@"group notify end over 1");
    });
//    dispatch_release(group);

    dispatch_group_async(group, globeQueue, ^{
         NSLog(@"group globel queue 3");
    });
    
    dispatch_group_async(group, serailQueue1, ^{
        for (int i=0; i<10; i++) {
            NSLog(@"group serial queue1111 %d，%@",i,[NSThread currentThread]);
        }
        
    });
    dispatch_group_async(group, serialQueue, ^{
        for (int i=0; i<10; i++) {
           NSLog(@"group serial queue %d,%@",i,[NSThread currentThread]);
        }
        
    });
    //必须记得release ios 6.0 以后，dispatch 已经加入到ARC中
    
    //dispatch_group_wait  ,可以在主线程中通过设置DISPATCH_TIME_NOW来查询某个group是否完成做相应的处理，但是最好还是使用dispatch_group_notify 的方式。可以简化源代码
    
    long groupFlag = dispatch_group_wait(group,DISPATCH_TIME_FOREVER);
    if (groupFlag == 0) {
        //在等待的时间内已经group内的任务已经全部完成
        NSLog(@"group tasks complete wait 0");
    }else{
        //等待时间为DISPATCH_TIME_FOREVER时，else内语句肯定不会执行
        NSLog(@"group tasks complete wait no zero");
    
    }
    
    
    //semophore 信号量，计数类型信号  信号量用于小颗粒的排他性控制的情况 ，大颗粒的使用 dispatch_group dispatch_barrier  信号量的使用像网络加载中的同步
    NSMutableArray *mulArray = [NSMutableArray new];
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10);
//    for(int i=0;i<1000;i++){
//      dispatch_async(globeQueue, ^{
//
//
////                dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//                [mulArray addObject:@(i)];
//                NSLog(@"semaphore log %d,thread%@",i,[NSThread currentThread]);
////                dispatch_semaphore_signal(semaphore);
//
//
//
//        });
//    }
    
    //dispatch_once 保证app在运行中，只运行一次指定的处理的api
    
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        NSLog(@"hello,此处只会运行一次");
    });
    
    
    NSLog(@"Hello, World1!");
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"Hello, World2!");
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Hello, World3!");
        });
        NSLog(@"Hello, World6!");
        
    });
    NSLog(@"Hello, World4!");
 

    
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"main sync，%@",[NSThread currentThread]);
    });
    NSLog(@"main sync2，%@",[NSThread currentThread]);

    //产生死锁：通过sync向当前的串行队列添加任务，就会引起死锁
//    demo1
//    [self deadlockSyncForMainThread];
//    demo2
//    [self deadlockSyncSirailQueue];
}
//死锁情况一，向主线程sync添加新的任务
-(void)deadlockSyncForMainThread{
    NSLog(@"mainthread task 1sync %s ",__func__);
//    下面会死锁
//    dispatch_sync(dispatch_get_main_queue(), ^{
//      NSLog(@"add mainthread sync %s ",__func__);
//    });
    
    //解决方法，1，使用异步主线程执行，2.使用另外的队列同步执行
    dispatch_async(dispatch_get_main_queue(), ^{
      NSLog(@"add mainthread async task 3%s ",__func__);
    });
    
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
      NSLog(@"add mainthread task 4sync %s ",__func__);
    });
    
      NSLog(@"mainthread task 5 sync %s ",__func__);
}

//死锁情况2，向当前串行队列添加sync任务
-(void)deadlockSyncSirailQueue{
    dispatch_queue_t serailQueue = dispatch_queue_create("com.gang.Summary.GCD.deadlockSerail", DISPATCH_QUEUE_SERIAL);
    NSLog(@"deallock serail task 1");
    dispatch_async(serailQueue, ^{
      NSLog(@"deallock serail task 2");
        dispatch_sync(serailQueue, ^{
            NSLog(@"deallock serail task 3");
        });
        NSLog(@"deallock serail task 4");
        
    });
    
}



//-(dispatch_time_t)getDispatchTime:(NSDate *)date{
//    dispatch_time_t time;
//
//
//    NSTimeInterval timeInterval = [date timeIntervalSince1970];
//
//    struct timespec timeSpec;
//    timeSpec.tv_sec ;
//    timeSpec.tv_nsec;
//    dispatch_walltime(timeSpec, 0);
//
//}
//快速迭代 多条线程同时无序执行，
//使用场景：多张图片下载，拷贝。
-(void)dispatchApply{
    dispatch_apply(10000, dispatch_get_global_queue(0, 0), ^(size_t i){
        NSLog(@"快速迭代  ---%@",[NSThread currentThread]);
    });
}


//栅栏函数 含有任务1，2，3，4，需要在12执行完，才能够执行34，
//使用场景：多张图片拼接，需要图片异步下载之后，才能够进行拼接操作
-(void)dispatchBarrier{
  //注意dispatch_barrier 不能够使用global队列，否则无效
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        NSLog(@"barrier 1 %@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"barrier 2 %@",[NSThread currentThread]);
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"barrier barrier %@",[NSThread currentThread]);

    });
    dispatch_async(queue, ^{
        NSLog(@"barrier 3 %@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"barrier 4 %@",[NSThread currentThread]);
    });
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self dispatchBarrier];
    [self dispatchTimer];
}

//dispatch timer 非常精准定时器
-(void)dispatchTimer{
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    self.timer = timer;

    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"dispatch定时器开启");
    });
    dispatch_resume(timer);
}
-(UITextView *)textView{
    if (_textView == nil) {
    }
    return _textView;
}
-(void)dealloc{
    NSLog(@"%s",__func__);
}
@end
