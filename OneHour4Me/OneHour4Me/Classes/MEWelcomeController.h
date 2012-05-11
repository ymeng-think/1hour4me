//
//  MEWelcomeController.h
//  OneHour4Me
//
//  Created by Meng Yu on 5/4/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MEWelcomeController : UIViewController {
    UILabel *header;
    UILabel *target;
    UILabel *description;
}

@property(nonatomic, retain) IBOutlet UILabel *header;
@property(nonatomic, retain) IBOutlet UILabel *target;
@property(nonatomic, retain) IBOutlet UILabel *description;

@end
