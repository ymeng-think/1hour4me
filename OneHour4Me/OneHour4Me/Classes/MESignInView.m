//
//  MESignInView.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEFontLibrary.h"
#import "MELabel.h"
#import "MESignInView.h"
#import "MEStickerView.h"

#define BUTTON_LEFT_CORNER_WIDTH 4.0
#define TAG_OF_USERNAME 1
#define TAG_OF_PASSWORD 2

@interface MESignInView ()

- (void)addHeaderLabel;
- (void)addSticker;
- (void)addLabelInto:(UIView *)container inRect:(CGRect)rect font:(UIFont *)font color:(UIColor *)color content:(NSString *)content;
- (void)addTextFieldInto:(UIView *)container inRect:(CGRect)rect tag:(NSInteger)tag encrypted:(BOOL)isEncrypted;
- (void)addButtonInto:(UIView *)container inRect:(CGRect)rect title:(NSString *)text action:(SEL)selector;
- (void)didPressSignInButton:(id)sender;
+ (UIImage *)buttonBackground:(NSString *)imageName;

@end

@implementation MESignInView

@synthesize textFieldEditingDelegate, signInDelegate;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addHeaderLabel];
        [self addSticker];
    }
    return self;
}

- (void)addHeaderLabel {
    [self addLabelInto:self 
                inRect:CGRectMake(20, 20, 280, 21) 
                  font:[MEFontLibrary sharedLibrary].cursiveLargeFont
                 color:[UIColor whiteColor]
               content:@"1 Hour For Me"];
}

- (void)addSticker {
    UIImage *stickerImage = [UIImage imageNamed:@"sticker.png"];
    stickerView = [[MEStickerView alloc] initWithImage:stickerImage atPoint:CGPointMake(20, 82)];
    [self addSubview:stickerView];
    
    // let me in ...
    [self addLabelInto:stickerView 
                inRect:CGRectMake(35, 46, 118, 21)
                  font:[MEFontLibrary sharedLibrary].chalkboardLargeFont 
                 color:[UIColor blackColor]
               content:@"Let me in ..."];
    
    // email
    [self addLabelInto:stickerView 
                inRect:CGRectMake(35, 100, 118, 21)
                  font:[MEFontLibrary sharedLibrary].chalkboardSmallFont 
                 color:[UIColor blackColor]
               content:@"Email"];
    [self addTextFieldInto:stickerView
                    inRect:CGRectMake(52, 128, 171, 31)
                       tag:TAG_OF_USERNAME
                 encrypted:NO];
    
    // password
    [self addLabelInto:stickerView 
                inRect:CGRectMake(35, 174, 118, 21)
                  font:[MEFontLibrary sharedLibrary].chalkboardSmallFont 
                 color:[UIColor blackColor]
               content:@"Password"];
    [self addTextFieldInto:stickerView
                    inRect:CGRectMake(52, 198, 171, 31)
                       tag:TAG_OF_PASSWORD
                 encrypted:YES];
    
    // sign in
    [self addButtonInto:stickerView
                 inRect:CGRectMake(35, 260, 70, 31)
                  title:@"Sign In"
                 action:@selector(didPressSignInButton:)];
}

- (void)addLabelInto:(UIView *)container inRect:(CGRect)rect font:(UIFont *)font color:(UIColor *)color content:(NSString *)content {
    MELabel *label = [[MELabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.text = content;
    if (color == [UIColor whiteColor]) {
        [label whiteTextWithFont:font];
    } else {
        [label blackTextWithFont:font];
    }
    
    [container addSubview:label];
    
    [label release];
}

- (void)addTextFieldInto:(UIView *)container inRect:(CGRect)rect tag:(NSInteger)tag encrypted:(BOOL)isEncrypted {
    UITextField *textField = [[UITextField alloc] initWithFrame:rect];
    textField.tag = tag;
    [textField setSecureTextEntry:isEncrypted];
    
    [container addSubview:textField];
    
    [textField release];
}

- (void)addButtonInto:(UIView *)container inRect:(CGRect)rect title:(NSString *)text action:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = rect;
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[MESignInView buttonBackground:@"button.png"] forState:UIControlStateNormal];
    [button.titleLabel blackTextWithFont:[MEFontLibrary sharedLibrary].cursiveSmallFont];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
    [container addSubview:button];
}

+ (UIImage *)buttonBackground:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
	return [image stretchableImageWithLeftCapWidth:BUTTON_LEFT_CORNER_WIDTH topCapHeight:0];
}

- (void)setTextFieldEditingDelegate:(id<UITextFieldDelegate>)delegate {
    for (UIView *subview in stickerView.subviews) {
        if ([subview isKindOfClass:[UITextField class]]) {
            ((UITextField *)subview).delegate = delegate;
        }
    }
}

- (void)didPressSignInButton:(id)sender {
    UITextField *userName = (UITextField *)[stickerView viewWithTag:TAG_OF_USERNAME];
    UITextField *password = (UITextField *)[stickerView viewWithTag:TAG_OF_PASSWORD];
    
    [signInDelegate signInWithUserName:userName.text andPassword:password.text];
}

- (void)dealloc {
    [stickerView release];
    
    [super dealloc];
}

@end
