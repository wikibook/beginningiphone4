//
//  FlipsideViewController.m
//  AppSettings
//
//  Created by Elisha on 11. 5. 10..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"
#import "MainViewController.h"

@implementation FlipsideViewController

@synthesize delegate=_delegate;
@synthesize engineSwitch;
@synthesize warpFactorSlider;

- (void)applicationWillEnterForeground:(NSNotification *)notification {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self refreshFields];
}


- (void)refreshFields {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    engineSwitch.on = [[defaults objectForKey:kWarpDriveKey]
                       isEqualToString:@"Engaged"] ? YES : NO;
    warpFactorSlider.value = [defaults floatForKey:kWarpFactorKey];
    
}
- (IBAction)touchEngineSwitch {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *prefValue = engineSwitch.on ? @"Engaged" : @"Disabled";
    [defaults setObject:prefValue forKey:kWarpDriveKey];
    [defaults synchronize];
}

- (IBAction)touchWarpSlider {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:warpFactorSlider.value forKey:kWarpFactorKey];
    [defaults synchronize];
}

- (void)dealloc
{
    [engineSwitch release];
    [warpFactorSlider release];
    [super dealloc];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super viewDidLoad];
    [self refreshFields];
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillEnterForeground:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:app];
}


- (void)viewDidUnload
{
    self.engineSwitch = nil;
    self.warpFactorSlider = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
