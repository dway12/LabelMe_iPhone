//
//  LabelMeViewController.m
//  LabelMe
//
//  Created by David Way on 9/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LabelMeViewController.h"



@implementation LabelMeViewController

@synthesize cameraOverlayViewController =       _cameraOverlayViewController;

@synthesize AnnotationButton =              _AnnotationButton;
@synthesize annotationViewController =      _annotationViewController;
@synthesize LabelMeView =                   _LabelMeView; 
@synthesize signInButton =                  _signInButton;
@synthesize createAccountButton =           _createAccountButton;
@synthesize signInController =              _signInController;

#pragma mark -
#pragma mark LabelMeViewController

-(void)viewDidLoad
{
    
    //create View Controllers
 //   self.annotationViewController = 
 //           [[[AnnotationViewController alloc] initWithNibName:@"AnnotationView" bundle:nil] autorelease];

    self.signInController = 
            [[[SignInController alloc] initWithNibName:@"SignInController" bundle:nil] autorelease];
    
    self.cameraOverlayViewController = 
            [[[CameraOverlayViewController alloc] initWithNibName:@"CameraOverlay" bundle:nil]  autorelease];
    


    
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
}



-(void)dealloc
{
    [self->_annotationViewController release];
    [self->_LabelMeView release];
    [self->_AnnotationButton release];
    [self->_signInButton release];
    [self->_signInController release];
    [self->_createAccountButton release];
    [super dealloc];
    
    
}
-(IBAction)annotationAction:(id)sender
{

    //[self presentModalViewController: self.annotationViewController animated: YES];

    
    
}

-(IBAction)signInAction:(id)sender
{
    [[self navigationController] pushViewController:self.signInController animated:YES];
}



-(IBAction)pictureModeButtonAction:(id)sender
{
    [[self navigationController] pushViewController:self.cameraOverlayViewController animated:YES];    
    
}



@end
