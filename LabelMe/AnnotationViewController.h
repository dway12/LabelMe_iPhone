//
//  AnnotationViewController.h
//  LabelMe
//
//  Created by David Way on 10/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraOverlayViewController.h"
#import "TracingOverlayViewController.h"

@protocol AnnotationViewControllerDelegate;


@interface AnnotationViewController : UIViewController < CameraOverlayViewControllerDelegate, TracingOverlayViewControllerDelegate>
{
    id <AnnotationViewControllerDelegate> delegate;
    
    CameraOverlayViewController *cameraOverlayViewController;
    
    
    TracingOverlayViewController *tracingOverlayViewController;
    
    
@private
    UIButton *takePictureModeButton;
    UIButton *backButton;
    UIButton *tracingModeButton;
    NSMutableArray *capturedImages;
    

}


@property (nonatomic, assign) id <AnnotationViewControllerDelegate> delegate;
@property (nonatomic, retain) CameraOverlayViewController  *cameraOverlayViewController;
@property (nonatomic, retain) TracingOverlayViewController *tracingOverlayViewController;
@property (nonatomic, retain) IBOutlet UIButton *takePictureModeButton;
@property (nonatomic, retain) IBOutlet UIButton *backButton;
@property (nonatomic, retain) IBOutlet UIButton *tracingModeButton;
@property (nonatomic, retain) NSMutableArray *capturedImages;


-(IBAction)didHitBackButtonAction:(id)sender;
-(IBAction)pictureModeButtonAction:(id)sender;
-(IBAction)startTracing:(id)sender;

-(void)rightToTrace;


@end
@protocol AnnotationViewControllerDelegate
-(void)didHitBack;
@end