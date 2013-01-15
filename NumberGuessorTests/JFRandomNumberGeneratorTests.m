//
//  JFRandomNumberGeneratorTests.m
//  NumberGuessor
//
//  Created by Jennifer on 1/13/13.
//  Copyright (c) 2013 Jennifer. All rights reserved.
//

#import "JFRandomNumberGeneratorTests.h"
#import "JFRandomNumberGenerator.h"

@implementation JFRandomNumberGeneratorTests{
    JFRandomNumberGenerator *generator;
}

- (void)setUp
{
    [super setUp];
    generator = [[JFRandomNumberGenerator alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testShouldGenerate4RandomNumberRangeIn0To9
{
    NSArray * result = [generator run1];
    int count = [result count];
    STAssertEquals(4, count, @"Random number count should be 4!");
    for (int i = 0; i < count; i++) {
        NSNumber *number = [result objectAtIndex:i];
        STAssertTrue([number intValue] >= 0, @"Random number should be greater than 0");
        STAssertTrue([number intValue] <= 9, @"Random number should be less than 9");
    }
}

- (void)testShouldGenerate4RandomNumberWithoutDuplication
{
    NSArray * result = [generator run1];
    int count = [result count];
    STAssertEquals(4, count, @"Random number count should be 4!");
    STAssertTrue([[result objectAtIndex:0] intValue]!=[[result objectAtIndex:1] intValue]!=[[result objectAtIndex:2] intValue]!=[[result objectAtIndex:3] intValue], @"duplication");
}


@end
