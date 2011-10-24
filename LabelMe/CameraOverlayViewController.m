//
//  CameraOverlayViewController.m
//  LabelMe
//
//  Created by David Way on 9/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CameraOverlayViewController.h"

@implementation CameraOverlayViewController

@synthesize delegate, takePictureButton, backButton, imagePickerController;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:@"CameraOverlay" bundle:nil]))
    {
        
        
        self.imagePickerController = [[[UIImagePickerController alloc] init] autorelease];
        self.imagePickerController.delegate = self;
    }
    return self;
    
}


-(void)viewDidUnload
{
    self.takePictureButton = nil;
    self.backButton = nil;
    self.imagePickerController = nil;
    [super viewDidUnload];
    
}

-(void)dealloc
{
    [takePictureButton release];
    [backButton release];
    [imagePickerController release];
    
    
    [super dealloc];
}

-(void)setupImagePicker:(UIImagePickerControllerSourceType)sourceType
{
    
    self.imagePickerController.sourceType = sourceType;
    
    if (sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        // user wants to use the camera interface
        //
        self.imagePickerController.showsCameraControls = NO;
        
        if ([[self.imagePickerController.cameraOverlayView subviews] count] == 0)
        {
            // setup our custom overlay view for the camera
            //
            // ensure that our custom view's frame fits within the parent frame
            CGRect overlayViewFrame = self.imagePickerController.cameraOverlayView.frame;
            CGRect newFrame = CGRectMake(0.0,
                                         CGRectGetHeight(overlayViewFrame) -
                                         self.view.frame.size.height - 10.0,
                                         CGRectGetWidth(overlayViewFrame),
                                         self.view.frame.size.height + 10.0);
            self.view.frame = newFrame;
            [self.imagePickerController.cameraOverlayView addSubview:self.view];
        }
    }
    

    
}

//called when parent app recieved memory warning
-(void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    
    
}

-(void)finishAndUpdate
{
    [self.delegate didFinishWithCamera];
    self.backButton.enabled = YES;
    self.takePictureButton.enabled = YES;
    
    
}

#pragma mark -
#pragma mark Camera Actions

-(IBAction)done:(id)sender
{
    
    [self finishAndUpdate];
}

-(IBAction)takePicture:(id)sender
{
    
    [self.imagePickerController takePicture];
}


#pragma mark -
#pragma mark UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    // give the taken picture to our delegate
    if (self.delegate)
        [self.delegate didTakePicture:image];
    
    [self finishAndUpdate];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.delegate didFinishWithCamera];
    
}

@end





