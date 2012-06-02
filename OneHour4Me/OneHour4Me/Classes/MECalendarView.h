//
//  MECalendarView.h
//  OneHour4Me
//
//  Created by Meng Yu on 5/11/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MEBackgroundView.h"
#import "MEMonthView.h"

@interface MECalendarView : MEBackgroundView {
    MEMonthView *currentMonthView;
}

@end
