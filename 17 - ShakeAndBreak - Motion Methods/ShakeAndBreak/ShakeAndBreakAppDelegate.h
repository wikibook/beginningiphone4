//
//  ShakeAndBreakAppDelegate.h
//  ShakeAndBreak
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShakeAndBreakViewController;

@interface ShakeAndBreakAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ShakeAndBreakViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ShakeAndBreakViewController *viewController;

@end
