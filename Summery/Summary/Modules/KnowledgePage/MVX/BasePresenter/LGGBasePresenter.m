//
//  LGGBasePresenter.m
//  Summary
//
//  Created by 路岗 on 2019/1/2.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import "LGGBasePresenter.h"

@implementation LGGBasePresenter
-(instancetype)initWithView:(id)view{
    self = [super init];
    if (self) {
        _view = view;
    }
    return  self;
}
@end
