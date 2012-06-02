//
//  MECalendar.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/11/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MECalendar.h"

@implementation MECalendar

+ (NSArray *)allMonths {
    static NSArray *months = Nil;
    if (!months) {
        months = [[NSArray alloc] initWithObjects:@"January", @"February", @"March", @"April", @"May", @"June", 
                    @"July", @"August", @"September", @"October", @"November", @"December", nil];
    }
    return months;
}

+ (NSInteger)currentMonth {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *today = [NSDate date];
    NSDateComponents *currentDateComponents = [calendar components:(NSWeekdayCalendarUnit | NSYearCalendarUnit | 
                                                                    NSMonthCalendarUnit | NSHourCalendarUnit | 
                                                                    NSMinuteCalendarUnit | NSWeekCalendarUnit) fromDate:today];
    NSInteger month = [currentDateComponents month];
    [calendar release];
    return month;
}

+ (NSRange)daysInMonthRelatedToDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar rangeOfUnit:NSDayCalendarUnit 
                          inUnit:NSMonthCalendarUnit 
                         forDate:date];
}

@end
