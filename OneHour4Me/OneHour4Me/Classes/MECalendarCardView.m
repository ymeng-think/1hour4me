//
//  MECalendarCardView.m
//  OneHour4Me
//
//  Created by Meng Yu on 6/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MECalendar.h"
#import "MECalendarCardView.h"
#import "MEDrawer.h"
#import "MEFontLibrary.h"
#import "MELabel.h"

#define IMAGE_COLOR_MONTH @"month-highlight.png"
#define IMAGE_GRAY_MONTH  @"month.png"

@interface MECalendarCardView ()

+ (UIImage *)imageColorMonth;
+ (UIImage *)imageGrayMonth;
- (void)addMonthLabel;

@end

@implementation MECalendarCardView

@synthesize month, isSelected;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self addMonthLabel];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIImage *backgroundImage = nil;
    if (isSelected) {
        backgroundImage = [MECalendarCardView imageColorMonth];
    } else {
        backgroundImage = [MECalendarCardView imageGrayMonth];
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [MEDrawer drawImage:backgroundImage inRect:rect onContext:context];
}

- (void)addMonthLabel {
    label = [[MELabel alloc] initWithFrame:CGRectMake(10, 18, 30, 20)];
    label.backgroundColor = [UIColor clearColor];
    [label blackTextWithFont:[MEFontLibrary sharedLibrary].chalkboardSmallFont];
    [self addSubview:label];
    [label release];
}

- (void)setMonth:(NSInteger)m {
    if (m < 1 || m > 12) {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"month" userInfo:nil];
    }
    self->month = m;
    label.text = [MECalendar monthAbbreviation:self->month];
}

- (void)dealloc {
    [label release];
    
    [super dealloc];
}

+ (UIImage *)imageColorMonth {
    static UIImage *colorMonth = Nil;
    if (!colorMonth) {
        colorMonth = [UIImage imageNamed:IMAGE_COLOR_MONTH];
    }
    return colorMonth;
}

+ (UIImage *)imageGrayMonth {
    static UIImage *grayMonth = Nil;
    if (!grayMonth) {
        grayMonth = [UIImage imageNamed:IMAGE_GRAY_MONTH];
    }
    return grayMonth;
}

@end
