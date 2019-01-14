//
//  LGGMVVMViewController.m
//  Summary
//
//  Created by 路岗 on 2019/1/2.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import "LGGMVVMViewController.h"

@interface LGGMVVMViewController ()
@property (nonatomic,strong) UILabel *greetLabel;
@property (nonatomic,strong) UIButton *greetButton;
@end

@implementation LGGMVVMViewController
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"MVX" withTitle:@"MVVM" withClassName:@"LGGMVVMViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.greetLabel];
    [self.view addSubview:self.greetButton];
    [self.greetButton addTarget:self action:@selector(greetShow) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)greetShow{
    
}
-(UILabel *)greetLabel{
    if (_greetLabel == nil) {
        _greetLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        _greetLabel.center = self.view.center;
        _greetLabel.textColor = [UIColor blueColor];
        _greetLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _greetLabel;
}

-(UIButton *)greetButton{
    if (_greetButton == nil) {
        _greetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_greetButton setTitle:@"CLICK" forState:UIControlStateNormal];
        [_greetButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _greetButton.frame = CGRectMake(self.view.center.x-50, self.view.center.y-40, 100, 40);
    }
    return _greetButton;
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
