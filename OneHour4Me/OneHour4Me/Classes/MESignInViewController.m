//
//  MESignInViewController.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MESignInViewController.h"
#import "MESignInView.h"
//#import "MEFontLibrary.h"
//#import "UILabelExtension.h"

@interface MESignInViewController ()

@end

@implementation MESignInViewController

- (void)loadView {
    UIView *rootView = [[MESignInView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = rootView;
    [rootView release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
