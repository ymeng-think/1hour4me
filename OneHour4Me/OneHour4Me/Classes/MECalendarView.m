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

#define NAVIGATION_BAR_HEIGHT        44.0
#define MONTH_SELECTION_AREA_HEIGHT  60.0
#define CURRENT_MONTH_VIEW_PADDING_X 20.0
#define CURRENT_MONTH_VIEW_PADDING_Y 5.0
#define CURRENT_MONTH_VIEW_HEIGHT    320.0
#define ERASER_SLOT_Y                325.0
#define TAG_ERASER_SLOT              1

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
    [self addSubview:currentMonthView];
    [currentMonthView release];
}

- (void)addEraserSlot {
    UIImage *image = [UIImage imageNamed:@"eraser-slot.png"];
    UIImageView *eraserSlotView = [[UIImageView alloc] initWithImage:image];
    CGRect frame = eraserSlotView.frame;
    frame.origin.y = ERASER_SLOT_Y;
    eraserSlotView.frame = frame;
    eraserSlotView.tag = TAG_ERASER_SLOT;
    
    [self addSubview:eraserSlotView];
    [eraserSlotView release];
}

- (void)addMonthlyCalendar {
    UIView *eraserSlotView = [self viewWithTag:TAG_ERASER_SLOT];
    
    CGFloat y = eraserSlotView.frame.origin.y + eraserSlotView.frame.size.height;
    CGRect scrollFrame = CGRectMake(0, y, self.frame.size.width, self.frame.size.height - y);
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:scrollFrame];
    
    MEMonthlyCalendarView *monthlyCalendar = [[MEMonthlyCalendarView alloc] 
                                              initWithFrame:CGRectMake(0, 0, 0, scrollFrame.size.height)];
    scrollView.contentSize = monthlyCalendar.bounds.size;
    [scrollView addSubview:monthlyCalendar];
    [monthlyCalendar release];
    
    [self addSubview:scrollView];
    [scrollView release];
}

- (CGFloat)viewWidth {
    return [UIScreen mainScreen].applicationFrame.size.width;
}

- (CGFloat)viewHeight {
    CGRect screenRect = [UIScreen mainScreen].applicationFrame;
    return screenRect.size.height - NAVIGATION_BAR_HEIGHT;
}

@end
