//
//  MEFontLibrary.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEFontLibrary.h"

#define FONT_LUCIDA_CALLIGRAPHY @"Lucida Calligraphy"
#define FONT_CHALKBOARD @"Chalkboard SE"

static MEFontLibrary *sharedInstance;

@implementation MEFontLibrary

@synthesize cursiveLargeFont, cursiveMiddleFont, cursiveSmallFont, chalkboardLargeFont, chalkboardSmallFont;

+ (MEFontLibrary *)sharedLibrary {
    if (!sharedInstance) {
        sharedInstance = [[MEFontLibrary alloc] init];
        sharedInstance->cursiveLargeFont = [UIFont fontWithName:FONT_LUCIDA_CALLIGRAPHY size:22];
        sharedInstance->cursiveMiddleFont = [UIFont fontWithName:FONT_LUCIDA_CALLIGRAPHY size:17];
        sharedInstance->cursiveSmallFont = [UIFont fontWithName:FONT_LUCIDA_CALLIGRAPHY size:13];
        
        sharedInstance->chalkboardLargeFont = [UIFont fontWithName:FONT_CHALKBOARD size:22];
        sharedInstance->chalkboardSmallFont = [UIFont fontWithName:FONT_CHALKBOARD size:15];
    }
    return sharedInstance;
}

@end
