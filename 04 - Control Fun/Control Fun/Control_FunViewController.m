//
//  Control_FunViewController.m
//  Control Fun
//
//  Created by Elisha on 11. 5. 9..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Control_FunViewController.h"

@implementation Control_FunViewController
@synthesize nameField;
@synthesize numberField;
@synthesize sliderLabel;
@synthesize leftSwitch;
@synthesize rightSwitch;
@synthesize doSomethingButton;

- (IBAction)toggleControls:(id)sender {
    if ([sender selectedSegmentIndex] == kSwitchesSegmentIndex)
    {
        leftSwitch.hidden = NO;
        rightSwitch.hidden = NO;
        doSomethingButton.hidden = YES;
    }
    else
    {
        leftSwitch.hidden = YES;
        rightSwitch.hidden = YES;
        doSomethingButton.hidden = NO;
    }
}

- (IBAction)switchChanged:(id)sender {
    UISwitch *whichSwitch = (UISwitch *)sender;
    BOOL setting = whichSwitch.isOn;
    [leftSwitch setOn:setting animated:YES];
    [rightSwitch setOn:setting animated:YES];
}

- (IBAction)buttonPressed {
    // 할 일 : 액션 시트와 경고창 구현
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Are you sure?"
                                  delegate:self
                                  cancelButtonTitle:@"No Way!"
                                  destructiveButtonTitle:@"Yes, I’m Sure!"
                                  otherButtonTitles:nil];
    [actionSheet showInView:self.view];
    [actionSheet release];

}

- (void)actionSheet:(UIActionSheet *)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex])
    {
        NSString *msg = nil;
        
        if (nameField.text.length > 0)
            msg = [[NSString alloc] initWithFormat:
                   @"You can breathe easy, %@, everything went OK.",
                   nameField.text];
        else
            msg = @"You can breathe easy, everything went OK.";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Something was done"
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"Phew!"
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        [msg release];
    }
}

- (IBAction)sliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)(slider.value + 0.5f);
    NSString *newText = [[NSString alloc] initWithFormat:@"%d",
                         progressAsInt];
    sliderLabel.text = newText;
    [newText release];
}

- (void)dealloc
{
    [nameField release];
    [numberField release];
    [sliderLabel release];
    [leftSwitch release];
    [rightSwitch release];
    [doSomethingButton release];
    [super dealloc];
    
}
- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender {
    [nameField resignFirstResponder];
    [numberField resignFirstResponder];
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
    UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableButtonImageNormal = [buttonImageNormal
                                             stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [doSomethingButton setBackgroundImage:stretchableButtonImageNormal
                                 forState:UIControlStateNormal];
    
    UIImage *buttonImagePressed = [UIImage imageNamed:@"blueButton.png"];
    UIImage *stretchableButtonImagePressed = [buttonImagePressed
                                              stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [doSomethingButton setBackgroundImage:stretchableButtonImagePressed
                                 forState:UIControlStateHighlighted];
    [super viewDidLoad];

}


- (void)viewDidUnload
{
    self.nameField = nil;
    self.numberField = nil;
    self.sliderLabel = nil;
    self.leftSwitch = nil;
    self.rightSwitch = nil;
    self.doSomethingButton = nil;
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
