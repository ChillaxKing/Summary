//
//  LGGCalculateTests.m
//  SummaryTests
//
//  Created by 路岗 on 2019/3/20.
//  Copyright © 2019年 Gang. All rights reserved.
//
#import "LGGCalculate.h"
#import <XCTest/XCTest.h>

@interface LGGCalculateTests : XCTestCase
@property (nonatomic,strong)LGGCalculate *cal;
@end

@implementation LGGCalculateTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.cal = [LGGCalculate new];
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSInteger sum = [self.cal sumOneNumber:8 plus:7];
    XCTAssertEqual(sum,15,@"must be 15 !");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
