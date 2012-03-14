//
//  SignInController.h
//  LabelMe_work
//
//  Created by David Way on 3/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SignInControllerDelegate;


@interface SignInController : UIViewController <UITextFieldDelegate>

{
    id<SignInControllerDelegate> _delegate;
    
    IBOutlet UIButton *     _backButton;
    IBOutlet UIButton *     _signInButton;
    
    IBOutlet UITextField *  _usernameTextField;
    IBOutlet UITextField *  _passwordTextField;
    
    NSString *              _usernameString;
    NSString *              _passwordString;
    
    BOOL                    passwordValid;
    BOOL                    usernameValid;
    
    
    
    
    
    
}
@property (nonatomic, retain) id<SignInControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UIButton *backButton;
@property (nonatomic, retain) IBOutlet UIButton *signInButton;
@property (nonatomic, retain) IBOutlet UITextField *usernameTextField;
@property (nonatomic, retain) IBOutlet UITextField *passwordTextField;

-(IBAction) hitBackButton:(id)sender;
-(IBAction) hitSignInButton:(id)sender;
-(void)animateTextField: (UITextField*) textField up: (BOOL) up;
-(void)showInvalidFieldAlert: (NSString *)incorrectStringFix:(NSString *)problemString;
-(void)checkField;




@end


@protocol SignInControllerDelegate
-(void)didHitBackFromSignInController;

@end