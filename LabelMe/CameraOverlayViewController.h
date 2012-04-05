//
//  CameraOverlayViewController.h
//  LabelMe
//
//  Created by David Way on 9/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "CaptureSessionManager.h"
#import "TagViewController.h"



@interface CameraOverlayViewController : UIViewController <UINavigationControllerDelegate>
{
    
    
    @private
    TagViewController *                             _tagViewController;
    UIBarButtonItem *                               _takePictureButton;
    CaptureSessionManager *                         _captureManager;
    AVCaptureStillImageOutput  *                    _stillImageOutput;
    
    IBOutlet UIToolbar *                            _toolbar;
    UIImage *                                       _picture;
    
    
}
@property(nonatomic, retain) UIImage * picture;
@property(nonatomic, retain) AVCaptureStillImageOutput *stillImageOutput;
@property(nonatomic, retain) TagViewController *tagViewController;
@property (retain) CaptureSessionManager *captureManager;
@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *takePictureButton;


-(IBAction)done:(id)sender;
-(IBAction)takePicture:(id)sender;


@end


