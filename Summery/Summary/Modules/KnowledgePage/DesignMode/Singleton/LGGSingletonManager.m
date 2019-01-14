//
//  LGGSingletonManager.m
//  Summary
//
//  Created by 路岗 on 2018/11/19.
//  Copyright © 2018年 Gang. All rights reserved.
//
/*
 单例模式的作用
 可以保证在程序运行过程，一个类只有一个实例，而且该实例易于供外界访问
 从而方便地控制了实例个数，并节约系统资源
 
 单例模式的使用场合
 在整个应用程序中，共享一份资源（这份资源只需要创建初始化1次），一般用于工具类。例如：登陆控制器，网络数据请求，音乐播放器等一个工程需要使用多次的控制器或方法。
 
 单例模式的优缺点
 优点：
 单例模式可以保证系统中一个类只有一个实例而且该实例易于外界访问，从而方便对实例个数的控制并节约系统资源。
 如果希望在系统中某个类的对象只能存在一个，单例模式是最好的解决方案。
 单例模式因为类控制了实例化过程，所以类可以更加灵活修改实例化过程。
 缺点：
 单例对象一旦建立，对象指针是保存在静态区的，单例对象在堆中分配的内存空间，会在应用程序终止后才会被释放。
 单例类无法继承，因此很难进行类的扩展。
 单例不适用于变化的对象，如果同一类型的对象总是要在不同的用例场景发生变化，单例就会引起数据的错误，不能保存彼此的状态。
 
 注意：我们在使用单例类之前，一定要考虑好单例类是否适合和类以后的扩展性，避免盲目滥用单例
 
 作者：xx_cc
 链接：https://www.jianshu.com/p/4867dc92337e
 來源：简书
 简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。

 */
#import "LGGSingletonManager.h"
static LGGSingletonManager *_shareManger = nil;
@implementation LGGSingletonManager
+ (instancetype)shareManager{
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        _shareManger = [[LGGSingletonManager alloc]init];
    });
    return _shareManger;
    
}
@end
