//
//  Simple_TableViewController.h
//  Simple Table
//
//  Created by Elisha on 11. 5. 10..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Simple_TableViewController : UIViewController 
    <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *listData;
}
@property (nonatomic, retain) NSArray *listData;
@end
