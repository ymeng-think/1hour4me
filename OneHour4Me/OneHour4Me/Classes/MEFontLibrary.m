//
//  MEFontLibrary.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEFontLibrary.h"

#define FONT_LUCIDA_CALLIGRAPHY @"Lucida Calligraphy"

@implementation MEFontLibrary

@synthesize cursiveLargerFont, cursiveFont;

static MEFontLibrary *sharedInstance;

+ (MEFontLibrary *)sharedLibrary {
    if (!sharedInstance) {
        sharedInstance = [[MEFontLibrary alloc] init];
        sharedInstance->cursiveLargerFont = [UIFont fontWithName:FONT_LUCIDA_CALLIGRAPHY size:22];
        sharedInstance->cursiveFont = [UIFont fontWithName:FONT_LUCIDA_CALLIGRAPHY size:13];
    }
    return sharedInstance;
}

@end
