//
//  CreateAccountController.h
//  LabelMe
//
//  Created by David Way on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CreateAccountControllerDelegate;

@interface CreateAccountController : UIViewController <UITextFieldDelegate>

{
    id <CreateAccountControllerDelegate> delegate;
    
    IBOutlet UIButton *backButton;
    
    IBOutlet UITextField *usernameTextField;
    IBOutlet UITextField *passwordTextField;
    IBOutlet UITextField *emailTextField;
    
    NSString *usernameString;
    NSString *passwordString;
    NSString *emailString;
    
    IBOutlet UIButton *createAccountButton;
    
    BOOL usernameValid;
    BOOL emailValid;
    BOOL passwordValid;
    

    
}


@property (nonatomic, assign) id <CreateAccountControllerDelegate> delegate;
@property (nonatomic, assign) IBOutlet UIButton *backButton;
@property (nonatomic, assign) IBOutlet UITextField *usernameTextField;
@property (nonatomic, assign) IBOutlet UITextField *passwordTextField;
@property (nonatomic, assign) IBOutlet UITextField *emailTextField;
@property (nonatomic, assign) IBOutlet UIButton * createAccountButton;


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