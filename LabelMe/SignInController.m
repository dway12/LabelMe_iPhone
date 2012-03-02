//
//  SignInController.m
//  LabelMe_work
//
//  Created by David Way on 3/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SignInController.h"

@implementation SignInController
@synthesize backButton, signInButton, passwordTextField, usernameTextField, delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)hitBackButton:(id)sender
{
    
    [self.delegate didHitBackFromSignInController];
}
-(IBAction)hitSignInButton:(id)sender 
{
    
    
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
    const int movementDistance = 120; // tweak as needed
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
    
    usernameString = usernameTextField.text;
    passwordString = passwordTextField.text;
    
    
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

    
    if (usernameValid & passwordValid )
    {
        [usernameTextField resignFirstResponder];
        [passwordTextField resignFirstResponder];
      //  [self sendCreateAccountToServer];
    }

    else if (usernameValid & !passwordValid)
    {
        [ self showInvalidFieldAlert:@"The password must contain alphanumeric numbers only!" :@"Choose a different password."];
    }

    else if ( !usernameValid & !passwordValid )
    {
        [self showInvalidFieldAlert:@"These fields must be alphanumeric!" :@"Choose a different username and password."];
    }
    else if ( !usernameValid & passwordValid )
    {
        [self showInvalidFieldAlert:@"The username must be alphanumeric." :@"Try a different username and email address."];
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


@end
