//
//  LGGPermanentThread.m
//  Summary
//
//  Created by 路岗 on 2018/12/17.
//  Copyright © 2018年 Gang. All rights reserved.
//



#import "LGGPermanentThread.h"

@interface LGGThread : NSThread

@end

@implementation LGGThread

-(void)dealloc{
    NSLog(@"%s",__func__);
}

@end

@interface LGGPermanentThread()
@property (nonatomic,strong)LGGThread *thread;
@property (nonatomic,assign)BOOL stopflag;
@end
@implementation LGGPermanentThread


-(instancetype)init{
    self = [super init];
    if (self) {
        DLog(@"lggpermanentthread %@",[super class]);
        self.stopflag = NO;
        __weak typeof(self) weakSelf = self;
        
        self.thread = [[LGGThread alloc]initWithBlock:^{
            NSLog(@"lggthread start");
            [[NSRunLoop currentRunLoop]addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
            while(weakSelf && !weakSelf.stopflag) {
                
                [[NSRunLoop currentRunLoop]runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
            NSLog(@"lggthread end");
        }];
        [self.thread start];
    }
    return self;
    
}
-(void)excuteTask:(task)taskBlock{
    
    [self performSelector:@selector(__excuteTasks:) onThread:self.thread withObject:taskBlock waitUntilDone:YES];
}
-(void)__excuteTasks:(task)task{
    task();
}
-(void)stop{
    if (self.stopflag == YES) {
        return;
    }
    [self performSelector:@selector(__stop) onThread:self.thread withObject:nil waitUntilDone:YES];
}
-(void)__stop{
   
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.stopflag = YES;
    
}

-(void)dealloc{
    [self stop];
    NSLog(@"lgg Permanent thread dealloc");
    
}
@end
