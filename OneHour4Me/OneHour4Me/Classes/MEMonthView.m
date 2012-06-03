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


#define PADDING 10.0
#define LABEL_HEIGHT 20.0
#define NUMBER_OF_WEEKS 6

@interface MEMonthView ()

- (void)addMonthLabel;
- (void)addDaysTable;

@end

@implementation MEMonthView

@synthesize month;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addMonthLabel];
        [self addDaysTable];
    }
    return self;
}

- (void)setMonth:(NSInteger)m {
    if (m < 1 || m > 12) {
        [NSException raise:NSInvalidArgumentException format:@"Month must be between 1 and 12"];
    }
    self->month = m;
    
    monthLabel.text = [[MECalendar allMonths] objectAtIndex:(self->month - 1)];
}

- (void)addMonthLabel {
    monthLabel = [[MELabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, LABEL_HEIGHT)];
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
    
    [self addSubview:daysInMonth];
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
    
    return cell;
}

- (void)dealloc {
    [monthLabel release];
    
    [super dealloc];
}

@end
