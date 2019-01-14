//
//  LGGMVCViewController.m
//  Summary
//
//  Created by 路岗 on 2019/1/2.
//  Copyright © 2019年 Gang. All rights reserved.
//
#import "LGGMVCModel.h"
#import "LGGMVCViewController.h"

@interface LGGMVCViewController ()
@property (nonatomic,strong) UILabel *greetLabel;
@property (nonatomic,strong) UIButton *greetButton;
@property (nonatomic,strong) LGGMVCModel *model;
@end
/*
 MVC
 模型赋值，view初始化，布局，greetButton点击事件响应，greetLabel的文字展示，都在controller中，
 
 */
@implementation LGGMVCViewController
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"MVX" withTitle:@"MVC" withClassName:@"LGGMVCViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel: model];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.model = [LGGMVCModel new];
    self.model.name = @"King";
    [self.view addSubview:self.greetLabel];
    [self.view addSubview:self.greetButton];
    [self.greetButton addTarget:self action:@selector(greetShow) forControlEvents:UIControlEventTouchUpInside];

}
-(void)greetShow{
    self.greetLabel.text = [NSString stringWithFormat:@"%@ ,how are you !",self.model.name];
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
