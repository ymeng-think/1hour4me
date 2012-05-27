//
//  MECalendarView.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/11/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MECalendarView.h"
#import "MEMonthView.h"
#import "MECalendar.h"

#define MONTH_VIEW_TAG          1
#define NAVIGATION_BAR_HEIGHT   44.0

@interface MECalendarView ()

- (void)addMonthList;
- (CGFloat)viewWidth;
- (CGFloat)viewHeight;

@end

@implementation MECalendarView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addMonthList];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[MECalendar allMonths] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self viewHeight] / 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdentifier = @"MonthCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier] autorelease];
        
        CGFloat monthViewWidth = [self viewWidth];
        CGFloat monthViewHeight = [self viewHeight] / 2;
        MEMonthView *oneMonth = [[MEMonthView alloc] initWithFrame:CGRectMake(0, 0, monthViewWidth, monthViewHeight)];
        oneMonth.tag = MONTH_VIEW_TAG;
        [cell addSubview:oneMonth];
    }
    
	MEMonthView *monthView = (MEMonthView *)[cell viewWithTag:MONTH_VIEW_TAG];
    monthView.month = [indexPath row] + 1;
    
    return cell;
}

- (void)addMonthList {
    monthList = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    monthList.backgroundColor = [UIColor clearColor];
    monthList.separatorStyle = UITableViewCellSeparatorStyleNone;
    monthList.dataSource = self;
    monthList.delegate = self;
    
    [self addSubview:monthList];
}

- (CGFloat)viewWidth {
    return [UIScreen mainScreen].applicationFrame.size.width;
}

- (CGFloat)viewHeight {
    CGRect screenRect = [UIScreen mainScreen].applicationFrame;
    return screenRect.size.height - NAVIGATION_BAR_HEIGHT;
}

- (void)dealloc {
    [monthList release];

    [super dealloc];
}

@end
