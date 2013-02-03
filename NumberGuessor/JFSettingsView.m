//
//  JFSettingsView.m
//  NumberGuessor
//
//  Created by Jennifer on 1/29/13.
//  Copyright (c) 2013 Jennifer. All rights reserved.
//

#import "JFSettingsView.h"

@implementation JFSettingsView

@synthesize level;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        level = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [level setFrame:CGRectMake(110, 30, 100, 30)];
        [level setTitle:@"Level" forState:UIControlStateNormal];
        
        [self addSubview:level];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
