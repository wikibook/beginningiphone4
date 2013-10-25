//
//  MotionMonitorViewController.m
//  MotionMonitor
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MotionMonitorViewController.h"

@implementation MotionMonitorViewController
@synthesize motionManager;
@synthesize accelerometerLabel;
@synthesize gyroscopeLabel;

- (void)dealloc
{
    [motionManager release];
    [accelerometerLabel release];
    [gyroscopeLabel release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.motionManager = [[[CMMotionManager alloc] init] autorelease];
    NSOperationQueue *queue = [[[NSOperationQueue alloc] init] autorelease];
    if (motionManager.accelerometerAvailable) {
        motionManager.accelerometerUpdateInterval = 1.0/10.0;
        [motionManager startAccelerometerUpdatesToQueue:queue withHandler:
         ^(CMAccelerometerData *accelerometerData, NSError *error){
             NSString *labelText;
             if (error) {
                 [motionManager stopAccelerometerUpdates];
                 labelText = [NSString stringWithFormat:
                              @"Accelerometer encountered error: %@", error];
             } else {
                 labelText = [NSString stringWithFormat:
                              @"Accelerometer\n-----------\nx: %+.2f\ny: %+.2f\nz: %+.2f", 
                              accelerometerData.acceleration.x, 
                              accelerometerData.acceleration.y, 
                              accelerometerData.acceleration.z];
             }
             [accelerometerLabel performSelectorOnMainThread:@selector(setText:) 
                                                  withObject:labelText 
                                               waitUntilDone:YES];
         }];
    } else {
        accelerometerLabel.text = @"This device has no accelerometer.";
    }
    if (motionManager.gyroAvailable) {
        motionManager.gyroUpdateInterval = 1.0/10.0;
        [motionManager startGyroUpdatesToQueue:queue withHandler:
         ^(CMGyroData *gyroData, NSError *error) {
             NSString *labelText;
             if (error) {
                 [motionManager stopGyroUpdates];
                 labelText = [NSString stringWithFormat:
                              @"Gyroscope encountered error: %@", error];
             } else {
                 labelText = [NSString stringWithFormat:
                              @"Gyroscope\n--------\nx: %+.2f\ny: %+.2f\nz: %+.2f", 
                              gyroData.rotationRate.x, 
                              gyroData.rotationRate.y, 
                              gyroData.rotationRate.z];
             }
             [gyroscopeLabel performSelectorOnMainThread:@selector(setText:) 
                                              withObject:labelText 
                                           waitUntilDone:YES];
         }];
    } else {
        gyroscopeLabel.text = @"This device has no gyroscope";
    }
}


- (void)viewDidUnload
{
    self.motionManager = nil;
    self.accelerometerLabel = nil;
    self.gyroscopeLabel = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
