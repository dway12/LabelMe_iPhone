//
//  CreateAccountController.h
//  LabelMe
//
//  Created by David Way on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ServerConnectionController;


@protocol CreateAccountControllerDelegate;

@interface CreateAccountController : UIViewController <UITextFieldDelegate>

{
    id <CreateAccountControllerDelegate> _delegate;
    
    IBOutlet UIButton *                 _backButton;
    IBOutlet UIButton *                 _createAccountButton;

    
    IBOutlet UITextField *              _usernameTextField;
    IBOutlet UITextField *              _passwordTextField;
    IBOutlet UITextField *              _emailTextField;
    
    NSString *                          usernameString;
    NSString *                          passwordString;
    NSString *                          emailString;
    
    
    BOOL                                usernameValid;
    BOOL                                emailValid;
    BOOL                                passwordValid;
    
    

    
}


@property (nonatomic, assign) id <CreateAccountControllerDelegate> delegate;
@property (nonatomic, assign) IBOutlet UIButton *backButton;
@property (nonatomic, assign) IBOutlet UITextField *usernameTextField;
@property (nonatomic, assign) IBOutlet UITextField *passwordTextField;
@property (nonatomic, assign) IBOutlet UITextField *emailTextField;
@property (nonatomic, retain) IBOutlet UIButton *createAccountButton;


-(IBAction)didHitBackButton:(id)sender;
-(IBAction)createAccountAction:(id)sender;
-(void)checkField;
-(void)showInvalidFieldAlert: (NSString *)incorrectString:(NSString *)problemString;
-(void)animateTextField: (UITextField*) textField up: (BOOL) up;
-(void)sendCreateAccountToServer;




@end

@protocol CreateAccountControllerDelegate
-(void)didHitBackFromCreatingAccount;

@end