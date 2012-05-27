//
//  MEMonthView.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/25/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEMonthView.h"
#import "MEFontLibrary.h"
#import "MECalendar.h"

#define PADDING         10.0
#define LABEL_HEIGHT    20.0

@implementation MEMonthView

@synthesize month;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addMonthLabel];
    }
    return self;
}

- (void)setMonth:(NSInteger)m {
    if (m < 1 || m > 12) {
        [NSException raise:NSInvalidArgumentException format:@"Month must be between 1 and 12"];
    }
    self->month = m;
    
    monthLabel.text = [[MECalendar allMonths] objectAtIndex:(self->month - 1)];
}

- (void)addMonthLabel {
    monthLabel = [[MELabel alloc] initWithFrame:CGRectMake(PADDING, 0, self.bounds.size.width - PADDING * 2, LABEL_HEIGHT)];
    monthLabel.backgroundColor = [UIColor clearColor];
    [monthLabel whiteTextWithFont:[MEFontLibrary sharedLibrary].cursiveLargerFont];

    
    [self addSubview:monthLabel];
}

- (void)dealloc {
    [monthLabel release];
    
    [super dealloc];
}

@end
