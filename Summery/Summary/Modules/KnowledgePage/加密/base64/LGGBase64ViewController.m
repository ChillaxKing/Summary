//
//  LGGBase64ViewController.m
//  Summary
//
//  Created by 路岗 on 2019/1/13.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import "LGGBase64ViewController.h"

@interface LGGBase64ViewController ()

@end

@implementation LGGBase64ViewController
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"加密" withTitle:@"base64" withClassName:@"LGGBase64ViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //编码：解码，使用终端命令验证
    //$ echo -n "ABC" | base64
    //echo -n "QUJD" |base64 -D
    NSLog(@"ABC base64 encode %@",[self base64Encode:@"ABC"]);
    
    NSLog(@"QUJD base64 decode %@",[self base64Decode:@"QUJD"]);
    
    
}
//base64 编码
-(NSString *)base64Encode:(NSString * )string{
    NSData *strData = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [strData base64EncodedStringWithOptions:0];
}

//base64解码
-(NSString *)base64Decode:(NSString * )string{
    NSData *strData = [[NSData alloc]initWithBase64EncodedString:string options:kNilOptions];
    return [[NSString alloc]initWithData:strData encoding:NSUTF8StringEncoding];
}


@end
