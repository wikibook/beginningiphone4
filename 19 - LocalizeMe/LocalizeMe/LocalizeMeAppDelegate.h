//
//  LocalizeMeAppDelegate.h
//  LocalizeMe
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LocalizeMeViewController;

@interface LocalizeMeAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet LocalizeMeViewController *viewController;

@end
