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
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"网络" withTitle:@"AFNetworjk text/html" withClassName:@"LGGAFNetworkUseViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
/*http://app.peopleapp.com/Api/622/HomeApi/getContentList?category_id=1&channel=app%20store&city=北京市&citycode=010&device=B92F4454-3104-4A3E-998F-002EBD8BD4BA&device_model=iPhone&device_os=iOS%2012.1.2&device_product=苹果&device_size=750%2A1334&device_type=2&district=朝阳区&fake_id=3923908&id=2738972&image_height=750&image_wide=1334&interface_code=625&latitude=39.96313123914931&longitude=116.4995548502604&page=1&province=北京市&refresh_tag=0&refresh_time=1547526228&securitykey=d3a7d54b6b08061f1c4085d8371cab88&show_num=20&update_time=0&userId=0&version=6.2.5
 选取的url仅供demo学习使用，请不要用于任何商业用途
 */

//
-(void)getListPeopleapp{
    NSString *url = @"http://app.peopleapp.com/Api/622/HomeApi/getContentList";
    NSString *parameters = @"category_id=1&channel=app%20store&city=北京市&citycode=010&device=B92F4454-3104-4A3E-998F-002EBD8BD4BA&device_model=iPhone&device_os=iOS%2012.1.2&device_product=苹果&device_size=750%2A1334&device_type=2&district=朝阳区&fake_id=3923908&id=2738972&image_height=750&image_wide=1334&interface_code=625&latitude=39.96313123914931&longitude=116.4995548502604&page=1&province=北京市&refresh_tag=0&refresh_time=1547526228&securitykey=d3a7d54b6b08061f1c4085d8371cab88&show_num=20&update_time=0&userId=0&version=6.2.5";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
    request.HTTPBody = [parameters dataUsingEncoding:NSUTF8StringEncoding];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//   manager dataTaskWithRequest:<#(nonnull NSURLRequest *)#> uploadProgress:<#^(NSProgress * _Nonnull uploadProgress)uploadProgressBlock#> downloadProgress:<#^(NSProgress * _Nonnull downloadProgress)downloadProgressBlock#> completionHandler:<#^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error)completionHandler#>
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
