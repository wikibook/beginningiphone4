//
//  MotionMonitorAppDelegate.h
//  MotionMonitor
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MotionMonitorViewController;

@interface MotionMonitorAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MotionMonitorViewController *viewController;

@end
