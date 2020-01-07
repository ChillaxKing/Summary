//
//  LGGRuntimeViewController.m
//  Summary
//
//  Created by 路岗 on 2019/1/17.
//  Copyright © 2019年 Gang. All rights reserved.
//通过类别给uiview 添加属性。d
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
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view removeAssociatedDefaultColor];
        NSLog(@"self.view defaultcolor %@",self.view.defaultColor);
    });
}
    
//访问通过runtime，给view类别添加的defaultcolor 属性
- (void)visitDefaultColor{
    self.view.defaultColor = [UIColor blueColor];
    NSLog(@"defaultcolor%@",self.view.defaultColor);
}


@end
