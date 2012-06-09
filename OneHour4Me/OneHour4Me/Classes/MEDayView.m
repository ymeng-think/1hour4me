//
//  MEDayView.m
//  OneHour4Me
//
//  Created by Meng Yu on 6/2/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEDayView.h"
#import "MEDrawer.h"

#define IMAGE_DAY_BAD       @"day-bad.png"
#define IMAGE_DAY_UNKNOWN   @"day-unknown.png"

@interface MEDayView ()

+ (UIImage *)imageBad;
+ (UIImage *)imageUnknown;
+ (void)drawText:(NSString *)text inRect:(CGRect)rect onContext:(CGContextRef)context;

@end

@implementation MEDayView

@synthesize state, day;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIImage *backgroundImage;
    switch (self.state) {
        case MEDayStateBad:
            backgroundImage = [MEDayView imageBad];
            break;
        case MEDayStateUnknown:
            backgroundImage = [MEDayView imageUnknown];
            break;
        default:
            backgroundImage = Nil;
            break;
    }
    
    if (backgroundImage) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        [MEDrawer drawImage:backgroundImage inRect:rect onContext:context];
        [MEDayView drawText:[NSString stringWithFormat:@"%i", day] inRect:rect onContext:context];
    }
}

+ (UIImage *)imageBad {
    static UIImage *bad = Nil;
    if (!bad) {
        bad = [UIImage imageNamed:IMAGE_DAY_BAD];
    }
    return bad;
}

+ (UIImage *)imageUnknown {
    static UIImage *unknown = Nil;
    if (!unknown) {
        unknown = [UIImage imageNamed:IMAGE_DAY_UNKNOWN];
    }
    return unknown;
}

+ (void)drawText:(NSString *)text inRect:(CGRect)rect onContext:(CGContextRef)context {
    static const char *fontName = "Helvetica";
    CGFloat fontSize = 15.0f;
    CGColorRef whiteColor = [[UIColor whiteColor] CGColor];
    
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    UIGraphicsPushContext(context);
    
    CGContextSetStrokeColorWithColor(context, whiteColor);
    CGContextSetFillColorWithColor(context, whiteColor);
    CGContextSelectFont(context, fontName, fontSize, kCGEncodingMacRoman);
    CGContextSetCharacterSpacing(context, 1);
    CGContextSetTextDrawingMode(context, kCGTextFillStroke);
    
    const char *str = [text UTF8String];
    CGContextShowTextAtPoint(context, 15, 15, str, strlen(str));
    
    UIGraphicsPopContext();
}

@end
