//
//  MEWelcomeViewController.h
//  OneHour4Me
//
//  Created by Meng Yu on 5/4/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MEWelcomeViewController : UIViewController {
    UIFont *cursiveFont;
    
    UILabel *header;
}

@property(nonatomic, retain) IBOutlet UILabel *header;

@end
