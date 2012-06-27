//
//  MEMonthlyCalendarView.m
//  OneHour4Me
//
//  Created by Meng Yu on 6/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEMonthSelection.h"

#define MONTH_NUM              12
#define CALENDAR_CARD_WIDTH    44.0
#define CALENDAR_CARD_HEIGHT   44.0
#define PADDING                16.0

@interface MEMonthSelection ()

- (void)addAllCalendarCards;
- (void)layoutAllCards;
- (MECalendarCard *)lookupSelectedCard;
- (void)centralizeCard:(MECalendarCard *)card;

@end

@implementation MEMonthSelection

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
    [self layoutAllCards];
    [self centralizeCard:[self lookupSelectedCard]];
}

- (void)addAllCalendarCards {
    CGFloat containerWidth = CALENDAR_CARD_WIDTH * (MONTH_NUM - 1);
    container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, containerWidth, self.bounds.size.height)];
    [self addSubview:container];

    for (NSInteger i = 0; i < MONTH_NUM; i++) {
        MECalendarCard *card = [[MECalendarCard alloc] initWithFrame:CGRectZero];
        card.delegate = self;
        [container addSubview:card];
        [card release];
    }
}

- (void)layoutAllCards {
    CGFloat x = 0.0;
    CGFloat y = (self.frame.size.height - CALENDAR_CARD_HEIGHT) / 2;
    CGFloat w = CALENDAR_CARD_WIDTH;
    CGFloat h = CALENDAR_CARD_HEIGHT;
    
    for (NSInteger i = 0; i < container.subviews.count; i++) {
        MECalendarCard *card = [container.subviews objectAtIndex:i];    
        
        card.frame = CGRectMake(x, y, w, h);
        card.month = i + 1;
        
        x += w + PADDING;
    }
}

- (void)selectMonth:(NSInteger)month {
    MECalendarCard *card = [container.subviews objectAtIndex:(month - 1)];
    card.isSelected = YES;
    selectedMonth = month;
}

- (MECalendarCard *)lookupSelectedCard {
    for (MECalendarCard *card in container.subviews) {
        if (card.isSelected) {
            return card;
        }
    }
    return nil;
}

- (void)centralizeCard:(MECalendarCard *)card {
    if (card == nil) {
        return;
    }
    
    CGFloat startX = card.frame.origin.x;
    CGFloat width = card.frame.size.width;
    
    CGFloat offsetX = startX - self.bounds.size.width + self.bounds.size.width / 2 + width / 2;
    self.contentOffset = CGPointMake(offsetX, 0.0);
}

- (void)didTap:(MECalendarCard *)card ofMonth:(NSInteger)month {
    MECalendarCard *selectedCard = [self lookupSelectedCard];
    if (selectedCard) {
        selectedCard.isSelected = NO;
    }
    
    card.isSelected = YES;
    
    [self centralizeCard:card];
    
    [selectedCard setNeedsDisplay];
    [card setNeedsDisplay];
}

- (void)dealloc {
    [container release];
    
    [super dealloc];
}

@end
