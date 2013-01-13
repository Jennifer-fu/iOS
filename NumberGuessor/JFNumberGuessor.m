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
}

- (id)initWithTarget:(NSArray *) target
{
    self = [super init];
    if(self)
    {
        answer = target;
    }
    return self;
}

- (NSString *)guessWith:(NSArray *)input
{
    int aCount = 0;
    int bCount = 0;
    for (int i = 0; i < [input count]; i++) {
        if([answer objectAtIndex:i] == [input objectAtIndex:i])
            aCount++;
        else if([answer containsObject:[input objectAtIndex:i]])
            bCount++;
    }
    return [NSString stringWithFormat:@"%dA%dB", aCount, bCount];
}

@end
