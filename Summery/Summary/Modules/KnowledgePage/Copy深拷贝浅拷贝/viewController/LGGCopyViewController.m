//
//  LGGCopyViewController.m
//  Summary
//
//  Created by 路岗 on 2019/3/26.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import "LGGCopyViewController.h"

@interface LGGCopyViewController ()
@property(nonatomic, strong) NSMutableString *multString;
@end

@implementation LGGCopyViewController


+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"Copy" withTitle:@"深拷贝浅拷贝" withClassName:@"LGGCopyViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self copyMethod];
    [self copyMutableStrMethod];
    NSMutableString *mutableStr = [NSMutableString stringWithFormat:@"可变的字符"];
    self.multString = mutableStr;
    [self.multString appendFormat:@"aa"];
    [self testUnrecognizeMothod];
    
}

//copy nsstring copy  浅拷贝
- (void)copyMethod {
    NSString *str = @"123";
    NSString *strCopy = [str copy];
    str = @"465";
    DLog(@"strcopy%@",strCopy);
    
    NSMutableString *mutableStr = [NSMutableString stringWithFormat:@"可变的字符"];
    NSMutableString * multableStrCopy = [mutableStr copy];
    
    DLog(@"%@",[multableStrCopy stringByAppendingFormat:@"copy 的不可以调用可变的方法"]);
    
}

//copy nsmutablestring copy 和 nsmutablestring 的mutablecopy 深拷贝
- (void)copyMutableStrMethod {
    NSMutableString *mutStr = [NSMutableString stringWithFormat:@"123"];
    NSString *copyStr = [mutStr copy];
    if ([mutStr isEqualToString:copyStr]) {
        DLog(@"nsmutablestring copy 浅拷贝 %p %p",mutStr,copyStr);
    }else{
           DLog(@"nsmutablestring copy 深拷贝,%p,%p",mutStr,copyStr);
    }
    NSMutableString *mutCopyStr = [mutStr mutableCopy];
    if ([mutStr isEqualToString:mutCopyStr]) {
        DLog(@"nsmutablestring mutablecopy 浅拷贝");
    }else{
        DLog(@"nsmutablestring mutablecopy 深拷贝");
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//找不到实现方法时，调用
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(testUnrecognizeMothod)) {
        DLog(@"aaaaaa");
        return YES;
    }
    return NO;
}
@end
