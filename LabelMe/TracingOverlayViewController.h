//
//  TracingOverlayViewController.h
//  LabelMe
//
//  Created by David Way on 10/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoxDrawView.h"
#import "ServerConnectionController.h"



@protocol TracingOverlayViewControllerDelegate;

@interface TracingOverlayViewController : UIViewController <UITextFieldDelegate>
{
    id <TracingOverlayViewControllerDelegate>       _delegate;
@private
    
    ServerConnectionController *                    _serverConnectionController;
    
    // buttons and text field
    UIBarButtonItem *                               _doneTracingButton;
    UIBarButtonItem *                               _cancelButton;
    
    UITextField *                                   _LabelerText;
    
    IBOutlet UIToolbar *                            _upperToolbar;
    IBOutlet UIToolbar *                            _lowerToolbar;
    
    // image helper values
    UIImage *                                       _tracingPicture;
    UIImageView *                                   _tracingPictureView;
    
    
    //points for string data
    CGPoint *                                       _upperLeft;
    CGPoint *                                       _lowerRight;
    
    CGPoint locationUpperLeft;
    CGPoint locationLowerRight;
    
    NSString *                                      _labelString;
    
    IBOutlet BoxDrawView *                          _boxDrawView;

    
    int                                             _currentIndex;
    double                                          _imageScaleFactor;

    
    //not properties
    NSString *pointStringUpperLeft;
    NSString *pointStringUpperRight;
    NSString *pointStringLowerRight;
    NSString *pointStringLowerLeft;
    NSString *pointStringComplete;
    
    
    //drawing box
    
    CGPoint corner1;
    CGPoint corner2;
    CGPoint corner3;
    CGPoint corner4;
    CGPoint *imagesArray;
    
    
    
    
    
    
    
    
}

@property (nonatomic, retain) id<TracingOverlayViewControllerDelegate> delegate;

@property (nonatomic, assign) ServerConnectionController  * serverConnectionController; 


@property (nonatomic, retain) IBOutlet UIImageView *tracingPictureView;
@property (nonatomic, retain) UIImage *tracingPicture;


@property (nonatomic, retain) IBOutlet UIBarButtonItem *doneTracingButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *cancelButton;
@property (nonatomic, retain) IBOutlet UITextField *LabelerText;
@property(nonatomic, retain) IBOutlet BoxDrawView *boxDrawView;



@property (nonatomic, retain) NSString *labelString;



@property(nonatomic) int currentIndex;
@property (nonatomic) double imageScaleFactor;






-(IBAction)doneTracingAction:(id)sender;
-(IBAction)cancelAction:(id)sender;
-(IBAction)touchPicture:(id)sender;

-(void)setPicture:(UIImage*)picture;
-(void)drawRect;
-(void)createPointString;


@end

@protocol TracingOverlayViewControllerDelegate
-(void)didHitCancel;
@end
