//
//  CameraOverlayViewController.h
//  LabelMe
//
//  Created by David Way on 9/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@protocol CameraOverlayViewControllerDelegate; 



@interface CameraOverlayViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    
    id <CameraOverlayViewControllerDelegate> delegate;
    UIImagePickerController *imagePickerController;
    
@private
    
    UIBarButtonItem *takePictureButton;
    UIBarButtonItem *backButton;
    
    
    
}

@property (nonatomic, assign) id<CameraOverlayViewControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UIImagePickerController *imagePickerController;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *takePictureButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *backButton;

-(void)setupImagePicker:(UIImagePickerControllerSourceType)sourceType;

-(IBAction)done:(id)sender;
-(IBAction)takePicture:(id)sender;


@end


@protocol CameraOverlayViewControllerDelegate
- (void)didTakePicture:(UIImage *)picture;
- (void)didFinishWithCamera;
- (void)rightToTrace;
- (void)didHitDone;
@end