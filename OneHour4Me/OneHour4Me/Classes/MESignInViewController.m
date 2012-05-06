//
//  MESignInViewController.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MESignInViewController.h"
#import "MEUser.h"

@interface MESignInViewController ()

@end

@implementation MESignInViewController

- (void)loadView {
    CGRect mainScreen = [UIScreen mainScreen].bounds;
    scrollView = [[UIScrollView alloc] initWithFrame:mainScreen];
    MESignInView *signInView = [[MESignInView alloc] initWithFrame:mainScreen];
    signInView.textFieldEditingHandler = self;
    [scrollView addSubview:signInView];
    self.view = scrollView;
    [signInView release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize size = scrollView.bounds.size;
    size.height *= 2;
    scrollView.contentSize = size;
    scrollView.scrollEnabled = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(keyboardWillShow:) 
                                                name:UIKeyboardWillShowNotification 
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:) 
                                                 name:UIKeyboardWillHideNotification 
                                               object:nil];
}

- (void)viewDidUnload {
    [super viewDidUnload];

    [scrollView release];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    firstResponder = textField;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)keyboardWillShow:(NSNotification *)notification {
    oldOffset = scrollView.contentOffset;
    NSDictionary *userInfo = [notification userInfo];
    CGRect keyboardRect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [scrollView convertRect:keyboardRect fromView:nil];
    CGRect frFrame = [firstResponder convertRect:firstResponder.bounds toView:scrollView];
    CGFloat y = CGRectGetMaxY(frFrame) + keyboardRect.size.height - scrollView.bounds.size.height + 5;
    if (keyboardRect.origin.y < CGRectGetMaxY(frFrame)) {
        [scrollView setContentOffset:CGPointMake(0, y) animated:YES];
    }
}

- (void)keyboardWillHide:(NSNotification *)notification {
    [scrollView setContentOffset:oldOffset animated:YES];
}

- (IBAction)signIn:(id)sender {
    MEUser *user = [MEUser loginWithName:@"bob@gmail.com" password:@"12345"];
    if (user) {
        NSLog(@"you have logged in, now you can navigate to next page");
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sign in failed" 
                                   message:@"Your username or password is not correct" 
                                  delegate:nil 
                         cancelButtonTitle:@"Try again" 
                         otherButtonTitles:nil];
        [alertView show];
        [alertView release];
    }
}

@end
