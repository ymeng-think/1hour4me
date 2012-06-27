//
//  MECalendarCardView.h
//  OneHour4Me
//
//  Created by Meng Yu on 6/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MELabel, MECalendarCard;

@protocol MECalendarCardDelegate

- (void)didTap:(MECalendarCard *)card ofMonth:(NSInteger)month;

@end

@interface MECalendarCard : UIView {
    MELabel *label;
    
    NSInteger month;
    BOOL isSelected;
    
    id<NSObject, MECalendarCardDelegate> delegate;
}

@property (nonatomic, setter = setMonth:) NSInteger month;
@property (nonatomic) BOOL isSelected;
@property (nonatomic, retain) id<NSObject, MECalendarCardDelegate> delegate;

@end
