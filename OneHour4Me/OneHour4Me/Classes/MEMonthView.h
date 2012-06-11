//
//  MEMonthView.h
//  OneHour4Me
//
//  Created by Meng Yu on 5/25/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ALL_DAYS_NUMBER_IN_MONTH 42

@interface MEMonthView : UIView <UITableViewDataSource, UITableViewDelegate> {
    NSInteger days[ALL_DAYS_NUMBER_IN_MONTH];
    
    UILabel *monthLabel;
}

- (void)setYear:(NSInteger)year andMonth:(NSInteger)month;

@end
