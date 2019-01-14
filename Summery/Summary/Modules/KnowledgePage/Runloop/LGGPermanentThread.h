//
//  LGGPermanentThread.h
//  Summary
//
//  Created by 路岗 on 2018/12/17.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^task)(void);
@interface LGGPermanentThread : NSObject

//执行Block
-(void)excuteTask:(task)taskBlock;

//停止线程
-(void)stop;

@end

NS_ASSUME_NONNULL_END
