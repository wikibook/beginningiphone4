//
//  ShakeAndBreakViewController.m
//  ShakeAndBreak
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ShakeAndBreakViewController.h"

@implementation ShakeAndBreakViewController
@synthesize motionManager;
@synthesize imageView;
@synthesize fixed;
@synthesize broken;
- (void)dealloc
{
    [motionManager release];
    [imageView release];
    [fixed release];
    [broken release];
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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"glass"
                                                     ofType:@"wav"];
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL
                                                fileURLWithPath:path], &soundID);
    self.fixed = [UIImage imageNamed:@"home.png"];
    self.broken = [UIImage imageNamed:@"homebroken.png"];
    
    imageView.image = fixed;
    
    self.motionManager = [[[CMMotionManager alloc] init] autorelease];
    motionManager.accelerometerUpdateInterval = kUpdateInterval;
    NSOperationQueue *queue = [[[NSOperationQueue alloc] init] autorelease];
    [motionManager startAccelerometerUpdatesToQueue:queue
                                        withHandler:
     ^(CMAccelerometerData *accelerometerData, NSError *error){
         if (error) {
             [motionManager stopAccelerometerUpdates];
         } else {
             if (!brokenScreenShowing) {
                 CMAcceleration acceleration = accelerometerData.acceleration;
                 if (acceleration.x > kAccelerationThreshold
                     || acceleration.y > kAccelerationThreshold
                     || acceleration.z > kAccelerationThreshold) {
                     [imageView performSelectorOnMainThread:@selector(setImage:)
                                                 withObject:broken
                                              waitUntilDone:NO];
                     AudioServicesPlaySystemSound(soundID);
                     brokenScreenShowing = YES;
                 }
             }
         }
     }];
}


- (void)viewDidUnload
{
    self.motionManager = nil;
    self.imageView = nil;
    self.fixed = nil;
    self.broken = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    imageView.image = fixed;
    brokenScreenShowing = NO;
}

@end
