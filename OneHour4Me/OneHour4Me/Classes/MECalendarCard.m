//
//  MECalendarCardView.m
//  OneHour4Me
//
//  Created by Meng Yu on 6/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MECalendar.h"
#import "MECalendarCard.h"
#import "MEDrawer.h"
#import "MEFontLibrary.h"
#import "MELabel.h"

#define IMAGE_COLOR_MONTH @"month-highlight.png"
#define IMAGE_GRAY_MONTH  @"month.png"

@interface MECalendarCard ()

+ (UIImage *)imageColorMonth;
+ (UIImage *)imageGrayMonth;

@end

@implementation MECalendarCard

@synthesize month, isSelected;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIImage *backgroundImage = nil;
    if (isSelected) {
        backgroundImage = [MECalendarCard imageColorMonth];
    } else {
        backgroundImage = [MECalendarCard imageGrayMonth];
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [MEDrawer drawImage:backgroundImage inRect:rect onContext:context];
    
    [MEDrawer drawText:[NSString stringWithFormat:@"%@", [MECalendar monthAbbreviation:self->month]] 
            withConfig:MEFontConfigMake([MEFontLibrary sharedLibrary].chalkboardSmallFont, [UIColor blackColor], NO)
                inRect:rect 
               offsetY:0.0 
             onContext:context];
}

- (void)setMonth:(NSInteger)m {
    NSParameterAssert(m >= 1 && m <= 12);

    self->month = m;
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
