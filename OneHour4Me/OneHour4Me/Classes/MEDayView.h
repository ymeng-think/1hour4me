//
//  MEDayView.h
//  OneHour4Me
//
//  Created by Meng Yu on 6/2/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    MEDayStateBad,
    MEDayStateUnknown,
    MEDayStateNone
} MEDayState;


@interface MEDayView : UIView {
    MEDayState state;
    NSInteger day;
}

@property (nonatomic) MEDayState state;
@property (nonatomic) NSInteger day;

@end
