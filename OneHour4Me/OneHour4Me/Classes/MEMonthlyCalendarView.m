//
//  MEMonthlyCalendarView.m
//  OneHour4Me
//
//  Created by Meng Yu on 6/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MECalendarCardView.h"
#import "MEMonthlyCalendarView.h"

#define CALENDAR_CARD_WIDTH  44.0
#define CALENDAR_CARD_HEIGHT 44.0
#define MONTH_NUM            12
#define PADDING              20.0

@interface MEMonthlyCalendarView ()

- (void)addAllCalendarCards;

@end

@implementation MEMonthlyCalendarView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addAllCalendarCards];
        self.contentSize = container.bounds.size;
    }
    return self;
}

- (void)layoutSubviews {
    CGFloat x = 0.0;
    CGFloat y = (self.frame.size.height - CALENDAR_CARD_HEIGHT) / 2;
    for (NSInteger i = 0; i < container.subviews.count; i++) {
        MECalendarCardView *card = [container.subviews objectAtIndex:i];
        card.frame = CGRectMake(x, y, CALENDAR_CARD_WIDTH, CALENDAR_CARD_HEIGHT);
        card.month = i + 1;
        x += CALENDAR_CARD_WIDTH + PADDING;
    }
}

- (void)addAllCalendarCards {
    CGFloat containerWidth = CALENDAR_CARD_WIDTH * MONTH_NUM + PADDING * (MONTH_NUM - 1);
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
}

- (void)dealloc {
    [container release];
    
    [super dealloc];
}

@end
