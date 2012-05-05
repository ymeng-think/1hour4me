//
//  UILabelExtension.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "UILabelExtension.h"

@implementation UILabel (UILabelExtension)

- (void)showWithFont:(UIFont *)font linkBreak:(BOOL)includesLineBreak {
    CGSize labelSize = [self.text sizeWithFont:font 
                             constrainedToSize:self.frame.size 
                                 lineBreakMode:self.lineBreakMode];
    self.numberOfLines = 0;
    self.font = font;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, labelSize.height);
    if (includesLineBreak) {
        self.text = [self.text stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    }
}

@end
