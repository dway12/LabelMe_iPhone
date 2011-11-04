//
//  TracingOverlayViewController.m
//  LabelMe
//
//  Created by David Way on 10/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TracingOverlayViewController.h"

@implementation TracingOverlayViewController

@synthesize doneTracingButton,cancelButton,delegate,tracingPictureView, locationArray, tracingPicture;

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [[event allTouches] anyObject];
	location = [touch locationInView:touch.view];
    NSString *value =  NSStringFromCGPoint(location);
    [self.locationArray addObject:value];
    NSLog(@"%@", NSStringFromCGPoint(location));
    
    if( upperLeft == nil){
        
        upperLeft = &location;
    }else{
        
        lowerRight = &location;
        [self drawRect];
    }
    
    
	
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	//[self touchesBegan:touches withEvent:event];
}
-(void)drawRect
{
    //draws rectangle
    UIGraphicsBeginImageContext(self.view.bounds.size);	
    NSLog(@"%@", NSStringFromCGSize(self.view.bounds.size));

    
    CGContextRef context = UIGraphicsGetCurrentContext();
    // flip orientation
//    CGContextTranslateCTM(context, 0, self.view.bounds.size.height);
//    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextDrawImage(context, self.view.bounds, self.tracingPicture.CGImage);
    NSLog(@"drawing image");
    
    // drawing with a white stroke color
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    // drawing with a white fill color
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
    // Add Filled Rectangle, 
    CGContextFillRect(context, CGRectMake(0.0, 0.0, 200.0, 200.0));
    
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    [self setPicture:screenshot];
    
}

-(void)viewDidLoad
{

    self.tracingPictureView.image = tracingPicture;

}


-(void)viewDidUnload
{
    self.tracingPictureView = nil;
    self.cancelButton = nil;
    self.doneTracingButton = nil;
    [super viewDidUnload];
    
}
-(void)dealloc
{
    [tracingPictureView release];
    [cancelButton release];
    [doneTracingButton release];
    
    [super release];
    
    
}
-(void)setPicture:(UIImage*)picture
{
    
    self->tracingPicture = picture;
    self.tracingPictureView.image = tracingPicture;

    NSLog(@"set picture");
}

- (UIImage*)imageByCropping:(UIImage *)imageToCrop toRect:(CGRect)rect
{
    //create a context to do our clipping in
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    //create a rect with the size we want to crop the image to
    //the X and Y here are zero so we start at the beginning of our
    //newly created context
    CGRect clippedRect = CGRectMake(0, 0, rect.size.width, rect.size.height);
    CGContextClipToRect( currentContext, clippedRect);
    
    //create a rect equivalent to the full size of the image
    //offset the rect by the X and Y we want to start the crop
    //from in order to cut off anything before them
    CGRect drawRect = CGRectMake(rect.origin.x * -1,
                                 rect.origin.y * -1,
                                 imageToCrop.size.width,
                                 imageToCrop.size.height);
    
    //draw the image to our clipped context using our offset rect
    CGContextDrawImage(currentContext, drawRect, imageToCrop.CGImage);
    
    //pull the image from our cropped context
    UIImage *cropped = UIGraphicsGetImageFromCurrentImageContext();
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    
    //Note: this is autoreleased
    return cropped;
}

#pragma mark -
#pragma mark tracing actions

-(IBAction)doneTracingAction:(id)sender
{
    
    
}
-(IBAction)cancelAction:(id)sender
{
    
    [self.delegate didHitCancel];
    
    
}
-(IBAction)touchPicture:(id)sender
{

    
    
    
}


@end
