//
//  DisclosureButtonController.h
//  Nav
//
//  Created by Elisha on 11. 5. 10..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"
@class DisclosureDetailController;
@interface DisclosureButtonController : SecondLevelViewController  {
    NSArray    *list;
    DisclosureDetailController *childController;
}
@property (nonatomic, retain) NSArray *list;
@end
