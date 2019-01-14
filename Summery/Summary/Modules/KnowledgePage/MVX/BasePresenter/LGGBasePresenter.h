//
//  LGGBasePresenter.h
//  Summary
//
//  Created by 路岗 on 2019/1/2.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGGBasePresenter<E> : NSObject
{
    __weak E _view;
}

-(instancetype)initWithView:(E)view;
@end

NS_ASSUME_NONNULL_END
