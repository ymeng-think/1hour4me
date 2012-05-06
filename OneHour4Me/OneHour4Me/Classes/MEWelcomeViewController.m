//
//  MEWelcomeViewController.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/4/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEWelcomeViewController.h"
#import "MESignInViewController.h"
#import "MEFontLibrary.h"
#import "UILabelExtension.h"

@interface MEWelcomeViewController ()

- (void)registerGestureRecognizers;
- (void)didClick:(UITapGestureRecognizer *)sender;
- (void)goToNextView;

@end

@implementation MEWelcomeViewController

@synthesize header, target, description;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [header whiteTextWithFont:[MEFontLibrary sharedLibrary].cursiveLargerFont];
    UIFont *cursiveFont = [MEFontLibrary sharedLibrary].cursiveFont;
    [target whiteTextWithFont:cursiveFont];
    [description whiteTextWithFont:cursiveFont linkBreak:YES];
    
    [self registerGestureRecognizers];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self performSelector:@selector(goToNextView) withObject:nil afterDelay:1.0];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)registerGestureRecognizers {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClick:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tap];
    [tap release];
}

- (void)didClick:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        [self goToNextView];
    }
}

- (void)goToNextView {
    MESignInViewController *signInController = [[MESignInViewController alloc] init];
    [self.navigationController pushViewController:signInController animated:YES];
    [signInController release];
}

@end
