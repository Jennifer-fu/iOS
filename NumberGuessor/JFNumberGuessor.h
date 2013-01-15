//
//  JFNumberGuessor.h
//  NumberGuessor
//
//  Created by Jennifer on 1/13/13.
//  Copyright (c) 2013 Jennifer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JFRandomNumberGenerator.h"

@interface JFNumberGuessor : NSObject

- (id)initWithTarget:(NSArray *) target;

- (id)initWithRandomNumberGenerator:(JFRandomNumberGenerator *) generator;

- (NSString *) guessWith:(NSArray *) input;

@end
