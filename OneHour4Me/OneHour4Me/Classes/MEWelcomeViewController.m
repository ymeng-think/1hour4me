//
//  MEWelcomeViewController.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/4/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEWelcomeViewController.h"

@interface MEWelcomeViewController ()

- (void)showLabel:(UILabel *)label withFont:(UIFont *)font lineBreak:(BOOL)includesLineBreak;

@end

@implementation MEWelcomeViewController

@synthesize header, target, description;

static NSString *FONT_LUCIDA_CALLIGRAPHY = @"Lucida Calligraphy";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
    self.navigationController.navigationBar.hidden = YES;
    
    UIFont *cursiveLargerFont = [UIFont fontWithName:FONT_LUCIDA_CALLIGRAPHY size:22];
    [self showLabel:header withFont:cursiveLargerFont lineBreak:NO];
    UIFont *cursiveFont = [UIFont fontWithName:FONT_LUCIDA_CALLIGRAPHY size:13];
    [self showLabel:target withFont:cursiveFont lineBreak:NO];
    [self showLabel:description withFont:cursiveFont lineBreak:YES];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)showLabel:(UILabel *)label withFont:(UIFont *)font lineBreak:(BOOL)includesLineBreak {
    CGSize labelSize = [label.text sizeWithFont:font 
                                    constrainedToSize:label.frame.size 
                                        lineBreakMode:label.lineBreakMode];
    label.numberOfLines = 0;
    label.font = font;
    label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, labelSize.height);
    if (includesLineBreak) {
        label.text = [label.text stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    }
}

@end
