//
//  LGGOperationQueueViewController.m
//  Summary
//
//  Created by 路岗 on 03/12/2019.
//  Copyright © 2019 Gang. All rights reserved.
//

#import "LGGOperationQueueViewController.h"

@interface LGGOperationQueueViewController ()

@end

@implementation LGGOperationQueueViewController

+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"multithreading" withTitle:@"NSOperationQueue" withClassName:@"LGGOperationQueueViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
