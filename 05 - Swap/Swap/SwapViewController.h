//
//  SwapViewController.h
//  Swap
//
//  Created by Elisha on 11. 5. 9..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define degreesToRadians(x) (M_PI * (x) / 180.0)

@interface SwapViewController : UIViewController {
    UIView *landscape;
    UIView *portrait;
    
    // Foo
    UIButton *landscapeFooButton;
    UIButton *portraitFooButton;
    
    // Bar
    UIButton *landscapeBarButton;
    UIButton *portraitBarButton;
}

@property (nonatomic, retain) IBOutlet UIView *landscape;
@property (nonatomic, retain) IBOutlet UIView *portrait;
@property (nonatomic, retain) IBOutlet UIButton *landscapeFooButton;
@property (nonatomic, retain) IBOutlet UIButton *portraitFooButton;
@property (nonatomic, retain) IBOutlet UIButton *landscapeBarButton;
@property (nonatomic, retain) IBOutlet UIButton *portraitBarButton;
- (IBAction)buttonPressed:(id)sender;
@end
