//
//  AnnotationViewController.h
//  LabelMe
//
//  Created by David Way on 10/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraOverlayViewController.h"

@protocol AnnotationViewControllerDelegate;


@interface AnnotationViewController : UIViewController <UINavigationControllerDelegate, CameraOverlayViewControllerDelegate>
{
    id <AnnotationViewControllerDelegate> delegate;
    CameraOverlayViewController *cameraOverlayViewController;
    
    
@private
    UIButton *takePictureModeButton;
    UIButton *backButton;
    

}


@property (nonatomic, assign) id <AnnotationViewControllerDelegate> delegate;
@property (nonatomic, retain) CameraOverlayViewController  *cameraOverlayViewController;
@property (nonatomic, retain) IBOutlet UIButton *takePictureModeButton;
@property (nonatomic, retain) IBOutlet UIButton *backButton;

-(IBAction)didHitBackButtonAction:(id)sender;
-(IBAction)pictureModeButtonAction:(id)sender;


@end
@protocol AnnotationViewControllerDelegate
-(void)didHitBack;
@end