//
//  MEFontLibrary.h
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEFontLibrary : NSObject {
    UIFont *cursiveLargeFont;
    UIFont *cursiveMiddleFont;
    UIFont *cursiveSmallFont;
    
    UIFont *chalkboardLargeFont;
    UIFont *chalkboardSmallFont;
}

+ (MEFontLibrary *)sharedLibrary;

@property(nonatomic, readonly) UIFont *cursiveLargeFont;
@property(nonatomic, readonly) UIFont *cursiveMiddleFont;
@property(nonatomic, readonly) UIFont *cursiveSmallFont;
@property(nonatomic, readonly) UIFont *chalkboardLargeFont;
@property(nonatomic, readonly) UIFont *chalkboardSmallFont;

@end
