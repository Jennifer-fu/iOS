//
//  JFRandomNumberGenerator.m
//  NumberGuessor
//
//  Created by Jennifer on 1/13/13.
//  Copyright (c) 2013 Jennifer. All rights reserved.
//

#import "JFRandomNumberGenerator.h"

@implementation JFRandomNumberGenerator

- (NSArray *)run1
{
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:4];
    for (int i = 0; i < 4; i++) {
        NSNumber *randomNumber = [NSNumber numberWithInt:arc4random() % 9];
        if(![result containsObject:randomNumber])
            [result addObject:randomNumber];
        else i--;
    }
    return result;
    
}

@end
