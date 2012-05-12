//
//  OneHour4MeTests.m
//  OneHour4MeTests
//
//  Created by Meng Yu on 5/4/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MeCalendarTests.h"
#import "MECalendar.h"

struct MEDate {
    NSInteger year;
    NSInteger month;
    NSInteger day;
};
typedef struct MEDate MEDate;

@interface MeCalendarTests ()

- (MEDate)convertNSDate:(NSDate *)date;

@end

@implementation MeCalendarTests

- (void)setUp {
    [super setUp];
    // Set-up code here.
}

- (void)tearDown {
    // Tear-down code here.
    [super tearDown];
}

- (void)testTodayGetter {
    NSDate *expected = [NSDate date];
    NSDate *today = [MECalendar today];
    
    MEDate expectedDate = [self convertNSDate:expected];
    MEDate actualDate = [self convertNSDate:today];
    
    STAssertEquals(expectedDate.year, actualDate.year, @"");
    STAssertEquals(expectedDate.month, actualDate.month, @"");
    STAssertEquals(expectedDate.day, actualDate.day, @"");
}

- (MEDate)convertNSDate:(NSDate *)date {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit 
                                                                   fromDate:date];
    MEDate d;
    d.year = [components year];
    d.month = [components month];
    d.day = [components day];
    
    return d;
}

@end
