//
//  MEWelcomeViewController.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/4/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEWelcomeViewController.h"

@interface MEWelcomeViewController ()

@end

@implementation MEWelcomeViewController

@synthesize header;

static NSString *FONT_LUCIDA_CALLIGRAPHY = @"Lucida Calligraphy";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        cursiveFont = [UIFont fontWithName:FONT_LUCIDA_CALLIGRAPHY size:22];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
    self.navigationController.navigationBar.hidden = YES;
    self.header.font = cursiveFont;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
