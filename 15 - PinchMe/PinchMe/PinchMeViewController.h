//
//  PinchMeViewController.h
//  PinchMe
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinchMeViewController : UIViewController {
    UILabel *label;
    CGFloat initialFontSize;
}
@property (nonatomic, retain) IBOutlet UILabel *label;
@property CGFloat initialFontSize;
@end
