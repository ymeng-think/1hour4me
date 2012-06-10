//
//  MECalendarCardView.h
//  OneHour4Me
//
//  Created by Meng Yu on 6/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MELabel;

@interface MECalendarCardView : UIView {
    MELabel *label;
    
    NSInteger month;
    BOOL isSelected;
}

@property (nonatomic, setter = setMonth:) NSInteger month;
@property (nonatomic) BOOL isSelected;

@end
