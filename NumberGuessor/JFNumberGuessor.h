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

- (id)initWithRandomNumberGenerator:(JFRandomNumberGenerator *) generator;

- (NSString *) guessWith:(NSString *) input;

- (int) leftTimes;

@end
