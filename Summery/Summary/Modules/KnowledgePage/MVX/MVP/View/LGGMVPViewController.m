//
//  LGGMVPViewController.m
//  Summary
//
//  Created by 路岗 on 2019/1/2.
//  Copyright © 2019年 Gang. All rights reserved.
//
#import "LGGMVPPresenter.h"
#import "LGGMVPViewController.h"
/*
 MVP理论：
 1.View包括，view/controllor，view和model完全解耦。
 2.view强引用Presenter，presnter对view 弱引用，事件处理和业务逻辑交给presenter，presenter中不涉及视图布局。
 3.presenter 中强引用model，model的变化由presenter 传递给view
 
 
 疑惑问题，网络请求到底放在哪里。怎么处理网络请求和presenter声明周期不一致的问题
 
 */
@interface LGGMVPViewController ()
@property (nonatomic,strong) UILabel *greetLabel;
@property (nonatomic,strong) UIButton *greetButton;
@property (nonatomic,strong) LGGMVPPresenter *presenter;//View强引用presenter
@end

@implementation LGGMVPViewController

+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"MVX" withTitle:@"MVP" withClassName:@"LGGMVPViewController"];
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
    [self.presenter clickButton];
}


#pragma mark viewprotocol
-(void)showGreetText:(NSString *)text{
    self.greetLabel.text = text;
}

-(LGGMVPPresenter *)presenter{
    if (_presenter == nil) {
        _presenter = [[LGGMVPPresenter alloc]initWithView:self];
    }
    return _presenter;
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
