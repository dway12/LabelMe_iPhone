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
    [self.tracingOverlayViewController setOriginalPicture:picture];
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
-(void)finishedTracing: (UIImage*) pictureToSend: (NSString*) labelText1: (NSString*) pointStringComplete
{
  

    NSLog(@"settingupRequest");
    NSLog(@"the size of the image is %f, %f", pictureToSend.size.width, pictureToSend.size.height);
    UIGraphicsBeginImageContext(CGSizeMake(480, 690));
    [pictureToSend drawInRect:CGRectMake(0, 0, 480, 690)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();    
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImageJPEGRepresentation(newImage, 1);
	// setting up the URL to post to
	NSString *urlString = @"http://people.csail.mit.edu/dway/file_upload.php";
	
	// setting up the request object now
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setTimeoutInterval:60.0];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    
    NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"start%@middle%@end.jpg\"\r\n", labelText1, pointStringComplete] dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"start%@middle%@end.jpg", labelText1,pointStringComplete);
    [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	// setting the body of the post to the reqeust
	[request setHTTPBody:body];
	
	// now lets make the connection to the web
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", returnString);



}

-(void)didHitCancel
{
    
    [self dismissModalViewControllerAnimated:YES];
}



@end
