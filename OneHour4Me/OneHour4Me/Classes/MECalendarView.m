//
//  MECalendarView.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/11/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MECalendar.h"
#import "MECalendarView.h"
#import "MEMonthView.h"

#define NAVIGATION_BAR_HEIGHT   44.0
#define MONTH_SELECTION_AREA_HEIGHT 60.0
#define CURRENT_MONTH_VIEW_PADDING 20.0

@interface MECalendarView ()

- (void)addCurrentMonthView;
- (CGFloat)viewWidth;
- (CGFloat)viewHeight;

@end

@implementation MECalendarView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addCurrentMonthView];
    }
    return self;
}

- (void)addCurrentMonthView {
    CGFloat x = CURRENT_MONTH_VIEW_PADDING,
            y = CURRENT_MONTH_VIEW_PADDING,
            width = [self viewWidth] - CURRENT_MONTH_VIEW_PADDING * 2,
            height = 350.0;
    
    currentMonthView = [[MEMonthView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    currentMonthView.month = [[MECalendar calendar] currentMonth];
    [self addSubview:currentMonthView];
}

- (CGFloat)viewWidth {
    return [UIScreen mainScreen].applicationFrame.size.width;
}

- (CGFloat)viewHeight {
    CGRect screenRect = [UIScreen mainScreen].applicationFrame;
    return screenRect.size.height - NAVIGATION_BAR_HEIGHT;
}

- (void)dealloc {
    [currentMonthView release];

    [super dealloc];
}

@end
