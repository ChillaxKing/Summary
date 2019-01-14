//
//  LGGBaseViewController.m
//  Summary
//
//  Created by 路岗 on 2018/11/21.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import "LGGBaseViewController.h"
#import <YYKit/YYTextView.h>
@interface LGGBaseViewController ()<YYTextViewDelegate>
@property (nonatomic,strong)YYTextView *textView;
@end

@implementation LGGBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(YYTextView *)textView
{
    if (_textView == nil) {
        _textView = [YYTextView new];
        _textView.delegate = self;
        
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
