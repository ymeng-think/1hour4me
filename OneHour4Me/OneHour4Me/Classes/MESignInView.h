//
//  MESignInView.h
//  OneHour4Me
//
//  Created by Meng Yu on 5/5/12.
//  Copyright (c) 2012 ThoughtWorks. All rights reserved.
//

#import "MEBackgroundView.h"
#import "MEStickerView.h"

@protocol MESignInDelegate

- (IBAction)signIn:(id)sender;

@end

@interface MESignInView : MEBackgroundView {
    MEStickerView *stickerView;
    
    id<UITextFieldDelegate> textFiedEditingHandler;
    id<MESignInDelegate> signInDelegate;
}

@property (nonatomic, retain, setter = setTextFieldEditingHandler:) id<UITextFieldDelegate> textFieldEditingHandler;
@property (nonatomic, retain) id<MESignInDelegate> signInDelegate;

@end
