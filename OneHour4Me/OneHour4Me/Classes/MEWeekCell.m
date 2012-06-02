//
//  MEWeekCell.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/27/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEWeekCell.h"

#define NUMBER_OF_DAYS_IN_WEEK 7

@interface MEWeekCell ()

- (void)addDayViews;
- (UIImage *)imageBad;
- (UIImage *)imageUnknown;

@end

@implementation MEWeekCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        daysInWeek = [[NSMutableArray alloc] init];
        [self addDayViews];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:NO animated:NO];
}

- (void)layoutSubviews {
    CGFloat dayViewWidth = self.bounds.size.width / NUMBER_OF_DAYS_IN_WEEK;
    CGFloat dayViewHeight = self.bounds.size.height;
    
    for (NSInteger i = 0; i < daysInWeek.count; i++) {
        UIView *dayView = [daysInWeek objectAtIndex:i];
        dayView.frame = CGRectMake(i * dayViewWidth, 0, dayViewWidth, dayViewHeight);
    }
}

- (void)addDayViews {
    for (NSInteger i = 0; i < NUMBER_OF_DAYS_IN_WEEK; i++) {
        UIImageView *dayView = [[UIImageView alloc] initWithImage:[self imageUnknown]];
        [self addSubview:dayView];
        [daysInWeek addObject:dayView];
        [dayView release];
    }
}

- (UIImage *)imageBad {
    static UIImage *bad = Nil;
    if (!bad) {
        bad = [UIImage imageNamed:@"day-bad.png"];
    }
    return bad;
}

- (UIImage *)imageUnknown {
    static UIImage *unknown = Nil;
    if (!unknown) {
        unknown = [UIImage imageNamed:@"day-unknown.png"];
    }
    return unknown;
}

- (void)dealloc {
    [daysInWeek release];
    
    [super dealloc];
}

@end
