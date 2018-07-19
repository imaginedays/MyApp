//
//  MyAppTests.m
//  MyAppTests
//
//  Created by 黄可 on 2018/7/19.
//  Copyright © 2018年 Robin Wong. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PersonInfomation.h"
#import "ViewController.h"

@interface MyAppTests : XCTestCase
@property (nonatomic, strong) ViewController *vc;    //!< 属性名称
@end

@implementation MyAppTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.vc = [[ViewController alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.vc = nil;
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPersonAgeInfo {
    PersonInfomation *person = [[PersonInfomation alloc]init];
    person.age = @"20";
    [self checkAge:person];
}

- (void)checkAge:(PersonInfomation *)person {
    XCTAssert([person.age integerValue] > 0 && [person.age integerValue] <= 110,@"姓名不合法--0<age<=110认为是合法");
}

- (void)testSetViewControllerAge {
    self.vc.age = (30);
    XCTAssert(self.vc.age > 0 && self.vc.age <= 110,@"姓名不合法--0<age<=110认为是合法");
}

- (void)testViewControllerNotNil {
    XCTAssertNotNil(self.vc.view,@"view为Nil");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        NSMutableArray * mutArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 9999; i++) {
            NSObject * object = [[NSObject alloc] init];
            [mutArray addObject:object];
        }
    }];
}

@end
