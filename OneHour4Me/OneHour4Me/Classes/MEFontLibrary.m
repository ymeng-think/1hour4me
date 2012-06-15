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
#define FONT_HELVETICA @"Helvetica"

static MEFontLibrary *gSharedInstance;

@implementation MEFontLibrary

@synthesize cursiveLargeFont, cursiveMiddleFont, cursiveSmallFont, chalkboardLargeFont, chalkboardSmallFont, helveticaSmallFont;

+ (MEFontLibrary *)sharedLibrary {
    if (!gSharedInstance) {
        gSharedInstance = [[MEFontLibrary alloc] init];
        gSharedInstance->cursiveLargeFont = [UIFont fontWithName:FONT_LUCIDA_CALLIGRAPHY size:22];
        gSharedInstance->cursiveMiddleFont = [UIFont fontWithName:FONT_LUCIDA_CALLIGRAPHY size:17];
        gSharedInstance->cursiveSmallFont = [UIFont fontWithName:FONT_LUCIDA_CALLIGRAPHY size:13];
        
        gSharedInstance->chalkboardLargeFont = [UIFont fontWithName:FONT_CHALKBOARD size:22];
        gSharedInstance->chalkboardSmallFont = [UIFont fontWithName:FONT_CHALKBOARD size:15];
        
        gSharedInstance->helveticaSmallFont = [UIFont fontWithName:FONT_HELVETICA size:15];
    }
    return gSharedInstance;
}

@end
