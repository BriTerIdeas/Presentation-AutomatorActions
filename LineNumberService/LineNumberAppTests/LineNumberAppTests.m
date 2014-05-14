//
//  LineNumberAppTests.m
//  LineNumberAppTests
//
//  Created by Brian Slick on 5/13/14.
//  Copyright (c) 2014 BriTer Ideas LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StringProcessor.h"

@interface LineNumberAppTests : XCTestCase

@end

@implementation LineNumberAppTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Test 1

- (void)testThatLineNumbersAreAdded
{
    NSBundle *bundle = [NSBundle mainBundle];
	NSURL *inputURL = [bundle URLForResource:@"test1input-AddLineNumbers" withExtension:@"txt"];
    NSURL *outputURL = [bundle URLForResource:@"test1output" withExtension:@"txt"];
    
	NSString *inputString = [[NSString alloc] initWithContentsOfURL:inputURL encoding:NSUTF8StringEncoding error:nil];
    NSString *outputStringReference = [[NSString alloc] initWithContentsOfURL:outputURL encoding:NSUTF8StringEncoding error:nil];
    
	NSString *outputString = [StringProcessor formattedOutputFromInput:inputString];
    
    XCTAssertEqualObjects(outputString, outputStringReference, @"Line numbers should have been added");
}

#pragma mark - Test 2

- (void)testThatTextIsLeftJustified
{
    NSBundle *bundle = [NSBundle mainBundle];
	NSURL *inputURL = [bundle URLForResource:@"test2input-LeftJustifyText" withExtension:@"txt"];
    NSURL *outputURL = [bundle URLForResource:@"test2output" withExtension:@"txt"];
    
	NSString *inputString = [[NSString alloc] initWithContentsOfURL:inputURL encoding:NSUTF8StringEncoding error:nil];
    NSString *outputStringReference = [[NSString alloc] initWithContentsOfURL:outputURL encoding:NSUTF8StringEncoding error:nil];
    
	NSString *outputString = [StringProcessor formattedOutputFromInput:inputString];
    
    XCTAssertEqualObjects(outputString, outputStringReference, @"Text should be left justified");
}

@end
