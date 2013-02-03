//
//  JFSettingsViewController.m
//  NumberGuessor
//
//  Created by Jennifer on 1/29/13.
//  Copyright (c) 2013 Jennifer. All rights reserved.
//

#import "JFSettingsViewController.h"
#import "JFSettingsView.h"
#import "JFLevelViewController.h"

@interface JFSettingsViewController ()

@end

@implementation JFSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)loadView
{
    JFSettingsView *settingsView = [[JFSettingsView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    [settingsView.level addTarget:self action:@selector(showLevels:) forControlEvents:UIControlEventTouchDown];
    
    self.view = settingsView;
    [settingsView release];
}


- (IBAction) showLevels:(id) sender
{
    JFLevelViewController *levelController = [[JFLevelViewController alloc]initWithNibName:@"level" bundle:nil];

    [[self navigationController] pushViewController:levelController animated:YES];

    [levelController release];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
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

@end
