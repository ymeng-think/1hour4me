//
//  MEFontLibrary.h
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEFontLibrary : NSObject {
    UIFont *cursiveLargerFont;
    UIFont *cursiveFont;
    UIFont *chalkboardLargerFont;
    UIFont *chalkboardFont;
}

+ (MEFontLibrary *)sharedLibrary;

@property(nonatomic, readonly) UIFont *cursiveLargerFont;
@property(nonatomic, readonly) UIFont *cursiveFont;
@property(nonatomic, readonly) UIFont *chalkboardLargerFont;
@property(nonatomic, readonly) UIFont *chalkboardFont;

@end
