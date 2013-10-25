//
//  SlowWorkerAppDelegate.h
//  SlowWorker
//
//  Created by Elisha on 11. 5. 12..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SlowWorkerViewController;

@interface SlowWorkerAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SlowWorkerViewController *viewController;

@end
