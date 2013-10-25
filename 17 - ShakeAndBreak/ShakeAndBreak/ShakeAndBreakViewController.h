//
//  ShakeAndBreakViewController.h
//  ShakeAndBreak
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import <AudioToolbox/AudioToolbox.h>

#define kAccelerationThreshold       1.7
#define kUpdateInterval              (1.0f/10.0f)
@interface ShakeAndBreakViewController : UIViewController <UIAccelerometerDelegate> {
    UIImageView *imageView;
    
    CMMotionManager *motionManager;
    BOOL brokenScreenShowing;
    SystemSoundID soundID;
    UIImage *fixed;
    UIImage *broken;
}
@property (nonatomic, retain) CMMotionManager *motionManager;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) UIImage *fixed;
@property (nonatomic, retain) UIImage *broken;
@end
