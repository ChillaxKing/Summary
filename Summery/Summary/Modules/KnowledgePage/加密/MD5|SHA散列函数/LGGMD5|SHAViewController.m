//
//  LGGMD5|SHAViewController.m
//  Summary
//
//  Created by 路岗 on 2019/1/13.
//  Copyright © 2019年 Gang. All rights reserved.
//
#import "NSString+Hash.h"
#import "LGGMD5|SHAViewController.h"

@interface LGGMD5_SHAViewController ()

@end

@implementation LGGMD5_SHAViewController
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"加密" withTitle:@"MD5|SHA散列函数" withClassName:@"LGGMD5_SHAViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //md5  验证  终端命令行*  md5 -s "string"

    NSLog(@"ABC 的MD5 %@",[self md5String:@"ABC"]);
}

//encrypt string
-(NSString *)md5String:(NSString *)str{
    return [str md5String];
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
