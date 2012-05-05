//
//  UILabelExtension.h
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (UILabelExtension)

- (void)blackTextWithFont:(UIFont *)font;
- (void)whiteTextWithFont:(UIFont *)font;
- (void)whiteTextWithFont:(UIFont *)font linkBreak:(BOOL)includesLineBreak;

@end
