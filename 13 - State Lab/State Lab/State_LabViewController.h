//
//  State_LabViewController.h
//  State Lab
//
//  Created by Elisha on 11. 5. 12..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface State_LabViewController : UIViewController {
    BOOL animate;
    UILabel *label;
    UIImage *smiley;
    UIImageView *smileyView;
    UISegmentedControl *segmentedControl;
}
@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UIImage *smiley;
@property (nonatomic, retain) UIImageView *smileyView;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;
@end
