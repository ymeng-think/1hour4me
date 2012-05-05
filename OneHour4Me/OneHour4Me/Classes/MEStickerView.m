//
//  MEStickerView.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEStickerView.h"

@interface MEStickerView ()

- (NSArray *)textFields;
- (void)drawDottedLineUnder:(UITextField *)textField context:(CGContextRef)context;

@end

@implementation MEStickerView

- (id)initWithImage:(UIImage *)image atPoint:(CGPoint)point {
    CGSize size = image.size;
    CGRect frame = {point, size};
    
    self = [super initWithFrame:frame];
    if (self) {
        stickerImage = [image retain];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    if (stickerImage) {
        [stickerImage drawInRect:rect];
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGFloat dashes[] = {2};
    CGContextSetLineDash(context, 1, dashes, 1);
    
    NSArray *textFields = [[self textFields] retain];
    for (UITextField *textField in textFields) {
        textField.borderStyle = UITextBorderStyleNone;
        [self drawDottedLineUnder:textField context:context];
    }
    
    [textFields release];
}

- (NSArray *)textFields {
    NSMutableArray *array = [NSMutableArray array];
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:[UITextField class]]) {
            [array addObject:subview];
        } 
    }
    return array;
}

- (void)drawDottedLineUnder:(UITextField *)textField context:(CGContextRef)context {
    CGRect rect = textField.frame;
    CGPoint start = CGPointMake(rect.origin.x, rect.origin.y + rect.size.height);
    CGPoint end = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
    CGPoint points[] = {start, end};
    CGContextStrokeLineSegments(context, points, 2);
}

- (void)dealloc {
    [stickerImage release];
    
    [super dealloc];
}

@end
