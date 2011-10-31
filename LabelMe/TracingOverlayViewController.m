//
//  TracingOverlayViewController.m
//  LabelMe
//
//  Created by David Way on 10/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TracingOverlayViewController.h"

@implementation TracingOverlayViewController

@synthesize doneTracingButton,cancelButton,delegate,tracingPictureView, locationArray;

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint location = [touch locationInView:touch.view];
    NSValue *value = [NSValue valueWithCGPoint:location];
    [self.locationArray addObject:value];
    NSLog(@"%@", NSStringFromCGPoint(location));
    
	
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	[self touchesBegan:touches withEvent:event];
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
