//
//  JFGuessViewController.m
//  NumberGuessor
//
//  Created by Jennifer on 1/15/13.
//  Copyright (c) 2013 Jennifer. All rights reserved.
//

#import "JFGuessViewController.h"
#import "JFNumberGuessor.h"
#import "JFRandomNumberGenerator.h"

@interface JFGuessViewController ()

@end

@implementation JFGuessViewController{
    JFNumberGuessor *guessor;
}
@synthesize result;
@synthesize input;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        JFRandomNumberGenerator *generator = [[JFRandomNumberGenerator alloc]init];
        guessor = [[JFNumberGuessor alloc]initWithRandomNumberGenerator:generator];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setInput:nil];
    [self setResult:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)guess:(id)sender {
    NSArray *guessNumber = [[input text] componentsSeparatedByString:@""];
    NSString *prompt = [guessor guessWith:guessNumber];
    [result setText:prompt];
}
@end
