//
//  SwipesViewController.m
//  Swipes
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SwipesViewController.h"
#define kMinimumGestureLength    25
#define kMaximumVariance         5
@implementation SwipesViewController

@synthesize label;
@synthesize gestureStartPoint;

- (void)eraseText {
    label.text = @"";
}

- (void)dealloc
{
    [label release];
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
    UISwipeGestureRecognizer *vertical = [[[UISwipeGestureRecognizer alloc] 
                                           initWithTarget:self action:@selector(reportVerticalSwipe:)] autorelease];
    vertical.direction = UISwipeGestureRecognizerDirectionUp| 
    UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:vertical];
    
    UISwipeGestureRecognizer *horizontal = [[[UISwipeGestureRecognizer alloc] 
                                             initWithTarget:self action:@selector(reportHorizontalSwipe:)] autorelease];
    horizontal.direction = UISwipeGestureRecognizerDirectionLeft| 
    UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:horizontal];
}


- (void)viewDidUnload
{
    self.label = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)reportHorizontalSwipe:(UIGestureRecognizer *)recognizer {
    label.text = @"Horizontal swipe detected";
    [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}

- (void)reportVerticalSwipe:(UIGestureRecognizer *)recognizer {
    label.text = @"Vertical swipe detected";
    [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}

@end
