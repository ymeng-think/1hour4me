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
    CGFloat width = CALENDAR_CARD_WIDTH * MONTH_NUM + PADDING * (MONTH_NUM - 1);
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height)];
    if (self) {
        [self addAllCalendarCards];
    }
    return self;
}

- (void)layoutSubviews {
    CGFloat x = 0.0;
    CGFloat y = (self.frame.size.height - CALENDAR_CARD_HEIGHT) / 2;
    for (NSInteger i = 0; i < self.subviews.count; i++) {
        MECalendarCardView *card = [self.subviews objectAtIndex:i];
        card.frame = CGRectMake(x, y, CALENDAR_CARD_WIDTH, CALENDAR_CARD_HEIGHT);
        card.month = i;
        x += CALENDAR_CARD_WIDTH + PADDING;
    }
}

- (void)addAllCalendarCards {
    for (NSInteger i = 0; i < MONTH_NUM; i++) {
        MECalendarCardView *card = [[MECalendarCardView alloc] initWithFrame:CGRectZero];
        [self addSubview:card];
        [card release];
    }
}

@end
