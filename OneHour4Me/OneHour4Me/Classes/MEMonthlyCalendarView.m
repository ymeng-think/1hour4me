//
//  MEMonthlyCalendarView.m
//  OneHour4Me
//
//  Created by Meng Yu on 6/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEMonthlyCalendarView.h"

#define MONTHLY_CALENDAR_WIDTH  54.0
#define MONTH_NUM               12
#define PADDING                 20.0

@implementation MEMonthlyCalendarView

- (id)initWithFrame:(CGRect)frame {
    CGFloat width = MONTHLY_CALENDAR_WIDTH * MONTH_NUM + PADDING * (MONTH_NUM - 1);
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height)];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

@end
