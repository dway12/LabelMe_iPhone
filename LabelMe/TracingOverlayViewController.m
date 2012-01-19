//
//  TracingOverlayViewController.m
//  LabelMe
//
//  Created by David Way on 10/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TracingOverlayViewController.h"


@implementation TracingOverlayViewController

@synthesize doneTracingButton, cancelButton, delegate, tracingPictureView, tracingPicture, originalTracingPicture, LabelerText, labelString, pointStringComplete, imageScaleFactor;

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [[event allTouches] anyObject];

    
    if( upperLeft == nil && lowerRight == nil ){
        locationUpperLeft = [touch locationInView:touch.view];

        NSLog(@"upper Left:");
        NSLog(@"%@", NSStringFromCGPoint(locationUpperLeft));

        upperLeft = &locationUpperLeft;
    }else if (upperLeft != nil && lowerRight == nil){
        locationLowerRight = [touch locationInView:touch.view];

        NSLog(@"lowerRight");
        NSLog(@"%@", NSStringFromCGPoint(locationLowerRight));

        lowerRight = &locationLowerRight;
        
        // create point string for embed, draw over picture
        [self createPointString];
        [self drawRect];
    }else{
        NSLog(@"clearingBox");
        [self clearBox];
    }
    
    
	
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	//[self touchesBegan:touches withEvent:event];
}

-(void)clearBox
{
    upperLeft = nil;
    lowerRight = nil;
    [self setPicture:originalTracingPicture];

}
-(void)drawRect
{
    //draws rectangle
    UIGraphicsBeginImageContext(self.view.bounds.size);	
   // NSLog(@"%@", NSStringFromCGSize(self.view.bounds.size));

    
    CGContextRef context = UIGraphicsGetCurrentContext();
    // flip orientation
    CGContextScaleCTM(context, 1, -1);
    CGContextRotateCTM(context, -3.14159265/2);
    
    CGContextDrawImage(context, CGRectMake(0, 0, 460, 320), self.tracingPicture.CGImage);
    NSLog(@"drawing image");
    
    // drawing with a white stroke color
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextSetLineWidth(context, 20);
    // drawing with a white fill color
    //CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
    // Add Filled Rectangle, 
    CGContextRotateCTM(context, -3.14159265/2);
    CGContextScaleCTM(context, -1, 1);
    
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, upperLeft->x, upperLeft->y); //start point
    CGContextAddLineToPoint(context, lowerRight->x, upperLeft->y);
    CGContextAddLineToPoint(context, lowerRight->x, lowerRight->y);
    CGContextAddLineToPoint(context, upperLeft->x, lowerRight->y); // end path
    
    CGContextClosePath(context); // close path
    
    CGContextSetLineWidth(context, 8.0); // this is set from now on until you explicitly change it
    
    CGContextStrokePath(context); // do actual stroking
    
    UIImage *screenshot1 = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    [self setPicture:screenshot1];
    
}
-(void)createPointString
{
    double upperLeftX = locationUpperLeft.x *imageScaleFactor;
    double upperLeftY = locationUpperLeft.y *imageScaleFactor;
    double lowerRightX = locationLowerRight.x *imageScaleFactor;
    double lowerRightY = locationLowerRight.y *imageScaleFactor;
    pointStringUpperLeft = [NSString stringWithFormat:@"{%.02f, %.02f}",upperLeftX,upperLeftY];
    pointStringLowerRight = [NSString stringWithFormat:@"{%.02f, %.02f}",lowerRightX, lowerRightY];

    [pointStringComplete autorelease];
    pointStringComplete = [[NSString stringWithFormat:@"%@%@",pointStringUpperLeft, pointStringLowerRight] retain];
    NSLog(@"pointString: ");
    NSLog(@"%@", pointStringComplete);
    
    
    
}

-(void)viewDidLoad
{

    self.tracingPictureView.image = tracingPicture;
    //[LabelTextFieldItem initWithCustomView:LabelerText];
    self.imageScaleFactor = 1.5;

}


-(void)viewDidUnload
{
    self.tracingPictureView = nil;
    self.cancelButton = nil;
    self.doneTracingButton = nil;
    self.LabelerText = nil;
    self.pointStringComplete = nil;
    self.labelString = nil;
    [super viewDidUnload];
    
}
-(void)dealloc
{
    [tracingPictureView release];
    [cancelButton release];
    [doneTracingButton release];
    [LabelerText release];
    [pointStringComplete release];
    [labelString release];
    [super release];
    
    
}
-(void)setOriginalPicture:(UIImage*)picture
{
    self->originalTracingPicture = picture;
    self->tracingPicture = picture;
    self.tracingPictureView.image = picture;
    NSLog(@"set ori pic");
    
}
-(void)setPicture:(UIImage*)picture
{
    
    self->tracingPicture = picture;
    self.tracingPictureView.image = picture;

    NSLog(@"set picture");
}

//- (UIImage*)imageByCropping:(UIImage *)imageToCrop toRect:(CGRect)rect
//{
//    //create a context to do our clipping in
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef currentContext = UIGraphicsGetCurrentContext();
//    
//    //create a rect with the size we want to crop the image to
//    //the X and Y here are zero so we start at the beginning of our
//    //newly created context
//    CGRect clippedRect = CGRectMake(0, 0, rect.size.width, rect.size.height);
//    CGContextClipToRect( currentContext, clippedRect);
//    
//    //create a rect equivalent to the full size of the image
//    //offset the rect by the X and Y we want to start the crop
//    //from in order to cut off anything before them
//    CGRect drawRect = CGRectMake(rect.origin.x * -1,
//                                 rect.origin.y * -1,
//                                 imageToCrop.size.width,
//                                 imageToCrop.size.height);
//    
//    //draw the image to our clipped context using our offset rect
//    CGContextDrawImage(currentContext, drawRect, imageToCrop.CGImage);
//    
//    //pull the image from our cropped context
//    UIImage *cropped = UIGraphicsGetImageFromCurrentImageContext();
//    
//    //pop the context to get back to the default
//    UIGraphicsEndImageContext();
//    
//    //Note: this is autoreleased
//    return cropped;
//}

#pragma mark -
#pragma mark tracing actions

-(IBAction)doneTracingAction:(id)sender
{
    
    NSLog(@"doneTracingAction clicked");
    [self.delegate finishedTracing:originalTracingPicture:labelString:pointStringComplete];
    
}
-(IBAction)cancelAction:(id)sender
{
    upperLeft = nil;
    lowerRight = nil;
    
    [self.delegate didHitCancel];
    
    
}
-(IBAction)touchPicture:(id)sender
{

    
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField*)theLabelerText
{
    [theLabelerText resignFirstResponder];
    NSLog(@"did hit enter");
    NSLog(@"%@", theLabelerText.text);
    labelString = theLabelerText.text;
    
    return YES;
}


@end
