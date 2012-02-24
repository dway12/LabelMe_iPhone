//
//  LabelMeViewController.h
//  LabelMe
//
//  Created by David Way on 9/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import "AnnotationViewController.h"
#import "CreateAccountController.h"

@class ServerConnectionController;


@interface LabelMeViewController : UIViewController <AnnotationViewControllerDelegate, CreateAccountControllerDelegate>
{
    

    AnnotationViewController *annotationViewController; //annotationView
    
    CreateAccountController *createAccountController;
    
    
    //home screen buttons

    UIButton *AnnotationButton;
    UIButton *Button2;
    UIButton *Button3;
    
    UIView  *LabelMeView;
    
    UIButton *signInButton;
    UIButton *createAccountButton;
    
    ServerConnectionController *serverConnectionController;
    
}

@property (nonatomic, retain) ServerConnectionController *serverConnectionController;

@property (nonatomic, retain) AnnotationViewController *annotationViewController;
@property (nonatomic, retain) CreateAccountController *createAccountController;

//home screen buttons
@property (nonatomic, retain) IBOutlet UIButton *AnnotationButton;

@property (nonatomic, retain) IBOutlet UIButton *signInButton;
@property (nonatomic, retain) IBOutlet UIButton *createAccountButton;

//labelmeImage
@property (nonatomic, retain) IBOutlet UIView *LabelMeView;

//home screen button actions
-(IBAction)annotationAction:(id)sender;


-(IBAction)signInAction:(id)sender;
-(IBAction)createAccountAction:(id)sender;




@end
