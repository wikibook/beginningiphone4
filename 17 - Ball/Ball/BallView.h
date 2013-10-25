//
//  BallView.h
//  Ball
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface BallView : UIView {
    UIImage        *image;
    
    CGPoint        currentPoint;
    CGPoint        previousPoint;
    CMAcceleration acceleration;
    CGFloat        ballXVelocity;
    CGFloat        ballYVelocity;
}
@property (nonatomic, retain) UIImage *image;
@property CGPoint currentPoint;
@property CGPoint previousPoint;
@property (nonatomic, assign) CMAcceleration acceleration;
@property CGFloat ballXVelocity;
@property CGFloat ballYVelocity;
- (void)draw;
@end
