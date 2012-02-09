//
//  TracingOverlayViewController.h
//  LabelMe
//
//  Created by David Way on 10/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoxDrawView.h"



@protocol TracingOverlayViewControllerDelegate;

@interface TracingOverlayViewController : UIViewController <UITextFieldDelegate>
{
    id <TracingOverlayViewControllerDelegate> delegate;
@private
    
    // buttons and text field
    UIBarButtonItem *doneTracingButton;
    UIBarButtonItem *cancelButton;
    
    UITextField *LabelerText;
    
    // image helper values
    UIImage *tracingPicture;
    UIImage *originalTracingPicture;
    
    UIImageView *tracingPictureView;
    
    
    //points for string data
    CGPoint *upperLeft;
    CGPoint *lowerRight;
    
    CGPoint locationUpperLeft;
    CGPoint locationLowerRight;
    
    NSString *labelString;
    
    
    NSString *pointStringUpperLeft;
    NSString *pointStringUpperRight;
    NSString *pointStringLowerRight;
    NSString *pointStringLowerLeft;
    NSString *pointStringComplete;
    
    double imageScaleFactor;
    
    //drawing box
    
//    IBOutlet UIImageView *cloud1;
//    IBOutlet UIImageView *cloud2;
//    IBOutlet UIImageView *cloud3;
//    IBOutlet UIImageView *cloud4;
    
    CGPoint corner1;
    CGPoint corner2;
    CGPoint corner3;
    CGPoint corner4;
    
    CGPoint *imagesArray;
    
    int currentIndex;
    
    IBOutlet BoxDrawView *boxDrawView;
    
    
    
    
    
    
}

@property (nonatomic, retain) IBOutlet UIImageView *tracingPictureView;
@property (nonatomic, retain) UIImage *tracingPicture;
@property (nonatomic, retain) UIImage *originalTracingPicture;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *doneTracingButton;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *cancelButton;
@property (nonatomic) double imageScaleFactor;



@property (nonatomic, retain) IBOutlet UITextField *LabelerText;
@property (nonatomic, retain) NSString *labelString;
@property (nonatomic, retain) NSString *pointStringComplete;

@property (nonatomic, retain) id<TracingOverlayViewControllerDelegate> delegate;


@property(nonatomic) int currentIndex;

@property(nonatomic, retain) IBOutlet BoxDrawView *boxDrawView;




-(IBAction)doneTracingAction:(id)sender;
-(IBAction)cancelAction:(id)sender;
-(IBAction)touchPicture:(id)sender;

-(void)setPicture:(UIImage*)picture;
-(void)setOriginalPicture:(UIImage *)picture1;
-(void)drawRect;
-(void)clearBox;
-(void)createPointString;


@end

@protocol TracingOverlayViewControllerDelegate
-(void)finishedTracing:(UIImage*)pictureToSend:(NSString*)labelText1:(NSString*)pointStringComplete;
-(void)didHitCancel;
@end
