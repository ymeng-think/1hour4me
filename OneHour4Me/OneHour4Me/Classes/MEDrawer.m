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

+ (CGImageRef)flip:(CGImageRef)im {
    CGSize sz = CGSizeMake(CGImageGetWidth(im), CGImageGetHeight(im));
    UIGraphicsBeginImageContext(sz);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, sz.width, sz.height), im);
    CGImageRef result = [UIGraphicsGetImageFromCurrentImageContext() CGImage];
    UIGraphicsEndImageContext();
    return result;
}

@end
