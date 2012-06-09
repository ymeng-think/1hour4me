//
//  MECalendarCardView.m
//  OneHour4Me
//
//  Created by Meng Yu on 6/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MECalendarCardView.h"
#import "MEDrawer.h"

#define IMAGE_COLOR_MONTH @"month-highlight.png"

@interface MECalendarCardView ()

+ (UIImage *)imageColorMonth;

@end

@implementation MECalendarCardView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIImage *backgroundImage = [MECalendarCardView imageColorMonth];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [MEDrawer drawImage:backgroundImage inRect:rect onContext:context];
}

+ (UIImage *)imageColorMonth {
    static UIImage *colorMonth = Nil;
    if (!colorMonth) {
        colorMonth = [UIImage imageNamed:IMAGE_COLOR_MONTH];
    }
    return colorMonth;
}

@end
