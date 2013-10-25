//
//  CheckMarkRecognizer.h
//  CheckPlease
//
//  Created by Elisha on 11. 5. 13..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CheckMarkRecognizer : UIGestureRecognizer {
    CGPoint     lastPreviousPoint;
    CGPoint     lastCurrentPoint;
    CGFloat     lineLengthSoFar;
    
}

@end
