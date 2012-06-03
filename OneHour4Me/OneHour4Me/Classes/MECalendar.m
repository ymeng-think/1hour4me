//
//  MECalendar.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/11/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MECalendar.h"

static MECalendar *_calendar;

@implementation MECalendar

+ (MECalendar *)calendar {
    if (!_calendar) {
        [_calendar = [MECalendar alloc] init];        
    }
    return _calendar;
}

+ (NSArray *)allMonths {
    static NSArray *months = Nil;
    if (!months) {
        months = [[NSArray alloc] initWithObjects:@"January", @"February", @"March", @"April", @"May", @"June", 
                    @"July", @"August", @"September", @"October", @"November", @"December", nil];
    }
    return months;
}

- (id)init {
    self = [super init];
    if (self) {
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *today = [NSDate date];
        self->currentComponent = [calendar components:(NSWeekdayCalendarUnit | NSYearCalendarUnit | 
                                                       NSMonthCalendarUnit   | NSHourCalendarUnit | 
                                                       NSMinuteCalendarUnit  | NSWeekCalendarUnit) 
                                             fromDate:today];
        [calendar release];
    }
    return self;
}

- (NSInteger)currentMonth {
    return [currentComponent month];
}

- (NSInteger)currentYear {
    return [currentComponent year];
}

+ (NSRange)daysInMonthRelatedToDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar rangeOfUnit:NSDayCalendarUnit 
                          inUnit:NSMonthCalendarUnit 
                         forDate:date];
}

@end
