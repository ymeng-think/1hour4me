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

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        backgroundImage = [UIImage imageNamed:BACKGROUND_IMAGE];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [backgroundImage drawInRect:rect];
}

@end
