//
//  MEDrawer.h
//  OneHour4Me
//
//  Created by Meng Yu on 6/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct {
    UIFont *font;
    UIColor *color;
    BOOL isBold;
} MEFontConfig;

CG_INLINE MEFontConfig
MEFontConfigMake(UIFont *font, UIColor *color, BOOL isBold)
{
    MEFontConfig config = { .font = font, .color = color, .isBold = isBold };
    return config;
}


@interface MEDrawer : NSObject

+ (void)drawImage:(UIImage *)image inRect:(CGRect)rect onContext:(CGContextRef)context;
+ (void)drawText:(NSString *)text withConfig:(MEFontConfig)config inRect:(CGRect)rect offsetY:(CGFloat)offsetY onContext:(CGContextRef)context;

@end
