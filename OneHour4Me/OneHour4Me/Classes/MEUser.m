//
//  MEUser.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/6/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEUser.h"

@implementation MEUser

+ (MEUser *)loginWithName:(NSString *)userName password:(NSString *)password {
    if (userName == nil || password == nil) {
        return nil;
    }
    
    MEUser *user = [[MEUser alloc] init];
    return user;
}

@end
