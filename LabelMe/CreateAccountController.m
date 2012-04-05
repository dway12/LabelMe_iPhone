//
//  CreateAccountController.m
//  LabelMe
//
//  Created by David Way on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreateAccountController.h"
#import "ServerConnectionController.h"

@implementation CreateAccountController

@synthesize usernameTextField =     _usernameTextField;
@synthesize emailTextField =        _emailTextField;
@synthesize passwordTextField =     _passwordTextField; 
@synthesize createAccountButton =   _createAccountButton;





-(void)viewDidLoad
{
    self.title = @"Create an Account";
    [super viewDidLoad];
}

-(void)viewDidUnload
{
    self.createAccountButton = nil;
    self.usernameTextField = nil;
    self.emailTextField = nil;
    self.passwordTextField = nil;
    [super viewDidUnload];
}

-(void)dealloc
{
    [self.usernameTextField release];
    [self.emailTextField release];
    [self.passwordTextField release];
    [self.createAccountButton release];
    [super dealloc];
}



-(IBAction)createAccountAction:(id)sender
{
    
    [self sendCreateAccountToServer];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField: textField up: NO];
}

- (void) animateTextField: (UITextField*)textField up: (BOOL) up
{
    const int movementDistance = 150; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    usernameString = self.usernameTextField.text;
    passwordString = self.passwordTextField.text;
    emailString = self.emailTextField.text;
    

    [self checkField];
    return YES;
    
    
    
}

-(void)checkField
{

    
    if (![usernameString isEqualToString:@""])
    {
        NSCharacterSet *alphaSet = [NSCharacterSet alphanumericCharacterSet];
        usernameValid = [[usernameString stringByTrimmingCharactersInSet:alphaSet] isEqualToString:@""];
        
    }
    if (![passwordString isEqualToString:@""])
    {
        NSCharacterSet *alphaSet = [NSCharacterSet alphanumericCharacterSet];
        passwordValid = [[passwordString stringByTrimmingCharactersInSet:alphaSet] isEqualToString:@""];
    }
    if (![emailString isEqualToString:@""])
    {
        NSString *emailRegEx =
        @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
        @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
        @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
        @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
        @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
        @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
        @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
        
        NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
        emailValid = [regExPredicate evaluateWithObject:emailString];
       
    }
    
    if (usernameValid & passwordValid & emailValid)
    {
        [self.emailTextField resignFirstResponder];
        [self.usernameTextField resignFirstResponder];
        [self.passwordTextField resignFirstResponder];
        [self sendCreateAccountToServer];
    }
    else if (!usernameValid & passwordValid & emailValid)
    {
        [self showInvalidFieldAlert:@"The username must contain alphanumeric numbers only!" :@"Choose a different username."];
    }
    else if (usernameValid & !passwordValid & emailValid)
    {
        [ self showInvalidFieldAlert:@"The password must contain alphanumeric numbers only!" :@"Choose a different password."];
    }
    else if( usernameValid & passwordValid & !emailValid)
    {
        [self showInvalidFieldAlert:@"The email address must be in this form: [address]@[server].[label]" :@"Email address is not of the proper form!"];
    }
    else if ( !usernameValid & !passwordValid & emailValid)
    {
        [self showInvalidFieldAlert:@"These fields must be alphanumeric!" :@"Choose a different username and password."];
    }
    else if ( !usernameValid & passwordValid & !emailValid)
    {
        [self showInvalidFieldAlert:@"The username must be alphanumeric and the email address must be in proper form." :@"Try a different username and email address."];
    }
    else if ( usernameValid & !passwordValid & !emailValid)
    {
        [self showInvalidFieldAlert:@"The password must be alphanumberic and the email address must be in proper form." :@"Try a different password and email address."];
    }
    else if( !usernameValid * !passwordValid & !emailValid)
    {
        [self showInvalidFieldAlert:@"The password and username must be alphanumeric, and the email address should be in standard form." :@"All fields have incorrect form!"];
    }
}

-(void)showInvalidFieldAlert: (NSString *)incorrectStringFix:(NSString *)problemString
{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:problemString
                                                    message:incorrectStringFix
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles: nil];
    [alert show];
    [alert release];
}



-(void)sendCreateAccountToServer
{
    
   // [myAppDelegate 
}

@end
