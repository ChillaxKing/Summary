//
//  LGGMirrorViewController.m
//  Summary
//
//  Created by 路岗 on 26/12/2019.
//  Copyright © 2019 Gang. All rights reserved.
//

#import "LGGMirrorViewController.h"

@interface LGGMirrorViewController ()

@end

@implementation LGGMirrorViewController
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"CAlayer" withTitle:@"mirror镜面" withClassName:@"LGGMirrorViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self mirrorMagic];
}

- (void)mirrorMagic{
    CAReplicatorLayer *mirrorReplicator = [CAReplicatorLayer layer];
    mirrorReplicator.backgroundColor = [UIColor whiteColor].CGColor;
    mirrorReplicator.bounds = self.view.bounds;
//    mirrorReplicator.anchorPoint = CGPointMake(1, 0);
    mirrorReplicator.position = self.view.center;

    [self.view.layer addSublayer:mirrorReplicator];
    
    UIImage *image = [UIImage imageNamed:@"jingtian.jpg"];
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width -200)*0.5,([UIScreen mainScreen].bounds.size.height)*0.5-300,200, 300);
    layer.contents = (__bridge id)image.CGImage;
    layer.backgroundColor = [UIColor greenColor].CGColor;
    
    
    [mirrorReplicator addSublayer:layer];
    mirrorReplicator.instanceCount =2;
    mirrorReplicator.instanceAlphaOffset -=0.5;
    //CATransform3DMakeRotation(M_PI, x, y, z) CATransform3DMakeRotation实现以初始位置为基准,在x轴,y轴,z轴方向上逆时针旋转angle弧度(弧度=π/180×角度,M_PI弧度代表180角度),x,y,z三个参数只分是否为0
//正常照镜子，使用x轴就可以了
    mirrorReplicator.instanceTransform = CATransform3DMakeRotation(M_PI, 1, 0, 0)
    ;


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
