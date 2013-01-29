//
//  NumberGuessorTests.m
//  NumberGuessorTests
//
//  Created by Jennifer on 1/11/13.
//  Copyright (c) 2013 Jennifer. All rights reserved.
//

#import "NumberGuessorTests.h"
#import "JFNumberGuessor.h"
#import <OCMock/OCMock.h>
#import "JFRandomNumberGenerator.h"

@implementation NumberGuessorTests{
    JFNumberGuessor *guessor;
}

- (void)setUp
{
    [super setUp];
    id mockedGenerator = [OCMockObject mockForClass:[JFRandomNumberGenerator class]];
    [[[mockedGenerator stub] andReturn:@[@1,@2,@3,@4]] generate];
    guessor = [[JFNumberGuessor alloc] initWithRandomNumberGenerator:mockedGenerator];
    //[guessor reset];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testShouldReturn4A0BWhenInputCorrect
{
    NSString *result = [guessor guessWith: @"1234"];
    STAssertEqualObjects(@"Congratulations!", result, @"Wrong answer!");
}

- (void)testShouldReturn0A0BWhenInputAreNotMatched
{
    NSString *result = [guessor guessWith:@"5678"];
    STAssertEqualObjects(@"0A0B", result, @"Wrong guess");
}

- (void)testShouldReturn0A1BWhenInputAreNotMatched
{
    NSString *result = [guessor guessWith:@"4678"];
    STAssertEqualObjects(@"0A1B", result, @"Wrong guess");
}

- (void)testShouldReturn1A0BWhenOnlyOneNumberMatched
{
    NSString *result = [guessor guessWith:@"1678"];
    STAssertEqualObjects(@"1A0B", result, @"Wrong guess");
}

- (void)testShouldReturnFailedWhenTrySixTimes
{
    for (int i = 0; i < 5; i++) {
        [guessor guessWith:@"4321"];
        NSLog(@"i is: %d",i);
    }
    NSString *result = [guessor guessWith:@"4321"];
    STAssertEqualObjects(@"Failed!", result, @"Six Times");
}


@end
