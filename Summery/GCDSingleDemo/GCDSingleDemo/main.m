//
//  main.m
//  GCDSingleDemo
//
//  Created by 路岗 on 2018/12/11.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World1!");
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"Hello, World2!");
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"Hello, World3!");
            });
            NSLog(@"Hello, World6!");
            
        });
        NSLog(@"Hello, World4!");
//        while (1) {
//
//        }
        NSLog(@"Hello, World5!");
    }
    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    

}
