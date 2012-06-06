//
//  MEWeekHeader.m
//  OneHour4Me
//
//  Created by Meng Yu on 6/6/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MECalendar.h"
#import "MEFontLibrary.h"
#import "MEWeekHeader.h"
#import "UILabelExtension.h"

#define NUMBER_OF_DAYS_IN_WEEK 7

@interface MEWeekHeader ()

- (void)addLabels;

@end

@implementation MEWeekHeader

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        labels = [[NSMutableArray alloc] initWithCapacity:NUMBER_OF_DAYS_IN_WEEK];
        [self addLabels];
    }
    return self;
}

- (void)addLabels {
    for (NSInteger i = 0; i < NUMBER_OF_DAYS_IN_WEEK; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.text = [[MECalendar allWeekdays] objectAtIndex:i];
        label.textAlignment = UITextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        [label whiteTextWithFont:[MEFontLibrary sharedLibrary].chalkboardSmallFont];
        
        [labels addObject:label];
        [self addSubview:label];
        
        [label release];
    }
}

- (void)layoutSubviews {
    CGFloat width = self.bounds.size.width / NUMBER_OF_DAYS_IN_WEEK;
    CGFloat height = self.bounds.size.height;
    CGFloat x = 0;
    
    for (UILabel *label in labels) {
        label.frame = CGRectMake(x, 0, width, height);
        x += width;
    }
}

- (void)dealloc {
    [labels release];
    
    [super dealloc];
}

@end
