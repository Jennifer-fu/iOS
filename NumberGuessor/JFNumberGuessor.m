//
//  JFNumberGuessor.m
//  NumberGuessor
//
//  Created by Jennifer on 1/13/13.
//  Copyright (c) 2013 Jennifer. All rights reserved.
//

#import "JFNumberGuessor.h"

@implementation JFNumberGuessor{
    NSArray * answer;
    int count;
}

- (id)initWithRandomNumberGenerator:(JFRandomNumberGenerator *)generator
{
    self = [super init];
    if(self)
    {
        answer = [[generator generate] copy];
        count = 6;
        NSLog(@"answer is:%@",answer);
    }
    return self;
}

- (NSString *)guessWith:(NSString *)input
{
    NSString *result = [self oneGuessWith:input];
    if ([result isEqualToString:@"4A0B"]) {
        return @"Congratulations!";
    }
    NSLog(@"count is:%d",count);
    if(count == 1)return @"Failed!";
    count--;
    return result;
}

- (int) leftTimes
{
    return count;
}

- (NSString *)oneGuessWith:(NSString *)input
{
    int aCount = 0;
    int bCount = 0;
    NSArray *numbers = [self split:input];
    for (int i = 0; i < [numbers count]; i++) {
        if([[answer objectAtIndex:i] isEqualToNumber: [numbers objectAtIndex:i]])
            aCount++;
        else if([answer containsObject:[numbers objectAtIndex:i]])
            bCount++;
    }
    return [NSString stringWithFormat:@"%dA%dB", aCount, bCount];
}

- (NSArray *) split:(NSString *)target
{
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:4];
    NSNumberFormatter *formater = [[NSNumberFormatter alloc]init];
    [formater setNumberStyle:NSNumberFormatterDecimalStyle];
    for (int i = 0; i < target.length; i++) {
        NSNumber *num = [formater numberFromString:[target substringWithRange:NSMakeRange(i, 1)]];
        [array addObject:num];
    }
    [formater release];
    return [array autorelease];
}

@end
