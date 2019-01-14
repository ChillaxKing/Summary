//
//  LGGBlockViewController.m
//  Summary
//
//  Created by 路岗 on 2018/12/1.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import "LGGBlockViewController.h"
//typedef int(^sum)(int a,int b,int c);
@interface LGGBlockViewController ()

@end

@implementation LGGBlockViewController

//typedef int (^sum)(int a,int b,int c) = ^(int a,int b,int c){
//    return a+b+c;
//};
int (^sumGlobeBlk)(int a, int b,int c) =^(int a,int b, int c){
    return a+b+c;
};
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"Block" withTitle:@"block" withClassName:@"LGGBlockViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //block的基本定义
    int (^sum)(int a,int b,int c) = ^(int a,int b,int c){
        return a+b+c;
    };
    int sum1 = sum(1,2,3);
    NSLog(@"%d",sum1);
    
    //block 截获的自动变量
    int captureInt = 2;
    __block int captureInt1 = 3;
    void (^captureIntBlock)(void)= ^{
//        captureInt = 1;报错行不能够够直接给截获的自动变量，可以通过__block,实现
        captureInt1 = 2;
        
    };
    captureIntBlock();
    
    //改变截获的自动变量的方法，而不是直接赋值，不会报错
    NSMutableArray *captureMulArr = [NSMutableArray new];
    void (^captureMulArrBlk)(void) = ^{
        NSObject *object = [NSObject new];
        [captureMulArr addObject:object];
    };
    captureMulArrBlk();
    
    //block对自动变量的截取，并没有实现对c数组的自动截取，所有下面会报错，可以改用指针的方式
    const char s[] = "hello";
    const char *p = "hello";
    void (^cBlock)(void) = ^{
//        NSLog(@"%c",s[1]); 报错行
        NSLog(@"%c",p[1]);
    };
    cBlock();
    
    //全局的block
    int sumGlobe = sumGlobeBlk(1,2,3);
    NSLog(@"sum %d",sumGlobe);
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
