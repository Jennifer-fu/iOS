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
    int count;
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

- (void) reset
{
    JFRandomNumberGenerator *generator = [[JFRandomNumberGenerator alloc]init];
    guessor = [[JFNumberGuessor alloc]initWithRandomNumberGenerator:generator];
    count = 6;
    result.text = @"result";
    input.text = @"";
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
    if (count<1) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Failed" message:@"Game Over!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Try Again", nil];
        [alert show];
 
    }else{
        NSArray *guessNumber = [self split:[input text]];
        NSString *prompt = [guessor guessWith:guessNumber];
        if ([prompt isEqualToString:@"4A0B"]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Congratulations!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Try Again", nil];
            [alert show];
        }
        result.text=prompt;
        count--;
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

- (NSArray *) split:(NSString *)target
{
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:4];
    NSNumberFormatter *formater = [[NSNumberFormatter alloc]init];
    [formater setNumberStyle:NSNumberFormatterDecimalStyle];
    for (int i = 0; i < target.length; i++) {
        NSNumber *num = [formater numberFromString:[target substringWithRange:NSMakeRange(i, 1)]];
        [array addObject:num];
    }
    return array;
}
@end
