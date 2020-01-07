//
//  LGGCAlayerViewController.m
//  Summary
//
//  Created by 路岗 on 18/12/2019.
//  Copyright © 2019 Gang. All rights reserved.
//

#import "LGGCAlayerViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LGGCAlayerViewController ()
@property(nonatomic, strong) UIImageView *testImageView;
@end

@implementation LGGCAlayerViewController

+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"CAlayer" withTitle:@"CAlayer" withClassName:@"LGGCAlayerViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *jingtian = [UIImage imageNamed:@"jingtian.jpg"];
//    self.testImageView = [[UIImageView alloc]initWithImage:jingtian];
//    self.testImageView.frame = self.view.bounds;
//    [self.view addSubview:self.testImageView];
    
    self.view.layer.contents = (__bridge id)jingtian.CGImage;
//    self.view.layer.contentsGravity = kCAGravityResizeAspect;
//        self.view.layer.contentsGravity = kCAGravityCenter;
//    self.view.layer.contentsScale = jingtian.scale;
    self.view.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    
    self.view.layer.contentsCenter = CGRectMake(0.25, 0.25, 0.5, 0.5);
//    self.view.layer.delegate  =self;
    
    
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
