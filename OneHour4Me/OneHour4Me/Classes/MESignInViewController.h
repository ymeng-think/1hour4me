//
//  MESignInViewController.h
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MESignInView.h"

@interface MESignInViewController : UIViewController <UITextFieldDelegate, MESignInDelegate> {
    UIScrollView *scrollView;
    UIView *firstResponder;
    
    CGPoint oldOffset;
}

@end
