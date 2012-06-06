//
//  MEMonthView.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/25/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MECalendar.h"
#import "MEFontLibrary.h"
#import "MELabel.h"
#import "MEMonthView.h"
#import "MEWeekCell.h"
#import "MEWeekHeader.h"


#define PADDING 10.0
#define LABEL_HEIGHT 20.0
#define NUMBER_OF_WEEKS 6

@interface MEMonthView ()

- (void)addMonthLabel;
- (void)addDaysTable;
- (void)matrixDays;

@end

@implementation MEMonthView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        year = [[MECalendar calendar] currentYear];
        month = [[MECalendar calendar] currentMonth];
        
        [self addMonthLabel];
        [self addDaysTable];
        [self matrixDays];
    }
    return self;
}

- (void)addMonthLabel {
    monthLabel = [[MELabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, LABEL_HEIGHT)];
    if (month >= 1 && month <= 12) {
        monthLabel.text = [[MECalendar allMonths] objectAtIndex:(month - 1)];
    }
    monthLabel.backgroundColor = [UIColor clearColor];
    [monthLabel whiteTextWithFont:[MEFontLibrary sharedLibrary].cursiveMiddleFont];
    
    [self addSubview:monthLabel];
}

- (void)addDaysTable {
    daysInMonth = [[UITableView alloc] initWithFrame:CGRectMake(0, 0 + LABEL_HEIGHT + PADDING, self.bounds.size.width, 300)];
    daysInMonth.dataSource = self;
    daysInMonth.delegate = self;
    daysInMonth.scrollEnabled = false;
    daysInMonth.backgroundColor = [UIColor clearColor];
    
    MEWeekHeader *header = [[MEWeekHeader alloc] initWithFrame:CGRectMake(0, 0, daysInMonth.bounds.size.width, 30)];
    daysInMonth.tableHeaderView = header;
    [header release];
    
    [self addSubview:daysInMonth];
}

- (void)matrixDays {
    MEMonthInfo monthInfo = [[MECalendar calendar] daysInYear:year andMonth:month];

    NSInteger i = 0;
    NSInteger day = 1;
    for (; i < monthInfo.startFromWeekday; i++) {
        days[i] = -1;
    }
    for (NSInteger j = 0; j < monthInfo.daysInMonth; i++, j++) {
        days[i] = day++;
    }
    for (; i < ALL_DAYS_NUMBER_IN_MONTH; i++) {
        days[i] = -1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return NUMBER_OF_WEEKS;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return tableView.bounds.size.width / 7;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdentifier = @"DayCellIdentifier";
    
    MEWeekCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (cell == nil) {
        cell = [[[MEWeekCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier] autorelease];
    }
    
    NSMutableArray *daysInWeek = [[NSMutableArray alloc] initWithCapacity:7];
    NSInteger start = [indexPath row] * 7;
    NSInteger end = start + 7;
    for (NSInteger i = start; i < end; i++) {
        NSNumber *value = [NSNumber numberWithInteger:days[i]];
        [daysInWeek addObject:value];
    }
    cell.daysInWeek = daysInWeek;
    
    return cell;
}

- (void)dealloc {
    [monthLabel release];
    
    [super dealloc];
}

@end
