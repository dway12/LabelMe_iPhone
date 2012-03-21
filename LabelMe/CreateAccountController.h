//
//  CreateAccountController.h
//  LabelMe
//
//  Created by David Way on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ServerConnectionController;



@interface CreateAccountController : UIViewController <UITextFieldDelegate>

{
    
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


@property (nonatomic, assign) IBOutlet UIButton *backButton;
@property (nonatomic, assign) IBOutlet UITextField *usernameTextField;
@property (nonatomic, assign) IBOutlet UITextField *passwordTextField;
@property (nonatomic, assign) IBOutlet UITextField *emailTextField;
@property (nonatomic, retain) IBOutlet UIButton *createAccountButton;


-(IBAction)createAccountAction:(id)sender;
-(void)checkField;
-(void)showInvalidFieldAlert: (NSString *)incorrectString:(NSString *)problemString;
-(void)animateTextField: (UITextField*) textField up: (BOOL) up;
-(void)sendCreateAccountToServer;




@end

