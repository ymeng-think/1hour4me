//
//  MEMonthlyCalendarView.m
//  OneHour4Me
//
//  Created by Meng Yu on 6/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MECalendarCardView.h"
#import "MEMonthlyCalendarView.h"

#define MONTH_NUM                       12
#define UNSELECTED_CALENDAR_CARD_WIDTH  33.0
#define UNSELECTED_CALENDAR_CARD_HEIGHT 33.0
#define SELECTED_CALENDAR_CARD_WIDTH    44.0
#define SELECTED_CALENDAR_CARD_HEIGHT   44.0
#define PADDING                         10.0
#define SELECTED_MONTH_BOTH_END_PADDING 20.0

@interface MEMonthlyCalendarView ()

- (void)addAllCalendarCards;

@end

@implementation MEMonthlyCalendarView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addAllCalendarCards];
        self.contentSize = container.bounds.size;
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}

- (void)layoutSubviews {
    CGFloat x = 0.0, y, w, h;
    CGFloat selectedCardY = (self.frame.size.height - SELECTED_CALENDAR_CARD_HEIGHT) / 2;
    CGFloat unselectedCardY = selectedCardY + SELECTED_CALENDAR_CARD_HEIGHT - UNSELECTED_CALENDAR_CARD_HEIGHT;
    
    for (NSInteger i = 0; i < container.subviews.count; i++) {
        MECalendarCardView *card = [container.subviews objectAtIndex:i];    
        
        if (i + 1 == selectedMonth) {
            y = selectedCardY;
            w = SELECTED_CALENDAR_CARD_WIDTH;
            h = SELECTED_CALENDAR_CARD_HEIGHT;
        } else {
            y = unselectedCardY;
            w = UNSELECTED_CALENDAR_CARD_WIDTH;
            h = UNSELECTED_CALENDAR_CARD_HEIGHT;
        }
        
        card.frame = CGRectMake(x, y, w, h);
        card.month = i + 1;
        
        if (i + 2 == selectedMonth || i == selectedMonth - 1) {
            x += w + SELECTED_MONTH_BOTH_END_PADDING;
        } else {
            x += w + PADDING;
        }
    }
}

- (void)addAllCalendarCards {
    CGFloat containerWidth = SELECTED_CALENDAR_CARD_WIDTH + (UNSELECTED_CALENDAR_CARD_WIDTH + PADDING) * (MONTH_NUM - 1);
    container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, containerWidth, self.bounds.size.height)];
    [self addSubview:container];

    for (NSInteger i = 0; i < MONTH_NUM; i++) {
        MECalendarCardView *card = [[MECalendarCardView alloc] initWithFrame:CGRectZero];
        [container addSubview:card];
        [card release];
    }
}

- (void)selectMonth:(NSInteger)month {
    MECalendarCardView *card = [container.subviews objectAtIndex:(month - 1)];
    card.isSelected = YES;
    selectedMonth = month;
}

- (void)dealloc {
    [container release];
    
    [super dealloc];
}

@end
