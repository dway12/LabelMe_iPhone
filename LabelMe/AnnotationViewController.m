//
//  AnnotationViewController.m
//  LabelMe
//
//  Created by David Way on 10/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnnotationViewController.h"

@implementation AnnotationViewController

@synthesize cameraOverlayViewController =       _cameraOverlayViewController;
@synthesize takePictureModeButton =             _takePictureModeButton;
@synthesize delegate =                          _delegate;
@synthesize capturedImages =                    _capturedImages;
@synthesize backButton =                        _backButton;
@synthesize tracingOverlayViewController =      _tracingOverlayViewController;
@synthesize tracingModeButton =                 _tracingModeButton;


-(void)viewDidLoad
{
    self.cameraOverlayViewController = 
    [[[CameraOverlayViewController alloc] initWithNibName:@"CameraOverlay" bundle:nil] autorelease];
    
    self.tracingOverlayViewController = 
    [[TracingOverlayViewController alloc] initWithNibName:@"TracingOverlayView" bundle:nil];
    
    self.capturedImages = [NSMutableArray array];

    
    self.cameraOverlayViewController.delegate = self;
    self.tracingOverlayViewController.delegate = self;
    
}
-(void)viewDidUnload
{
    self.tracingOverlayViewController = nil;
    self.tracingModeButton = nil;
    self.delegate = nil;
    self.cameraOverlayViewController = nil;
    self.takePictureModeButton = nil;
    self.backButton = nil;
    self.capturedImages = nil;
    
    
}
-(void)dealloc
{
    NSLog(@"??");
    [self.tracingOverlayViewController release];
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


    
    
    
}
-(IBAction)startTracing:(id)sender
{

    [self presentModalViewController:self.tracingOverlayViewController animated:YES];
    
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

    [self presentModalViewController:self.tracingOverlayViewController animated:YES];
}


#pragma mark -
#pragma mark TracingOverlayViewDelegate


-(void)didHitCancel
{
    
    [self dismissModalViewControllerAnimated:YES];
}



@end
