//
//  WhereAmIAppDelegate.h
//  WhereAmI
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WhereAmIViewController;

@interface WhereAmIAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet WhereAmIViewController *viewController;

@end
