//
//  LGGPermanentCFThread.m
//  Summary
//
//  Created by 路岗 on 2018/12/18.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import "LGGPermanentCFThread.h"
@interface LGGCFThread:NSThread

@end
@implementation LGGCFThread

-(void)dealloc{
    NSLog(@"%s",__func__);
}

@end
@interface LGGPermanentCFThread ()
@property(nonatomic,strong)LGGCFThread *thread;

@end
@implementation LGGPermanentCFThread

-(instancetype)init{
    self = [super init];
    if (self) {
        self.thread = [[LGGCFThread alloc]initWithBlock:^{
            CFRunLoopRef runloop = CFRunLoopGetCurrent();
            CFRunLoopSourceContext context = {0};
            CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
            CFRunLoopAddSource(runloop,source,kCFRunLoopDefaultMode);
            CFRelease(source);
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
            
        }];
        [self.thread start];
    }
    return self;
}

- (void)excuteTask:(taskBlock)block{
    
    [self performSelector:@selector(__excuteTask:) onThread:self.thread withObject:block waitUntilDone:NO];
}
- (void)__excuteTask:(taskBlock)block{
    
    block();
}

-(void)stop{
    [self performSelector:@selector(__stop) onThread:self.thread withObject:nil waitUntilDone:YES];
}
-(void)__stop{
    CFRunLoopStop(CFRunLoopGetCurrent());
    
}
-(void)dealloc{
    [self stop];
    NSLog(@"%s",__func__);
}
@end
