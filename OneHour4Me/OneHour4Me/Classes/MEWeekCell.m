//
//  MEWeekCell.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/27/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEDayView.h"
#import "MEWeekCell.h"

#define NUMBER_OF_DAYS_IN_WEEK 7
#define ERROR -1

@interface MEWeekCell ()

- (void)addDayViews;
- (NSInteger)dayAt:(NSUInteger)index;

@end

@implementation MEWeekCell

@synthesize daysInWeek;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        dayViews = [[NSMutableArray alloc] init];
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
    
    for (NSInteger i = 0; i < dayViews.count; i++) {
        MEDayView *dayView = [dayViews objectAtIndex:i];
        dayView.frame = CGRectMake(i * dayViewWidth, 0, dayViewWidth, dayViewHeight);
        NSInteger day = [self dayAt:i];
        MEDayState state = MEDayStateNone;
        if (day > 0) {
            state = MEDayStateUnknown;
        }
        dayView.state = state;
        dayView.day = day;
    }
}

- (void)addDayViews {
    for (NSInteger i = 0; i < NUMBER_OF_DAYS_IN_WEEK; i++) {
        MEDayView *dayView = [[MEDayView alloc] init];
        [self addSubview:dayView];
        [dayViews addObject:dayView];
        [dayView release];
    }
}

- (NSInteger)dayAt:(NSUInteger)index {
    if (!daysInWeek || index >= daysInWeek.count) {
        return ERROR;
    }
    NSNumber *value = [daysInWeek objectAtIndex:index];
    return [value integerValue];
}

- (void)dealloc {
    [dayViews release];
    
    [super dealloc];
}

@end
