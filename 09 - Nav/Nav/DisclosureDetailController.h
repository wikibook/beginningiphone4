//
//  DisclosureDetailController.h
//  Nav
//
//  Created by Elisha on 11. 5. 10..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisclosureDetailController : UIViewController  {
    UILabel    *label;
    NSString   *message;
}
@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, copy) NSString *message;
@end
