//
//  AppDelegate.m
//  Summery
//
//  Created by 路岗 on 2018/11/12.
//  Copyright © 2018年 Gang. All rights reserved.
//

#import "AppDelegate.h"
#import <CYLTabBarController/CYLTabBarController.h>
//#import <CYLTabBarController/CYLTabBar.h>
#import "LGGKnowledgeTableViewController.h"
#import "LGGDIYFunctionTableViewController.h"

@interface AppDelegate ()
@property (nonatomic,strong)CYLTabBarController *tabBarController;
@property (nonatomic,assign)UIBackgroundTaskIdentifier beginBackGroundTaskId;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSString *string1 = @"aaa";
    NSString *string2 = [string1 copy];
    NSString *string3 = [NSString stringWithFormat:@"dfd%@",launchOptions];
    NSLog(@"string1 %p,string2 %p,string3 %p",string1,string2,string3);
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    [[UIApplication sharedApplication]keyWindow];
    return YES;
}

-(CYLTabBarController *)tabBarController{
    if (_tabBarController == nil) {

        LGGKnowledgeTableViewController *knowledge = [LGGKnowledgeTableViewController new];
        LGGDIYFunctionTableViewController *diyFunction = [LGGDIYFunctionTableViewController new];
        NSDictionary *knowDic = @{CYLTabBarItemTitle:@"知识点",CYLTabBarItemImage:@"tabKnowledge_nor",CYLTabBarItemSelectedImage:@"tabKnowledge_sel"};
        NSDictionary *diyDic = @{CYLTabBarItemTitle:@"定制组件",CYLTabBarItemImage:@"tabDiy_nor",CYLTabBarItemSelectedImage:@"tabDiy_sel"};
        
    //    NSDictionary *cBaseDic =@{
    //                              CYLTabBarItemTitle:@"c语法",
    //                              CYLTabBarItemImage:@"tabDiy_nor",
    //                              CYLTabBarItemSelectedImage:@"tabDiy_sel"
    //                              };
//        UIBezierPath
        UINavigationController *knowNav =[[UINavigationController alloc]initWithRootViewController:knowledge];
        UINavigationController *diyNav = [[UINavigationController alloc]initWithRootViewController:diyFunction];
            _tabBarController = [[CYLTabBarController alloc]initWithViewControllers:@[knowNav,diyNav]  tabBarItemsAttributes:@[knowDic,diyDic]];
    }
    return _tabBarController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    //进行后台任务
    /*
    使用 block 的另一个用处是可以让程序在后台较长久的运行。在以前，当 app 被按 home 键退出后，app 仅有最多 5 秒钟的时候做一些保存或清理资源的工作。但是应用可以调用 UIApplication 的beginBackgroundTaskWithExpirationHandler方法，让 app 最多有 10 分钟的时间在后台长久运行。这个时间可以用来做清理本地缓存，发送统计数据等工作。
    让程序在后台长久运行的示例代码如下：
     */
    [self beginEnterBackground];
}


- (void)beginEnterBackground{
    
    self.beginBackGroundTaskId = [[UIApplication sharedApplication]beginBackgroundTaskWithExpirationHandler:^{
       
        sleep(20);
        NSLog(@"enter background and run");
        [self endBackgroundTask];
    }];
}

- (void)endBackgroundTask{
    
    [[UIApplication sharedApplication]endBackgroundTask:self.beginBackGroundTaskId];
    self.beginBackGroundTaskId = UIBackgroundTaskInvalid;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
