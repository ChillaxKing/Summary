//
//  main.m
//  Summery
//
//  Created by 路岗 on 2018/11/12.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import "AppDelegate.h"
//#import "ReapterNumber/ReapterNumber.h"
//#import "ReverseArray/ReverseArray.h"
NSMutableArray *__viewcontrollersMulArray = [NSMutableArray new];

int main(int argc, char * argv[]) {
    @autoreleasepool {
        //找出两个相同的数
//        ReapterNumber *reapter = [ReapterNumber new];
//        int number = [reapter findReapterNumber:@[@100,@121,@10000,@443,@121,@10]];
//        NSLog(@"%d",number);
//
//        ReverseArray *reverse = [ReverseArray new];
//        NSArray *resultArray = [reverse reverseArray:@[@1,@2,@3,@4,@5] another:@[@2,@3,@4,@5,@6,@7]];
//        NSLog(@"%@",resultArray);
//
        
        /*引用
         指针：指针内部存储的是一个地址的对象，指针可以指向nil；
         引用：相当于一个对象的别名，引用在声明的时候必须初始化，并且只能初始化一次，引用的地址不可以改变。
         在使用中，引用不需要做非空检查。
        int a,&r = a,b;
        a = 3;
        NSLog(@"%d",r);
        b = 4 ;
        r = b;
        NSLog(@"r%d a%d",r,a);
        NSLog(@"r%d a%d",r,a);
         
         */
        
        NSLog(@"%@",@(YES||NO&&NO));
        NSLog(@"%@",@(NO&&NO||YES));
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
