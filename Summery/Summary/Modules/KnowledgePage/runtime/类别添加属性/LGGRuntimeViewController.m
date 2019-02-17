//
//  LGGRuntimeViewController.m
//  Summary
//
//  Created by 路岗 on 2019/1/17.
//  Copyright © 2019年 Gang. All rights reserved.
//
#import "UIView+defaultBackground.h"
#import "LGGRuntimeViewController.h"

@interface LGGRuntimeViewController ()

@end

@implementation LGGRuntimeViewController
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"Runtime" withTitle:@"类别添加属性" withClassName:@"LGGRuntimeViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self visitDefaultColor];
}
    
//访问通过runtime，给view类别添加的defaultcolor 属性
- (void)visitDefaultColor{
    self.view.defaultColor = [UIColor blackColor];
    NSLog(@"%@",self.view.defaultColor);
}


@end
