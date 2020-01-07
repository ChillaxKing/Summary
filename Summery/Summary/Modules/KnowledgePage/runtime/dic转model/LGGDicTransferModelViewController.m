//
//  LGGDicTransferModelViewController.m
//  Summary
//
//  Created by 路岗 on 31/12/2019.
//  Copyright © 2019 Gang. All rights reserved.
//
#import "LGGRumtimeModel.h"
#import "LGGDicTransferModelViewController.h"

@interface LGGDicTransferModelViewController ()

@end

@implementation LGGDicTransferModelViewController

+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"Runtime" withTitle:@"dic转model" withClassName:@"LGGDicTransferModelViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self metaClass];
    
}
- (void)metaClass {
//    object_getClass(class)  取得元类
    if (class_isMetaClass(object_getClass([LGGRumtimeModel class])) == YES){
        DLog(@"元类");
    }else{
        DLog(@"非元类");
    }
    
}

@end
