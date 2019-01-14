//
//  LGGPermanentCFThread.h
//  Summary
//
//  Created by 路岗 on 2018/12/18.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^taskBlock)(void);

@interface LGGPermanentCFThread : NSObject

//执行任务
-(void)excuteTask:(taskBlock)block;


//停止任务
-(void)stop;
@end

NS_ASSUME_NONNULL_END
