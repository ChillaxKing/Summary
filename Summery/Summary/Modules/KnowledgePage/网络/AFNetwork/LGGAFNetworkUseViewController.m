//
//  LGGAFNetworkUseViewController.m
//  Summary
//
//  Created by 路岗 on 2019/1/15.
//  Copyright © 2019年 Gang. All rights reserved.
//
#import <AFNetworking.h>
#import "LGGAFNetworkUseViewController.h"

@interface LGGAFNetworkUseViewController ()

@end
@implementation LGGAFNetworkUseViewController

+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"网络" withTitle:@"AFNetworjk返回类型application/json,text/jsond,text/javascript" withClassName:@"LGGAFNetworkUseViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self getListDangDang];
//    [self getListPeopleapp];
}
//http://api.dangdang.com/mixservice/gateway/mix_data?ct=iphone&cv=8.10.0&user_client=iphone&client_version=8.10.0&union_id=537-50&permanent_id=20181022221519203543776518154379013&udid=554D2C6F144602A9FD2FF97398FE3F4D&time_code=9F1836300BF0322B7C6AE77A19BC2294&timestamp=1547560084&global_province_id=111&action=mix_data&&page_id=759079_32362973

//acceptableContentTypes 支持的服务端返回的格式 @"application/json", @"text/json", @"text/javascript"
//当当网，get  response content-type application/json
-(void)getListDangDang{
//    NSDictionary *parameters = @{};
    NSString *url = @"http://api.dangdang.com/mixservice/gateway/mix_data?ct=iphone&cv=8.10.0&user_client=iphone&client_version=8.10.0&union_id=537-50&permanent_id=20181022221519203543776518154379013&udid=554D2C6F144602A9FD2FF97398FE3F4D&time_code=9F1836300BF0322B7C6AE77A19BC2294&timestamp=1547560084&global_province_id=111&action=mix_data&&page_id=759079_32362973";

    [[AFHTTPSessionManager manager]GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error%@",error);
    }];
}
//get request
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
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager new];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    [manager POST:@"http://app.peopleapp.com/Api/622/HomeApi/getContentList" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"返回数据%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error%@",error);
    }];
}

-(void)getLisWihtSession{
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
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://app.peopleapp.com/Api/622/HomeApi/getContentList"]];
    request.HTTPMethod = @"POST";
    NSLog(@"http headfield%@ ",request.allHTTPHeaderFields);
    
}
@end
