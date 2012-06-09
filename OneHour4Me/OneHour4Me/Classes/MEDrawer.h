//
//  MEDrawer.h
//  OneHour4Me
//
//  Created by Meng Yu on 6/9/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MEDrawer : NSObject

+ (void)drawImage:(UIImage *)image inRect:(CGRect)rect onContext:(CGContextRef)context;

@end
