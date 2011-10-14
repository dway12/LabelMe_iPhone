//
//  AnnotationViewController.m
//  LabelMe
//
//  Created by David Way on 10/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnnotationViewController.h"

@implementation AnnotationViewController

@synthesize cameraOverlayViewController, takePictureModeButton, delegate,
            backButton;


-(void)viewDidLoad
{
    self.cameraOverlayViewController = 
    [[[CameraOverlayViewController alloc] initWithNibName:@"CameraOverlayView" bundle:nil] autorelease];
    
    self.cameraOverlayViewController.delegate = self;
    
}
-(void)viewDidUnload
{
    cameraOverlayViewController = nil;
    takePictureModeButton = nil;
    backButton = nil;
    
    
}
-(void)dealloc
{
    [cameraOverlayViewController release];
    [takePictureModeButton release];
    [backButton release];
    [super dealloc];
    
}

-(IBAction)didHitBackButtonAction:(id)sender
{
    
    
    [self.delegate didHitBack];
}
-(IBAction)pictureModeButtonAction:(id)sender
{
    
    
    
}

-(void)didTakePicture:(UIImage *)picture
{
    
    
}
-(void)didFinishWithCamera
{
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
