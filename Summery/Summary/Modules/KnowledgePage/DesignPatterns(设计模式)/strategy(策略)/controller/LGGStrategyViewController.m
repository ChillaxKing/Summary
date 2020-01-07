//
//  LGGStrategyViewController.m
//  Summary
//
//  Created by 路岗 on 2019/3/20.
//  Copyright © 2019年 Gang. All rights reserved.
//策略模式，将本来存在于textfield代理中的，正则判断逻辑，各种ifelse，算法抽离出来，代码逻辑清晰，方便扩展。
#import "LGGNumberInputValidator.h"
#import "LGGAlphabetInputValidator.h"
#import "LGGValidTextField.h"
#import "LGGStrategyViewController.h"

@interface LGGStrategyViewController ()<UITextFieldDelegate>
@property(nonatomic, strong) LGGValidTextField *numberTextField;//数字输入框允许0-9数字
@property(nonatomic, strong) LGGValidTextField *alphabetTextField;//字母输入框，允许a-z，A-Z

@end

@implementation LGGStrategyViewController
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"DesignPatterns" withTitle:@"strategy策略" withClassName:@"LGGStrategyViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self numberTextField];
    [self alphabetTextField];
    
}
-(LGGValidTextField *)numberTextField{
    if (_numberTextField == nil) {
        _numberTextField = [LGGValidTextField new];
        _numberTextField.backgroundColor = [UIColor grayColor];
        _numberTextField.placeholder = @"输入数字";
        _numberTextField.delegate =self;
        [self.view addSubview:_numberTextField];
        [_numberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(100);
            make.top.mas_equalTo(100);
            make.centerX.mas_equalTo(self.view.mas_centerX);
        }];
        _numberTextField.inputValidator = [LGGNumberInputValidator new];
    }
    return _numberTextField;
}

-(LGGValidTextField *)alphabetTextField{
    if (_alphabetTextField == nil) {
        _alphabetTextField = [LGGValidTextField new];
        _alphabetTextField.backgroundColor = [UIColor grayColor];
        _alphabetTextField.placeholder = @"输入字母";
        _alphabetTextField.delegate = self;
        [self.view addSubview:_alphabetTextField];
        [_alphabetTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(100);
            make.top.mas_equalTo(200);
            make.centerX.mas_equalTo(self.view.mas_centerX);
        }];
        _alphabetTextField.inputValidator = [LGGAlphabetInputValidator new];
    }
    return _alphabetTextField;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITextFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField isKindOfClass:[LGGValidTextField class]]) {
        
        [(LGGValidTextField *)textField validate];
    }
}

@end
