//
//  JFGuessViewController.h
//  NumberGuessor
//
//  Created by Jennifer on 1/15/13.
//  Copyright (c) 2013 Jennifer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFGuessViewController : UIViewController<UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *result;
@property (strong, nonatomic) IBOutlet UITextField *input;
- (IBAction)reset:(id)sender;

- (IBAction)guess:(id)sender;
@end
