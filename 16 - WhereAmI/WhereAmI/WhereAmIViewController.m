//
//  WhereAmIViewController.m
//  WhereAmI
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WhereAmIViewController.h"

@implementation WhereAmIViewController
@synthesize locationManager;
@synthesize startingPoint;
@synthesize latitudeLabel;
@synthesize longitudeLabel;
@synthesize horizontalAccuracyLabel;
@synthesize altitudeLabel;
@synthesize verticalAccuracyLabel;
@synthesize distanceTraveledLabel;

#pragma mark -
- (void)viewDidLoad {
    self.locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}

- (void)dealloc
{
    [locationManager release];
    [startingPoint release];
    [latitudeLabel release];
    [longitudeLabel release];
    [horizontalAccuracyLabel release];
    [altitudeLabel release];
    [verticalAccuracyLabel release];
    [distanceTraveledLabel release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle





- (void)viewDidUnload
{
    self.locationManager = nil;
    self.latitudeLabel = nil;
    self.longitudeLabel = nil;
    self.horizontalAccuracyLabel = nil;
    self.altitudeLabel = nil;
    self.verticalAccuracyLabel = nil;
    self.distanceTraveledLabel= nil;
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
#pragma mark CLLocationManagerDelegate Methods
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    
    if (startingPoint == nil)
        self.startingPoint = newLocation;
    
    NSString *latitudeString = [[NSString alloc] initWithFormat:@"%g\u00B0",
                                newLocation.coordinate.latitude];
    latitudeLabel.text = latitudeString;
    [latitudeString release];
    
    NSString *longitudeString = [[NSString alloc] initWithFormat:@"%g\u00B0",
                                 newLocation.coordinate.longitude];
    longitudeLabel.text = longitudeString;
    [longitudeString release];
    
    NSString *horizontalAccuracyString = [[NSString alloc]
                                          initWithFormat:@"%gm",
                                          newLocation.horizontalAccuracy];
    horizontalAccuracyLabel.text = horizontalAccuracyString;
    [horizontalAccuracyString release];
    
    NSString *altitudeString = [[NSString alloc] initWithFormat:@"%gm",
                                newLocation.altitude];
    altitudeLabel.text = altitudeString;
    [altitudeString release];
    
    NSString *verticalAccuracyString = [[NSString alloc]
                                        initWithFormat:@"%gm",
                                        newLocation.verticalAccuracy];
    verticalAccuracyLabel.text = verticalAccuracyString;
    [verticalAccuracyString release];
    
    CLLocationDistance distance = [newLocation
                                   distanceFromLocation:startingPoint];
    NSString *distanceString = [[NSString alloc]
                                initWithFormat:@"%gm", distance];
    distanceTraveledLabel.text = distanceString;
    [distanceString release];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    
    NSString *errorType = (error.code == kCLErrorDenied) ?
    @"Access Denied" : @"Unknown Error";
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Error getting Location"
                          message:errorType
                          delegate:nil
                          cancelButtonTitle:@"Okay"
                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

@end
