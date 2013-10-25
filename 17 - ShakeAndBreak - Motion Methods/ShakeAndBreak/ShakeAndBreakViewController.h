//
//  ShakeAndBreakViewController.h
//  ShakeAndBreak
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ShakeAndBreakViewController : UIViewController {
    UIImageView *imageView;
    
    BOOL brokenScreenShowing; 
    SystemSoundID soundID;
    UIImage *fixed;
    UIImage *broken;
}
@property (nonatomic, retain) IBOutlet UIImageView *imageView; 
@property (nonatomic, retain) UIImage *fixed;
@property (nonatomic, retain) UIImage *broken;

@end
