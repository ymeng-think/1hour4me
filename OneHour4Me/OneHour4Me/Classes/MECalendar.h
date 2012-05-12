//
//  MECalendar.h
//  OneHour4Me
//
//  Created by Meng Yu on 5/11/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MECalendar : NSObject

+ (NSDate *)today;
+ (NSRange)daysInMonthRelatedToDate:(NSDate *)date;

@end
