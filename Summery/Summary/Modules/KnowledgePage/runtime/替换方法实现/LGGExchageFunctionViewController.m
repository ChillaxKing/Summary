//
//  LGGExchageFunctionViewController.m
//  Summary
//
//  Created by 路岗 on 31/12/2019.
//  Copyright © 2019 Gang. All rights reserved.
//
#import "LGGExchageFunctionViewController.h"

@interface LGGExchageFunctionViewController ()
@property(nonatomic, assign) BOOL exchangeFlag;

@end

@implementation LGGExchageFunctionViewController
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"Runtime" withTitle:@"替换方法" withClassName:@"LGGExchageFunctionViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
- (IBAction)whiteButtonClick:(id)sender {
    [self.view makeToast:@"whiteButton Click" duration:3 position:CSToastPositionCenter title:nil image:nil style:nil completion:^(BOOL didTap) {
        
    }];
}
- (IBAction)blackButtonClick:(id)sender {
    [self.view makeToast:@"blackButton Click" duration:3 position:CSToastPositionCenter title:nil image:nil style:nil completion:^(BOOL didTap) {
        
    }];
}
- (IBAction)exchangeFunction:(id)sender {
    
    Method white = class_getInstanceMethod([self class], @selector(whiteButtonClick:));
    Method black = class_getInstanceMethod([self class], @selector(blackButtonClick:));
    method_exchangeImplementations(white, black);
    self.exchangeFlag = YES;
}
- (IBAction)resetFunction:(id)sender {
    
    if (self.exchangeFlag) {
        Method white = class_getInstanceMethod([self class], @selector(whiteButtonClick:));
        Method black = class_getInstanceMethod([self class], @selector(blackButtonClick:));
        method_exchangeImplementations(white, black);
        self.exchangeFlag = NO;
    }
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




@end
