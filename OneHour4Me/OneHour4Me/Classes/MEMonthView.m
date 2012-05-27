//
//  MEMonthView.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/25/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEMonthView.h"
#import "MEFontLibrary.h"
#import "MECalendar.h"
#import "MEWeekCell.h"

#define HORIZONTAL_PADDING 10.0
#define VERTICAL_PADDING 40.0
#define LABEL_HEIGHT 20.0

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
    monthLabel = [[MELabel alloc] initWithFrame:CGRectMake(HORIZONTAL_PADDING, 0, self.bounds.size.width - HORIZONTAL_PADDING * 2, LABEL_HEIGHT)];
    monthLabel.backgroundColor = [UIColor clearColor];
    [monthLabel whiteTextWithFont:[MEFontLibrary sharedLibrary].cursiveMiddleFont];
    
    [self addSubview:monthLabel];
}

- (void)addDaysTable {
    daysInMonth = [[UITableView alloc] initWithFrame:
                   CGRectMake(HORIZONTAL_PADDING, 28, self.bounds.size.width - HORIZONTAL_PADDING * 2, self.bounds.size.height - VERTICAL_PADDING)];
    daysInMonth.dataSource = self;
    daysInMonth.delegate = self;
    daysInMonth.scrollEnabled = false;
    
    [self addSubview:daysInMonth];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return daysInMonth.bounds.size.height / 5;
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
