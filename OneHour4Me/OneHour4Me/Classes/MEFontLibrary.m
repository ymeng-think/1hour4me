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

@implementation MEFontLibrary

@synthesize cursiveLargerFont, cursiveFont, chalkboardLargerFont, chalkboardFont;

static MEFontLibrary *sharedInstance;

+ (MEFontLibrary *)sharedLibrary {
    if (!sharedInstance) {
        sharedInstance = [[MEFontLibrary alloc] init];
        sharedInstance->cursiveLargerFont = [UIFont fontWithName:FONT_LUCIDA_CALLIGRAPHY size:22];
        sharedInstance->cursiveFont = [UIFont fontWithName:FONT_LUCIDA_CALLIGRAPHY size:13];
        sharedInstance->chalkboardLargerFont = [UIFont fontWithName:FONT_CHALKBOARD size:22];
        sharedInstance->chalkboardFont = [UIFont fontWithName:FONT_CHALKBOARD size:15];
    }
    return sharedInstance;
}

@end
