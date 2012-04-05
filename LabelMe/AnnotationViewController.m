//
//  AnnotationViewController.m
//  LabelMe
//
//  Created by David Way on 10/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnnotationViewController.h"

@implementation AnnotationViewController

@synthesize cameraOverlayViewController=        _cameraOverlayViewController;
@synthesize takePictureModeButton =             _takePictureModeButton;
@synthesize delegate =                          _delegate;
@synthesize capturedImages =                    _capturedImages;
@synthesize backButton =                        _backButton;
@synthesize tracingModeButton =                 _tracingModeButton;


-(void)viewDidLoad
{

    
    
    
    self.capturedImages = [NSMutableArray array];

    
    
}
-(void)viewDidUnload
{
    self.tracingModeButton = nil;
    self.delegate = nil;
    self.takePictureModeButton = nil;
    self.backButton = nil;
    self.capturedImages = nil;
    
    
}
-(void)dealloc
{
  //  NSLog(@"??");
    [self.tracingModeButton release];
    [self.cameraOverlayViewController release];
    [self.takePictureModeButton release];
    [self.backButton release];
    [self.capturedImages release];
    [super dealloc];
    
}

-(void)showImagePicker:(UIImagePickerControllerSourceType)sourceType
{

    if(self.capturedImages.count > 0)
    {
        [self.capturedImages removeAllObjects];
    }
    
    if ([UIImagePickerController isSourceTypeAvailable:sourceType])
    {
 //       [self.cameraOverlayViewController setupImagePicker:sourceType];
 //       [self presentModalViewController:self.cameraOverlayViewController.imagePickerController animated:YES];
    }
    
    
    
}

#pragma mark -
#pragma mark Annotation Actions

-(IBAction)didHitBackButtonAction:(id)sender
{
    
    
    [self.delegate didHitBack];
}
-(IBAction)pictureModeButtonAction:(id)sender
{
    [self showImagePicker:UIImagePickerControllerSourceTypeCamera];
    
    
}


-(IBAction)pictureLibraryModeButtonAction:(id)sender
{
    [self showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
    
}

#pragma mark -
#pragma mark CameraOverlayViewDelegate

-(void)didTakePicture:(UIImage *)picture
{
    
    //send picture to labeling view
    [self.capturedImages addObject:picture];


    
    
    
}
-(IBAction)startTracing:(id)sender
{

    
}
-(void)didFinishWithCamera
{

    
    [self dismissModalViewControllerAnimated:YES];
    [self rightToTrace];


}

-(void)didHitDone
{
    
    [self dismissModalViewControllerAnimated:YES];
}

-(void)rightToTrace
{
    if (self.modalViewController) {        
        [self performSelector:@selector(rightToTrace)
                   withObject:nil
                   afterDelay:0.1f];
        return;
    }

}


#pragma mark -
#pragma mark TracingOverlayViewDelegate


-(void)didHitCancel
{
    
    [self dismissModalViewControllerAnimated:YES];
}



@end
