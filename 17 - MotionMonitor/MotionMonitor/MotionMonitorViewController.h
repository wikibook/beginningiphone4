//
//  MotionMonitorViewController.h
//  MotionMonitor
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
@interface MotionMonitorViewController : UIViewController {
    CMMotionManager *motionManager;
    UILabel *accelerometerLabel;
    UILabel *gyroscopeLabel;
}
@property (nonatomic, retain) CMMotionManager *motionManager;
@property (nonatomic, retain) IBOutlet UILabel *accelerometerLabel;
@property (nonatomic, retain) IBOutlet UILabel *gyroscopeLabel;

@end
