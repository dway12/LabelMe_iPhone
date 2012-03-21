//
//  LabelMeViewController.m
//  LabelMe
//
//  Created by David Way on 9/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LabelMeViewController.h"



@implementation LabelMeViewController


@synthesize AnnotationButton =              _AnnotationButton;
@synthesize annotationViewController =      _annotationViewController;
@synthesize LabelMeView =                   _LabelMeView; 
@synthesize signInButton =                  _signInButton;
@synthesize createAccountButton =           _createAccountButton;
@synthesize createAccountController =       _createAccountController;
@synthesize signInController =              _signInController;

#pragma mark -
#pragma mark LabelMeViewController

-(void)viewDidLoad
{
    
    //create View Controllers
    self.annotationViewController = 
            [[[AnnotationViewController alloc] initWithNibName:@"AnnotationView" bundle:nil] autorelease];
    self.createAccountController = 
            [[[CreateAccountController alloc] initWithNibName:@"CreateAccountView" bundle:nil] autorelease];
    self.signInController = 
            [[[SignInController alloc] initWithNibName:@"SignInController" bundle:nil] autorelease];
    
    self.annotationViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    self.createAccountController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    self.signInController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    self.createAccountController.delegate = self;
    self.annotationViewController.delegate = self;
    self.signInController.delegate = self;
    
    UIButton *modalViewButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
	[modalViewButton addTarget:self
                        action:@selector(annotationAction:)
              forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *modalBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:modalViewButton];
	self.navigationItem.rightBarButtonItem = modalBarButtonItem;
	[modalBarButtonItem release];
    
    
    
}
-(void)viewDidUnload
{
    self.LabelMeView = nil;
    self.AnnotationButton = nil;
    self.annotationViewController = nil;
    self.signInButton = nil;
    self.signInController = nil;
    self.createAccountButton = nil;
    self.createAccountController = nil;
}



-(void)dealloc
{
    [self->_annotationViewController release];
    [self->_LabelMeView release];
    [self->_AnnotationButton release];
    [self->_signInButton release];
    [self->_signInController release];
    [self->_createAccountController release];
    [self->_createAccountButton release];
    [super dealloc];
    
    
}
-(IBAction)annotationAction:(id)sender
{

    //[self presentModalViewController: self.annotationViewController animated: YES];

    
    
}
-(IBAction)createAccountAction:(id)sender
{
    [[self navigationController] pushViewController:self.createAccountController animated:YES];
}
-(IBAction)signInAction:(id)sender
{
    [[self navigationController] pushViewController:self.signInController animated:YES];
}

#pragma mark -
#pragma mark AnnotationViewDelegate
-(void)didHitBack
{

    [self dismissModalViewControllerAnimated:YES];

}

#pragma mark -
#pragma mark CreateAccountControllerDelegate
-(void)didHitBackFromCreatingAccount
{
    
    [self dismissModalViewControllerAnimated:YES];
}
#pragma mark - 
#pragma mark SignInControllerDelegate
-(void)didHitBackFromSignInController
{
    [self dismissModalViewControllerAnimated:YES];
}
@end
