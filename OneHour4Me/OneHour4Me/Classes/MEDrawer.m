//
//  MEDrawer.m
//  OneHour4Me
//
//  Created by Meng Yu on 6/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEDrawer.h"

@interface MEDrawer ()

+ (CGImageRef)flip:(CGImageRef)im;

@end

@implementation MEDrawer

+ (void)drawImage:(UIImage *)image inRect:(CGRect)rect onContext:(CGContextRef)context {
    CGImageRef flipped = [MEDrawer flip:[image CGImage]];
    CGContextDrawImage(context, rect, flipped);
}

+ (void)drawText:(NSString *)text withConfig:(MEFontConfig)config inRect:(CGRect)rect offsetY:(CGFloat)offsetY onContext:(CGContextRef)context {
    CGColorRef whiteColor = [config.color CGColor];
    
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    UIGraphicsPushContext(context);
    
    CGContextSetStrokeColorWithColor(context, whiteColor);
    CGContextSetFillColorWithColor(context, whiteColor);
    CGContextSelectFont(context, [config.font.fontName UTF8String], config.font.pointSize, kCGEncodingMacRoman);
    CGContextSetCharacterSpacing(context, 1);
    CGContextSetTextDrawingMode(context, config.isBold ? kCGTextFillStroke : kCGTextFill);
    
    CGSize textSize = [text sizeWithFont:config.font forWidth:rect.size.width lineBreakMode:UILineBreakModeWordWrap];
    const char *str = [text UTF8String];
    CGFloat x = (rect.size.width - textSize.width) / 2;
    CGFloat y = (rect.size.height - textSize.height) / 2 + offsetY;
    CGContextShowTextAtPoint(context, x, y, str, strlen(str));
    
    UIGraphicsPopContext();
}

+ (CGImageRef)flip:(CGImageRef)im {
    CGSize sz = CGSizeMake(CGImageGetWidth(im), CGImageGetHeight(im));
    UIGraphicsBeginImageContext(sz);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, sz.width, sz.height), im);
    CGImageRef result = [UIGraphicsGetImageFromCurrentImageContext() CGImage];
    UIGraphicsEndImageContext();
    return result;
}

@end
