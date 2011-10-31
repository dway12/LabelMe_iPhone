//
//  AnnotationViewController.m
//  LabelMe
//
//  Created by David Way on 10/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnnotationViewController.h"

@implementation AnnotationViewController

@synthesize cameraOverlayViewController, takePictureModeButton, delegate,capturedImages,
            backButton, tracingOverlayViewController, tracingModeButton;


-(void)viewDidLoad
{
    self.cameraOverlayViewController = 
    [[[CameraOverlayViewController alloc] initWithNibName:@"CameraOverlay" bundle:nil] autorelease];
    
    self.tracingOverlayViewController = 
    [[[TracingOverlayViewController alloc] initWithNibName:@"TracingOverlayView" bundle:nil] autorelease];
    
    self.capturedImages = [NSMutableArray array];

    
    self.cameraOverlayViewController.delegate = self;
    self.tracingOverlayViewController.delegate = self;
    
}
-(void)viewDidUnload
{
    tracingOverlayViewController = nil;
    cameraOverlayViewController = nil;
    takePictureModeButton = nil;
    backButton = nil;
    capturedImages = nil;
    
    
}
-(void)dealloc
{
    [tracingOverlayViewController release];
    [cameraOverlayViewController release];
    [takePictureModeButton release];
    [backButton release];
    [capturedImages release];
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
        [self.cameraOverlayViewController setupImagePicker:sourceType];
        [self presentModalViewController:self.cameraOverlayViewController.imagePickerController animated:YES];
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
    [self.tracingOverlayViewController setPicture:picture];
    NSLog(@"finished did take picture");


    
    
    
}
-(IBAction)startTracing:(id)sender
{
    NSLog(@"blahblahb");

    [self presentModalViewController:self.tracingOverlayViewController animated:YES];
    
}
-(void)didFinishWithCamera
{

    
    [self dismissModalViewControllerAnimated:YES];


}


#pragma mark -
#pragma mark TracingOverlayViewDelegate
-(void)finishedTracing
{
    //send data to server
    [self dismissModalViewControllerAnimated:YES];
    
}

-(void)didHitCancel
{
    
    [self dismissModalViewControllerAnimated:YES];
}



@end
