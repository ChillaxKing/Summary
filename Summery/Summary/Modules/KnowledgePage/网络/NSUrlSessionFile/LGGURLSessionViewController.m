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

//post 请求
-(void)loadImageWithPost{
    NSString *url = @"http://app.peopleapp.com/Api/622/HomeApi/getContentList";
    NSString *parameters = @"category_id=1&channel=app%20store&city=北京市&citycode=010&device=B92F4454-3104-4A3E-998F-002EBD8BD4BA&device_model=iPhone&device_os=iOS%2012.1.2&device_product=苹果&device_size=750%2A1334&device_type=2&district=朝阳区&fake_id=3923908&id=2738972&image_height=750&image_wide=1334&interface_code=625&latitude=39.96313123914931&longitude=116.4995548502604&page=1&province=北京市&refresh_tag=0&refresh_time=1547526228&securitykey=d3a7d54b6b08061f1c4085d8371cab88&show_num=20&update_time=0&userId=0&version=6.2.5";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [parameters dataUsingEncoding:NSUTF8StringEncoding];
    //建立session
    //建立任务task,刚建立的任务是挂起的，需要resume激活
    //resume任务
    [[[NSURLSession sharedSession]dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *parseError;
        NSLog(@"%@",[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError]);
        
        }
      ]resume];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
@end
