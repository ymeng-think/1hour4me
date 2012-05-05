//
//  MESignInViewController.h
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MESignInViewController : UIViewController {
    UILabel *header;
    UILabel *letMeIn;
    UILabel *emailTip;
    UILabel *passwordTip;
}

@property(nonatomic, retain) IBOutlet UILabel *header;
@property(nonatomic, retain) IBOutlet UILabel *letMeIn;
@property(nonatomic, retain) IBOutlet UILabel *emailTip;
@property(nonatomic, retain) IBOutlet UILabel *passwordTip;

@end
