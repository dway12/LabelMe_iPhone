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
#import "SignInController.h"




@interface LabelMeViewController : UIViewController 
{
    

    AnnotationViewController *  _annotationViewController;
    CreateAccountController *   _createAccountController;    
    SignInController *          _signInController;
    
    
    //home screen buttons

    UIButton *                  _AnnotationButton;
    UIButton *                  _signInButton;
    UIButton *                  _createAccountButton;
    
    UIView  *                   _LabelMeView;

    
}


@property (nonatomic, retain) AnnotationViewController *annotationViewController;
@property (nonatomic, retain) CreateAccountController *createAccountController;
@property (nonatomic, retain) SignInController *signInController;

//home screen buttons
@property (nonatomic, retain) IBOutlet UIButton *AnnotationButton;
@property (nonatomic, retain) IBOutlet UIButton *signInButton;
@property (nonatomic, retain) IBOutlet UIButton *createAccountButton;

//labelmeView
@property (nonatomic, retain) IBOutlet UIView *LabelMeView;

//home screen button actions
-(IBAction)annotationAction:(id)sender;
-(IBAction)signInAction:(id)sender;
-(IBAction)createAccountAction:(id)sender;




@end
