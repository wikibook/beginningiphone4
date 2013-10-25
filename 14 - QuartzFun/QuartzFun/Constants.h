//
//  Constants.h
//  QuartzFun
//
//  Created by Elisha on 11. 5. 12..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
typedef enum {
    kLineShape = 0,
    kRectShape,
    kEllipseShape,
    kImageShape
} ShapeType;

typedef enum {
    kRedColorTab = 0,
    kBlueColorTab,
    kYellowColorTab,
    kGreenColorTab,
    kRandomColorTab
} ColorTabIndex;

#define degreesToRadian(x) (M_PI * (x) / 180.0)
