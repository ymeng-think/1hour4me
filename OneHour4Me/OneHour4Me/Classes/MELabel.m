//
//  MELabel.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/27/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MELabel.h"
#import "NSStringExtension.h"

@interface MELabel ()

- (void)textInColor:(UIColor *)color withFont:(UIFont *)font linkBreak:(BOOL)includesLineBreak;
- (void)adjustFrameWithContent;

@end

@implementation MELabel

- (void)blackTextWithFont:(UIFont *)font {
    [self textInColor:[UIColor blackColor] withFont:font linkBreak:NO];
}

- (void)whiteTextWithFont:(UIFont *)font {
    [self whiteTextWithFont:font linkBreak:NO];
}

- (void)whiteTextWithFont:(UIFont *)font linkBreak:(BOOL)includesLineBreak {
    [self textInColor:[UIColor whiteColor] withFont:font linkBreak:includesLineBreak];
}

- (void)textInColor:(UIColor *)color withFont:(UIFont *)font linkBreak:(BOOL)includesLineBreak {
    self.numberOfLines = 0;
    self.font = font;
    self.textColor = color;
    
    [self adjustFrameWithContent];
    
    if (![NSString isEmptyOrNull:self.text] && includesLineBreak) {
        self.text = [self.text stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    }
}

- (void)adjustFrameWithContent {
    CGSize labelSize = CGSizeZero;
    if (![NSString isEmptyOrNull:self.text]) {
        labelSize = [self.text sizeWithFont:self.font 
                          constrainedToSize:self.frame.size 
                              lineBreakMode:self.lineBreakMode];    
    }
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, labelSize.height);
}

- (void)setText:(NSString *)text {
    [super setText:text];
    
    [self adjustFrameWithContent];
}

@end
