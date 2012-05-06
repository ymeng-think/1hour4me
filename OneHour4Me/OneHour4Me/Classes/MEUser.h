//
//  MEUser.h
//  OneHour4Me
//
//  Created by Meng Yu on 5/6/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEUser : NSObject

+ (MEUser *)loginWithName:(NSString *)userName password:(NSString *)password;

@end
