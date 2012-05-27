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

- (void)adjustFrameWithContent;

@end

@implementation MELabel

- (void)setText:(NSString *)text {
    [super setText:text];
    
    [self adjustFrameWithContent];
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

@end
