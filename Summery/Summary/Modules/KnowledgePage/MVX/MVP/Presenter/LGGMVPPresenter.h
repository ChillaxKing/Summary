//
//  LGGMVPPresenter.h
//  Summary
//
//  Created by 路岗 on 2019/1/2.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGGBasePresenter.h"
#import "LGGMVPVViewProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface LGGMVPPresenter<LGGMVPVViewProtocol> : LGGBasePresenter

//接收按钮点击事件
-(void)clickButton;

@end

NS_ASSUME_NONNULL_END
