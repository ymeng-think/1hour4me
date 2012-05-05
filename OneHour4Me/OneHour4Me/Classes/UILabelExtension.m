//
//  UILabelExtension.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "UILabelExtension.h"

@interface UILabel (Private)

- (void)textInColor:(UIColor *)color withFont:(UIFont *)font linkBreak:(BOOL)includesLineBreak;

@end

@implementation UILabel (UILabelExtension)

- (void)blackTextWithFont:(UIFont *)font {
    [self textInColor:[UIColor blackColor] withFont:font linkBreak:NO];
}

- (void)whiteTextWithFont:(UIFont *)font linkBreak:(BOOL)includesLineBreak {
    [self textInColor:[UIColor whiteColor] withFont:font linkBreak:includesLineBreak];
}

- (void)textInColor:(UIColor *)color withFont:(UIFont *)font linkBreak:(BOOL)includesLineBreak {
    CGSize labelSize = [self.text sizeWithFont:font 
                             constrainedToSize:self.frame.size 
                                 lineBreakMode:self.lineBreakMode];
    self.numberOfLines = 0;
    self.font = font;
    self.textColor = color;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, labelSize.height);
    if (includesLineBreak) {
        self.text = [self.text stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    }
}

@end
