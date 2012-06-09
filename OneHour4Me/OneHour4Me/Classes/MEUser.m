//
//  MEUser.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/6/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEUser.h"

@interface MEUser ()

+ (BOOL)stringIsEmpty:(NSString *)str;

@end

@implementation MEUser

+ (BOOL)stringIsEmpty:(NSString *)str {
    if([str length] == 0) {
        return YES;
    }
    if([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
} 

+ (MEUser *)loginWithName:(NSString *)userName password:(NSString *)password {
    if ([MEUser stringIsEmpty:userName] || [MEUser stringIsEmpty:password]) {
        return nil;
    }
    
    MEUser *user = [[[MEUser alloc] init] autorelease];
    return user;
}

@end
