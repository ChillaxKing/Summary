//
//  LGGAFNetWorkTextHtmlViewController.m
//  Summary
//
//  Created by 路岗 on 2019/1/15.
//  Copyright © 2019年 Gang. All rights reserved.
//
#import <AFNetworking.h>
#import "LGGAFNetWorkTextHtmlViewController.h"

@interface LGGAFNetWorkTextHtmlViewController ()

@end

@implementation LGGAFNetWorkTextHtmlViewController

+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"网络" withTitle:@"AFNetworjk text/html" withClassName:@"LGGAFNetWorkTextHtmlViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
/*http://app.peopleapp.com/Api/622/HomeApi/getContentList?category_id=1&channel=app%20store&city=北京市&citycode=010&device=B92F4454-3104-4A3E-998F-002EBD8BD4BA&device_model=iPhone&device_os=iOS%2012.1.2&device_product=苹果&device_size=750%2A1334&device_type=2&district=朝阳区&fake_id=3923908&id=2738972&image_height=750&image_wide=1334&interface_code=625&latitude=39.96313123914931&longitude=116.4995548502604&page=1&province=北京市&refresh_tag=0&refresh_time=1547526228&securitykey=d3a7d54b6b08061f1c4085d8371cab88&show_num=20&update_time=0&userId=0&version=6.2.5
 选取的url仅供demo学习使用，请不要用于任何商业用途
 */

//
-(void)getListOfNews{
    NSDictionary *parameters = @{@"category_id":@"1",
                                 @"channel":@"app store",
                                 @"city":@"北京市",
                                 @"citycode":@"010",
                                 @"device":@"B92F4454-3104-4A3E-998F-002EBD8BD4BA",
                                 @"device_model":@"iPhone",
                                 @"device_os":@"iOS 12.1.2",
                                 @"device_product":@"苹果",
                                 @"device_size":@"750%2A1334",
                                 @"device_type":@"2",
                                 @"district":@"朝阳区",
                                 @"fake_id":@"3923908",
                                 @"id":@"2738972",
                                 @"image_height":@"750",
                                 @"image_wide":@"1334",
                                 @"interface_code":@"625",
                                 @"latitude":@"39.96313123914931",
                                 @"longitude":@"116.4995548502604",
                                 @"page":@"1",
                                 @"province":@"北京市",
                                 @"refresh_tag":@"0",
                                 @"refresh_time":@"1547526228",
                                 @"securitykey":@"d3a7d54b6b08061f1c4085d8371cab88",
                                 @"show_num":@"20",
                                 @"update_time":@"0",
                                 @"userId":@"0",
                                 @"version":@"6.2.5"};
    NSLog(@"%@",[parameters description]);
    NSSet *set = [[[AFHTTPSessionManager manager]responseSerializer]acceptableContentTypes];
    NSMutableSet *mulSet = [NSMutableSet setWithSet:set];
    
    [mulSet addObject:@"text/html"];
    [[AFHTTPSessionManager manager]responseSerializer].acceptableContentTypes= mulSet;
    
    NSLog(@"acceptype %@",[[AFHTTPSessionManager manager]responseSerializer].acceptableContentTypes);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer.acceptableContentTypes =
    AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
    response.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];
    manager.responseSerializer = response;
;
    
    [manager POST:@"http://app.peopleapp.com/Api/622/HomeApi/getContentList" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"返回数据%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error%@",error);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getListOfNews];
}

@end
