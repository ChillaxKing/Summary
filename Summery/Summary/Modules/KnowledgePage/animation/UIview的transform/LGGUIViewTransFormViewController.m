//
//  LGGUIViewTranslateViewController.m
//  Summary
//
//  Created by 路岗 on 2019/3/31.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import "LGGUIViewTranslateViewController.h"

@interface LGGUIViewTranslateViewController ()

@property(nonatomic, strong) UIImageView *tranlateView;
@end

@implementation LGGUIViewTranslateViewController

+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"Translate" withTitle:@"UIview translate" withClassName:@"LGGUIViewTranslateViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tranlateView = [[UIImageView alloc]init];
    self.tranlateView.image = [UIImage imageNamed:@"bb"];
    [self.view addSubview:self.tranlateView];
    [self.tranlateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(400);
        make.height.mas_equalTo(400);
        make.top.mas_equalTo(200);
        make.centerX.mas_equalTo(self.view);
    }];
    
    UIButton *transButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [transButton setTitle:@"transform" forState:UIControlStateNormal];
    [transButton setBackgroundColor:[UIColor blueColor]];
    [transButton addTarget:self action:@selector(transformView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:transButton];
    [transButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@50);
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(50);
        
    }];
    
    
    
    
    
    
}
-(void)transformView{
    
    self.tranlateView.transform = CGAffineTransformMakeTranslation(0, 100);
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
