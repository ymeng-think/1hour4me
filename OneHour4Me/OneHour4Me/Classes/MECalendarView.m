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
#import "MEMonthlyCalendarView.h"

#define STATUS_BAR_HEIGHT            20.0
#define NAVIGATION_BAR_HEIGHT        44.0
#define MONTH_SELECTION_AREA_HEIGHT  60.0
#define CURRENT_MONTH_VIEW_PADDING_X 20.0
#define CURRENT_MONTH_VIEW_PADDING_Y 5.0
#define CURRENT_MONTH_VIEW_HEIGHT    320.0
#define ERASER_SLOT_Y                325.0

@interface MECalendarView ()

- (void)addCurrentMonth;
- (void)addEraserSlot;
- (void)addMonthlyCalendar;
- (CGFloat)viewWidth;
- (CGFloat)viewHeight;

@end

@implementation MECalendarView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        currentYear = [[MECalendar calendar] currentYear];
        currentMonth = [[MECalendar calendar] currentMonth];
        
        [self addCurrentMonth];
        [self addEraserSlot];
        [self addMonthlyCalendar];
    }
    return self;
}

- (void)addCurrentMonth {
    CGFloat x = CURRENT_MONTH_VIEW_PADDING_X,
            y = CURRENT_MONTH_VIEW_PADDING_Y,
            width = [self viewWidth] - CURRENT_MONTH_VIEW_PADDING_X * 2,
            height = CURRENT_MONTH_VIEW_HEIGHT;
    
    MEMonthView *currentMonthView = [[MEMonthView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    [currentMonthView setYear:currentYear andMonth:currentMonth];
    [self addSubview:currentMonthView];
    [currentMonthView release];
}

- (void)addEraserSlot {
    eraserSlotView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"eraser-slot.png"]];
    CGRect frame = eraserSlotView.frame;
    frame.origin.y = ERASER_SLOT_Y;
    eraserSlotView.frame = frame;
    
    [self addSubview:eraserSlotView];
    [eraserSlotView release];
}

- (void)addMonthlyCalendar {
    CGFloat y = eraserSlotView.frame.origin.y + eraserSlotView.frame.size.height;
    CGRect scrollFrame = CGRectMake(0, y, self.bounds.size.width, self.bounds.size.height - y - STATUS_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT);
    
    MEMonthlyCalendarView *monthlyCalendar = [[MEMonthlyCalendarView alloc] initWithFrame:scrollFrame];
    [monthlyCalendar selectMonth:currentMonth];
    [self addSubview:monthlyCalendar];
    [monthlyCalendar release];
}

- (CGFloat)viewWidth {
    return [UIScreen mainScreen].applicationFrame.size.width;
}

- (CGFloat)viewHeight {
    CGRect screenRect = [UIScreen mainScreen].applicationFrame;
    return screenRect.size.height - NAVIGATION_BAR_HEIGHT;
}

- (void)dealloc {
    [eraserSlotView release];
    
    [super dealloc];
}

@end
