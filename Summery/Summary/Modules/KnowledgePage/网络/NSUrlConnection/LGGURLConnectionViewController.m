//
//  LGGURLConnectionViewController.m
//  Summary
//
//  Created by 路岗 on 2019/1/10.
//  Copyright © 2019年 Gang. All rights reserved.
//
#import "NSString+YYAdd.h"
#import "LGGURLConnectionViewController.h"

@interface LGGURLConnectionViewController ()

@property (nonatomic,strong)UIImageView *imageview;

@end

@implementation LGGURLConnectionViewController
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"网络" withTitle:@"urlconnection" withClassName:@"LGGURLConnectionViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}
//通过get方法从网上下载一个图片
- (void)loadImageWithGet{
    NSString * imageUrl =@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2045967661,1102000518&fm=27&gp=0.jpg";

    //获取url
    //ios
    NSString *utf8Str = [imageUrl stringByURLEncode];
//    NSString *utf8Str = imageUrl;

    //iOS9.0以前，带有中文参数，需要转码
//     NSString *utf8Str = [imageUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:utf8Str];
    NSLog(@"%@",url);
    
    //创建一个request请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //创建一个connection对象
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc]init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSString *responsestr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        UIImage *image = [UIImage imageWithData:data];
        //解析json
//        id object =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        NSLog(@"%@",object);
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            self.imageview.image = image;
        }];
    }];
}

- (void)loadImageWithPost{
    NSString * utf8Str =@"https://image.baidu.com/search/detail";
    NSString *bodyStr = @"ct=503316480&z=0&ipn=d&word=景甜泳装壁纸&step_word=&hs=0&pn=11&spn=0&di=68090&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=2&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=2225771151%2C3327613251&os=3267151714%2C625052910&simid=3463382176%2C488225454&adpicid=0&lpn=0&ln=489&fr=&fmq=1547181411893_R&fm=result&ic=0&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=&height=&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fec980f61346aacc05bf55afe51a47e27e857185956689-aycF3T_fw658&fromurl=ippr_z2C%24qAzdH3FAzdH3Fi7wkwg_z%26e3Bv54AzdH3FrtgfAzdH3F89mb0abcncAzdH3F&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined";
    //获取url
    //ios
//    NSString *utf8Str = [imageUrl stringByURLEncode];
    //    NSString *utf8Str = imageUrl;
    
    //iOS9.0以前，带有中文参数，需要转码
    //     NSString *utf8Str = [imageUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:utf8Str];
    NSLog(@"%@",url);
    
    //创建一个request请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    //创建一个connection对象
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc]init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSString *responsestr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        UIImage *image = [UIImage imageWithData:data];
        //解析json
        //        id object =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        //        NSLog(@"%@",object);
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            self.imageview.image = image;
        }];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self loadImageWithPost];
}
-(UIImageView *)imageview{
    if (_imageview == nil) {
        _imageview = [UIImageView new];
        _imageview.frame = CGRectMake(0, 0, 400, 400);
        _imageview.center = self.view.center;
        _imageview.backgroundColor = [UIColor redColor];
        [self.view addSubview:_imageview];
    }
    return _imageview;
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
