//
//  MESignInViewController.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MESignInViewController.h"
#import "MEFontLibrary.h"
#import "UILabelExtension.h"

@interface MESignInViewController ()

@end

@implementation MESignInViewController

@synthesize header, letMeIn, emailTip, passwordTip;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
    [header whiteTextWithFont:[MEFontLibrary sharedLibrary].cursiveLargerFont linkBreak:NO];
    [letMeIn blackTextWithFont:[MEFontLibrary sharedLibrary].chalkboardLargerFont];
    UIFont *chalkboardFont = [MEFontLibrary sharedLibrary].chalkboardFont;
    [emailTip blackTextWithFont:chalkboardFont];
    [passwordTip blackTextWithFont:chalkboardFont];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
