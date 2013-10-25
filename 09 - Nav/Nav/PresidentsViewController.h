//
//  PresidentsViewController.h
//  Nav
//
//  Created by Elisha on 11. 5. 10..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecondLevelViewController.h"

@interface PresidentsViewController : SecondLevelViewController  {
        NSMutableArray *list;
}
@property (nonatomic, retain) NSMutableArray *list;
@end
