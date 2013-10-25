//
//  CheckPleaseViewController.m
//  CheckPlease
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CheckPleaseViewController.h"
#import "CheckMarkRecognizer.h"
@implementation CheckPleaseViewController

@synthesize label;

- (void)doCheck:(CheckMarkRecognizer *)check {
    label.text = @"Checkmark";
    [self performSelector:@selector(eraseLabel)
               withObject:nil afterDelay:1.6];    
}

- (void)eraseLabel {
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
    CheckMarkRecognizer *check = [[[CheckMarkRecognizer alloc] initWithTarget:self
                                                                       action:@selector(doCheck:)] autorelease];
    [self.view addGestureRecognizer:check];
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

@end
