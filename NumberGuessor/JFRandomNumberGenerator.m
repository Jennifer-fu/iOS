//
//  JFRandomNumberGenerator.m
//  NumberGuessor
//
//  Created by Jennifer on 1/13/13.
//  Copyright (c) 2013 Jennifer. All rights reserved.
//

#import "JFRandomNumberGenerator.h"

@implementation JFRandomNumberGenerator

- (NSArray *)generate
{
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < 10; i++) {
        [result addObject:[NSNumber numberWithInt:i]];
    }
    
    for (int i = 0; i < 10; i++) {
        int randomPosition = arc4random() % 4;
        [result exchangeObjectAtIndex:randomPosition withObjectAtIndex:i];
    }
    return [result subarrayWithRange:NSMakeRange(0, 4)];
    
}

@end
