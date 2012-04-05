//
//  SignInController.h
//  LabelMe_work
//
//  Created by David Way on 3/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateAccountController.h"




@interface SignInController : UIViewController <UITextFieldDelegate>

{
    
    CreateAccountController *   _createAccountController;    

    IBOutlet UIBarButtonItem *     _signInButton;
    IBOutlet UIBarButtonItem *     _createAccountButton;
    
    IBOutlet UITextField *  _usernameTextField;
    IBOutlet UITextField *  _passwordTextField;
    
    NSString *              _usernameString;
    NSString *              _passwordString;
    
    BOOL                    passwordValid;
    BOOL                    usernameValid;
    
    
    
    
    
    
}
@property (nonatomic, retain) CreateAccountController *createAccountController;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *signInButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *createAccountButton;
@property (nonatomic, retain) IBOutlet UITextField *usernameTextField;
@property (nonatomic, retain) IBOutlet UITextField *passwordTextField;

-(IBAction) hitSignInButton:(id)sender;
-(IBAction)createAccountAction:(id)sender;

-(void)animateTextField: (UITextField*) textField up: (BOOL) up;
-(void)showInvalidFieldAlert: (NSString *)incorrectStringFix:(NSString *)problemString;
-(void)checkField;




@end




