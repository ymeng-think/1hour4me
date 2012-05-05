//
//  MEBackgroundView.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEBackgroundView.h"

#define BACKGROUND_IMAGE @"blackboard.png"

@implementation MEBackgroundView

- (void)drawRect:(CGRect)rect {
    if (!backgroundImage) {
        backgroundImage = [UIImage imageNamed:BACKGROUND_IMAGE];
    }
    
    [backgroundImage drawInRect:rect];
}

@end
