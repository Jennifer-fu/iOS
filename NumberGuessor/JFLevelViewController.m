//
//  JFLevelViewContoller.m
//  NumberGuessor
//
//  Created by Jennifer on 1/31/13.
//  Copyright (c) 2013 Jennifer. All rights reserved.
//

#import "JFLevelViewController.h"

@interface JFLevelViewController ()

@end

@implementation JFLevelViewController
{
    NSMutableArray *levels;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    NSLog(@"1");
    UIPickerView *levelView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    levelView.delegate = self;
    levelView.showsSelectionIndicator = YES;
    self.view = levelView;
    [levelView release];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    levels = [[NSMutableArray alloc]initWithArray:@[@"L",@"M",@"H"]];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return levels.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [levels objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *level = [levels objectAtIndex:row];
    NSUserDefaults *levelDefualts = [NSUserDefaults standardUserDefaults];
    [levelDefualts setObject:level forKey:@"numberGuessLevel"];
}

@end
