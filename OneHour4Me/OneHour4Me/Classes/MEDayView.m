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
        [MEDrawer drawText:[NSString stringWithFormat:@"%i", day] 
                withConfig:MEFontConfigMake([MEFontLibrary sharedLibrary].helveticaSmallFont, [UIColor whiteColor], YES)
                    inRect:rect 
                   offsetY:4.0 
                 onContext:context];
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

@end
