//
//  MESignInView.m
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MESignInView.h"
#import "MEFontLibrary.h"
#import "UILabelExtension.h"

#define BUTTON_LEFT_CORNER_WIDTH 4.0

@interface MESignInView ()

- (void)addHeaderLabel;
- (void)addSticker;
- (void)addLabelInto:(UIView *)container inRect:(CGRect)rect font:(UIFont *)font color:(UIColor *)color content:(NSString *)content;
- (void)addTextFieldInto:(UIView *)container inRect:(CGRect)rect;
- (void)addButtonInto:(UIView *)container inRect:(CGRect)rect title:(NSString *)text;
- (UIImage *)buttonBackground:(NSString *)imageName;

@end

@implementation MESignInView

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
                  font:[MEFontLibrary sharedLibrary].cursiveLargerFont
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
                  font:[MEFontLibrary sharedLibrary].chalkboardLargerFont 
                 color:[UIColor blackColor]
               content:@"Let me in ..."];
    
    // email
    [self addLabelInto:stickerView 
                inRect:CGRectMake(35, 100, 118, 21)
                  font:[MEFontLibrary sharedLibrary].chalkboardFont 
                 color:[UIColor blackColor]
               content:@"Email"];
    [self addTextFieldInto:stickerView
                    inRect:CGRectMake(52, 128, 171, 31)];
    
    // password
    [self addLabelInto:stickerView 
                inRect:CGRectMake(35, 174, 118, 21)
                  font:[MEFontLibrary sharedLibrary].chalkboardFont 
                 color:[UIColor blackColor]
               content:@"Password"];
    [self addTextFieldInto:stickerView
                    inRect:CGRectMake(52, 198, 171, 31)];
    
    // sign in
    [self addButtonInto:stickerView
                 inRect:CGRectMake(35, 260, 70, 31)
                  title:@"Sign In"];
}

- (void)addLabelInto:(UIView *)container inRect:(CGRect)rect font:(UIFont *)font color:(UIColor *)color content:(NSString *)content {
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
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

- (void)addTextFieldInto:(UIView *)container inRect:(CGRect)rect {
    UITextField *textField = [[UITextField alloc] initWithFrame:rect];
    
    [container addSubview:textField];
    
    [textField release];
}

- (void)addButtonInto:(UIView *)container inRect:(CGRect)rect title:(NSString *)text {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = rect;
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[self buttonBackground:@"button.png"] forState:UIControlStateNormal];
    [button.titleLabel blackTextWithFont:[MEFontLibrary sharedLibrary].cursiveFont];
    
    [container addSubview:button];
}

- (UIImage *)buttonBackground:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
	return [image stretchableImageWithLeftCapWidth:BUTTON_LEFT_CORNER_WIDTH topCapHeight:0];
}

- (void)dealloc {
    [stickerView release];
    
    [super dealloc];
}

@end
