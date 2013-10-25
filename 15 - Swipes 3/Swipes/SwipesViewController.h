//
//  SwipesViewController.h
//  Swipes
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipesViewController : UIViewController {
    UILabel     *label;
    CGPoint     gestureStartPoint;
}
@property (nonatomic, retain) IBOutlet UILabel *label;
@property CGPoint gestureStartPoint;
- (void)eraseText;
@end
