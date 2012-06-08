//
//  MECalendar.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/11/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MECalendar.h"

static MECalendar *gCalendar;

@interface MECalendar ()

+ (NSInteger)daysOfYear:(NSInteger)year month:(NSInteger)month;
+ (BOOL)isLeapYear:(NSInteger)year;

@end

@implementation MECalendar

+ (MECalendar *)calendar {
    if (!gCalendar) {
        gCalendar = [[MECalendar alloc] init];        
    }
    return gCalendar;
}

+ (NSArray *)allMonths {
    static NSArray *months = nil;
    if (!months) {
        months = [[[NSArray alloc] initWithObjects:@"January", @"February", @"March", @"April", @"May", @"June",
                    @"July", @"August", @"September", @"October", @"November", @"December", nil] autorelease];
    }
    return months;
}

+ (NSArray *)allWeekdays {
    static NSArray *weekdays = nil;
    if (!weekdays) {
        weekdays = [[[NSArray alloc] initWithObjects:@"Sun", @"Mon", @"Tue", @"Wed", @"Thu", @"Fri", @"Sat", nil] autorelease];
    }
    return weekdays;
}

+ (BOOL)isLeapYear:(NSInteger)year {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
}

+ (NSInteger)daysOfYear:(NSInteger)year month:(NSInteger)month {
    static NSInteger daysNumber[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    return [MECalendar isLeapYear:year] && month == 2 ? 29 : daysNumber[month - 1];
}

- (id)init {
    self = [super init];
    if (self) {
        NSDate *today = [NSDate date];
        self->currentComponent = [[NSCalendar currentCalendar] components:(NSWeekdayCalendarUnit | NSYearCalendarUnit | 
                                                                           NSMonthCalendarUnit   | NSHourCalendarUnit | 
                                                                           NSMinuteCalendarUnit  | NSWeekCalendarUnit) 
                                                                 fromDate:today];
    }
    return self;
}

- (NSInteger)currentMonth {
    return [currentComponent month];
}

- (NSInteger)currentYear {
    return [currentComponent year];
}

- (MEMonthInfo)daysInYear:(NSInteger)year andMonth:(NSInteger)month {
    MEMonthInfo monthInfo;
    monthInfo.daysInMonth = [MECalendar daysOfYear:year month:month];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:1];
    NSDate *firstDate = [calendar dateFromComponents:components];
    [components release];
    
    NSDateComponents *extractComps = [[NSCalendar currentCalendar] components:(NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit) 
                                                                     fromDate:firstDate];
    monthInfo.startFromWeekday = [extractComps weekday];
    
    return monthInfo;
}

@end
