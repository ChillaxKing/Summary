//
//  LGGMVPPresenter.m
//  Summary
//
//  Created by 路岗 on 2019/1/2.
//  Copyright © 2019年 Gang. All rights reserved.
//
#import "LGGMVPModel.h"
#import "LGGMVPPresenter.h"
@interface LGGMVPPresenter()
@property (nonatomic,strong)LGGMVPModel *model;
@end
@implementation LGGMVPPresenter

-(void)clickButton{
    self.model = [LGGMVPModel new];
    self.model.name = @"MVP";
    NSString *greetString = [NSString stringWithFormat:@"%@ how re you",self.model.name];
    if ([_view respondsToSelector:@selector(showGreetText:)]) {
        [_view showGreetText:greetString];
    }
}

@end
