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

@synthesize header;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
    [header showWithFont:[MEFontLibrary sharedLibrary].cursiveLargerFont linkBreak:NO];
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