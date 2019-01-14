//
//  LGGURLSessionViewController.m
//  Summary
//
//  Created by 路岗 on 2019/1/11.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import "LGGURLSessionViewController.h"

@interface LGGURLSessionViewController ()
@property (nonatomic,strong)UIImageView *imageview;

@end

@implementation LGGURLSessionViewController
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"网络" withTitle:@"URLSession" withClassName:@"LGGURLSessionViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
//解析json数据
-(void)parseJson{
    
}
//URLSession获取网络图片
-(void)loadImageWithGet{
    NSString *imageUrl = @"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2045967661,1102000518&fm=27&gp=0.jpg";

    //建立request
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:imageUrl]];
    
    //建立session
    //建立任务task,刚建立的任务是挂起的，需要resume激活
    //resume任务
    [[[NSURLSession sharedSession]dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",[NSThread currentThread]);
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageview.image = image;
           
        });
        
    }]resume];
}
-(void)loadImageWithPost{
    NSString *imageUrl = @"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2045967661,1102000518&fm=27&gp=0.jpg";
    
    //建立request
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:imageUrl]];
    
    //建立session
    //建立任务task,刚建立的任务是挂起的，需要resume激活
    //resume任务
    [[[NSURLSession sharedSession]dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",[NSThread currentThread]);
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageview.image = image;
        });
        
    }]resume];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

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
@end
