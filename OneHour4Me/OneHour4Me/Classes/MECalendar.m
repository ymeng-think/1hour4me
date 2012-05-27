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

+ (NSDate *)today {
    return [NSDate date];
}

+ (NSRange)daysInMonthRelatedToDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar rangeOfUnit:NSDayCalendarUnit 
                          inUnit:NSMonthCalendarUnit 
                         forDate:date];
}

@end
