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

#define NAVIGATION_BAR_HEIGHT        44.0
#define MONTH_SELECTION_AREA_HEIGHT  60.0
#define CURRENT_MONTH_VIEW_PADDING_X 20.0
#define CURRENT_MONTH_VIEW_PADDING_Y 5.0
#define CURRENT_MONTH_VIEW_HEIGHT    320.0
#define ERASER_SLOT_Y                325.0

@interface MECalendarView ()

- (void)addCurrentMonthView;
- (void)addEraserSlot;
- (CGFloat)viewWidth;
- (CGFloat)viewHeight;

@end

@implementation MECalendarView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addCurrentMonthView];
        [self addEraserSlot];
    }
    return self;
}

- (void)addCurrentMonthView {
    CGFloat x = CURRENT_MONTH_VIEW_PADDING_X,
            y = CURRENT_MONTH_VIEW_PADDING_Y,
            width = [self viewWidth] - CURRENT_MONTH_VIEW_PADDING_X * 2,
            height = CURRENT_MONTH_VIEW_HEIGHT;
    
    currentMonthView = [[MEMonthView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    [self addSubview:currentMonthView];
}

- (void)addEraserSlot {
    UIImage *image = [UIImage imageNamed:@"eraser-slot.png"];
    UIImageView *eraserSlotView = [[UIImageView alloc] initWithImage:image];
    CGRect frame = eraserSlotView.frame;
    frame.origin.y = ERASER_SLOT_Y;
    eraserSlotView.frame = frame;
    
    [self addSubview:eraserSlotView];
    
    [eraserSlotView release];
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
