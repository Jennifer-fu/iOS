//
//  NumberGuessorTests.m
//  NumberGuessorTests
//
//  Created by Jennifer on 1/11/13.
//  Copyright (c) 2013 Jennifer. All rights reserved.
//

#import "NumberGuessorTests.h"
#import "JFNumberGuessor.h"

@implementation NumberGuessorTests{
    JFNumberGuessor *guessor;
}

- (void)setUp
{
    [super setUp];
    guessor = [[JFNumberGuessor alloc] initWithTarget:@[@1,@2,@3,@4]];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testShouldReturn4A0BWhenInputCorrect
{
    NSString *result = [guessor guessWith: @[ @1,@2,@3,@4 ]];
    STAssertEqualObjects(@"4A0B", result, @"Wrong answer!");
}

- (void)testShouldReturn0A0BWhenInputAreNotMatched
{
    NSString *result = [guessor guessWith:@[@5,@6,@7,@8]];
    STAssertEqualObjects(@"0A0B", result, @"Wrong guess");
}

- (void)testShouldReturn0A1BWhenInputAreNotMatched
{
    NSString *result = [guessor guessWith:@[@4,@6,@7,@8]];
    STAssertEqualObjects(@"0A1B", result, @"Wrong guess");
}

@end
