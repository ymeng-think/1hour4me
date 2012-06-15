//
//  MEDayView.m
//  OneHour4Me
//
//  Created by Meng Yu on 6/2/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEDayView.h"
#import "MEDrawer.h"
#import "MEFontLibrary.h"

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
    UIFont *font = [MEFontLibrary sharedLibrary].helveticaSmallFont;
    CGColorRef whiteColor = [[UIColor whiteColor] CGColor];
    
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    UIGraphicsPushContext(context);
    
    CGContextSetStrokeColorWithColor(context, whiteColor);
    CGContextSetFillColorWithColor(context, whiteColor);
    CGContextSelectFont(context, [font.fontName UTF8String], font.pointSize, kCGEncodingMacRoman);
    CGContextSetCharacterSpacing(context, 1);
    CGContextSetTextDrawingMode(context, kCGTextFillStroke);
    
    CGSize textSize = [text sizeWithFont:font forWidth:rect.size.width lineBreakMode:UILineBreakModeWordWrap];
    const char *str = [text UTF8String];
    CGFloat x = (rect.size.width - textSize.width) / 2;
    CGFloat y = (rect.size.height - textSize.height) / 2 + 4;
    CGContextShowTextAtPoint(context, x, y, str, strlen(str));
    
    UIGraphicsPopContext();
}

@end
