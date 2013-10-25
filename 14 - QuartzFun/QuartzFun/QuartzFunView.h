//
//  QuartzFunView.h
//  QuartzFun
//
//  Created by Elisha on 11. 5. 12..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface QuartzFunView : UIView {
    CGPoint firstTouch;
    CGPoint lastTouch;
    UIColor *currentColor;
    ShapeType shapeType;
    UIImage *drawImage;
    BOOL useRandomColor;
    CGRect redrawRect;
}
@property (nonatomic) CGPoint firstTouch;
@property (nonatomic) CGPoint lastTouch;
@property (nonatomic, retain) UIColor *currentColor;
@property (nonatomic) ShapeType shapeType;
@property (nonatomic, retain) UIImage *drawImage;
@property (nonatomic) BOOL useRandomColor;
@property CGRect redrawRect;


@end
