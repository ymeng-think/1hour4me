//
//  MEMonthView.h
//  OneHour4Me
//
//  Created by Meng Yu on 5/25/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MELabel.h"

@interface MEMonthView : UIView <UITableViewDataSource, UITableViewDelegate> {
    NSInteger month;
    
    MELabel *monthLabel;
    UITableView *daysInMonth;
}

@property (nonatomic, setter = setMonth:) NSInteger month;

@end
