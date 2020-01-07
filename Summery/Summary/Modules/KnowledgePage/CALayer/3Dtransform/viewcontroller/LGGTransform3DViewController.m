//
//  LGGTransform3DViewController.m
//  Summary
//
//  Created by 路岗 on 26/12/2019.
//  Copyright © 2019 Gang. All rights reserved.
//

#import "LGGTransform3DViewController.h"

@interface LGGTransform3DViewController ()

@end

@implementation LGGTransform3DViewController
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"CAlayer" withTitle:@"3DTranslation" withClassName:@"LGGTransform3DViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self translation3D];
}

- (void)translation3D{
    UIImage *image = [UIImage imageNamed:@"jingtian.jpg"];
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width -200)*0.5,([UIScreen mainScreen].bounds.size.height)*0.5-300,200, 300);
    layer.contents = (__bridge id)image.CGImage;
    layer.backgroundColor = [UIColor greenColor].CGColor;
    
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 500);
//    transform.m34 = -1/100.0;
    layer.transform = transform;
//    layer.transform = CATransform3DMakeScale(1, 0.5, 0.5);
    [self.view.layer addSublayer:layer];
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
