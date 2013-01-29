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
        [self reset];
    }
    return self;
}

- (IBAction)reset:(id)sender
{
    [self reset];
}

- (void) reset
{
    JFRandomNumberGenerator *generator = [[JFRandomNumberGenerator alloc]init];
    guessor = [[JFNumberGuessor alloc]initWithRandomNumberGenerator:generator];
    result.text = @"result";
    input.text = @"";
    [generator release];
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

-(void)dealloc
{
    [super dealloc];
    [guessor release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)guess:(id)sender {
    NSString *prompt = [guessor guessWith:[input text]];
    
    if([prompt isEqualToString:@"Failed!"])
    {
        result.text = prompt;
        
        
    }
    else if([prompt isEqualToString:@"Congratulations!"])
    {
        result.text = prompt;
    }
    else
    {
        result.text=[NSString stringWithFormat:@"Result is %@, you have %d time(s) left.",prompt, [guessor leftTimes]];
    }
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
    }
    else if(buttonIndex==1)
    {
        [self reset];
    }
}

@end
