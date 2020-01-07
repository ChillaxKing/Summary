//
//  LGGCustemKeyBoardViewController.m
//  Summary
//
//  Created by 路岗 on 15/04/2019.
//  Copyright © 2019 Gang. All rights reserved.
//

#import "LGGCustemKeyBoardViewController.h"

@interface LGGCustemKeyBoardViewController ()
@property(nonatomic, strong) UITextView *textView;
@end

@implementation LGGCustemKeyBoardViewController

+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"CustemKeyboard" withTitle:@"自定义键盘" withClassName:@"LGGCustemKeyBoardViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textView.delegate = self;
    
}
-(UITextView *)textView{
    if (_textView == nil) {
        _textView = [[UITextView alloc]init];
        [self.view addSubview:_textView];
        
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(300);
            make.center.mas_equalTo(self.view);
        }];
    }
    return _textView;
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
