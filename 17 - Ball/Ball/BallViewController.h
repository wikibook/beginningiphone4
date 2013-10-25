//
//  BallViewController.h
//  Ball
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

#define kUpdateInterval    (1.0f/60.0f)
@interface BallViewController : UIViewController {
        CMMotionManager *motionManager;
}
@property (nonatomic, retain) CMMotionManager *motionManager;
@end
