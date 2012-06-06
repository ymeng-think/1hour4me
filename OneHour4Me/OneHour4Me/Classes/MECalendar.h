//
//  MECalendar.h
//  OneHour4Me
//
//  Created by Meng Yu on 5/11/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

struct MEMonthInfo {
    NSInteger daysInMonth;
    NSInteger startFromWeekday;
};
typedef struct MEMonthInfo MEMonthInfo;


@interface MECalendar : NSObject {
    NSDateComponents *currentComponent;
}

- (NSInteger)currentMonth;
- (NSInteger)currentYear;
- (MEMonthInfo)daysInYear:(NSInteger)year andMonth:(NSInteger)month;
+ (MECalendar *)calendar;
+ (NSArray *)allMonths;
+ (NSArray *)allWeekdays;

@end
