//
//  LabelMeViewController.m
//  LabelMe
//
//  Created by David Way on 9/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LabelMeViewController.h"



@implementation LabelMeViewController


@synthesize AnnotationButton, annotationViewController, LabelMeView, signInButton, createAccountButton, createAccountController;

#pragma mark -
#pragma mark LabelMeViewController

-(void)viewDidLoad
{
    self.annotationViewController = 
            [[[AnnotationViewController alloc] initWithNibName:@"AnnotationView" bundle:nil] autorelease];
    
    
    self.createAccountController = 
            [[[CreateAccountController alloc] initWithNibName:@"CreateAccountView" bundle:nil] autorelease];
    
    self.createAccountController.delegate = self;
    self.annotationViewController.delegate = self;
    
    
    

    
    
}
-(void)viewDidUnload
{
    self.LabelMeView = nil;
    self.AnnotationButton = nil;
    self.signInButton = nil;
    self.createAccountButton = nil;
    self.annotationViewController = nil;
}



-(void)dealloc
{
    [annotationViewController release];
    [LabelMeView release];
    [AnnotationButton release];
    [signInButton release];
    [createAccountButton release];
    [super dealloc];
    
    
}
-(IBAction)annotationAction:(id)sender
{

    annotationViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController: annotationViewController animated: YES];

    
    
}
-(IBAction)createAccountAction:(id)sender
{
    [self presentModalViewController:createAccountController animated:YES];
}
-(IBAction)signInAction:(id)sender
{
    
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

@end
