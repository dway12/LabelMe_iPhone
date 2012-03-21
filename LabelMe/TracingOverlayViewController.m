//
//  TracingOverlayViewController.m
//  LabelMe
//
//  Created by David Way on 10/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TracingOverlayViewController.h"
#import "BoxDrawView.h"


@implementation TracingOverlayViewController

@synthesize doneTracingButton =     _doneTracingButton;
@synthesize cancelButton =          _cancelButton;
@synthesize delegate =              _delegate;
@synthesize tracingPictureView =    _tracingPictureView;
@synthesize tracingPicture =        _tracingPicture;
@synthesize LabelerText =           _LabelerText;
@synthesize labelString =           _labelString;
@synthesize imageScaleFactor =      _imageScaleFactor;
@synthesize currentIndex =          _currentIndex;
@synthesize boxDrawView =           _boxDrawView;

@synthesize serverConnectionController = _serverConnectionController;

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint location = [touch locationInView:touch.view];
    
    self.currentIndex = 6;
    float dist = 1000000;
    float newdist;
    
    for (int i = 0; i<4 ;i++)
    {
        
        CGPoint tempPoint = imagesArray[i];
        newdist = sqrt( pow((location.x-tempPoint.x),2) + pow((location.y-tempPoint.y),2) );

        
        if (newdist<dist)
        {
            dist = newdist;
            self.currentIndex = i;
            
        }
        
    }
    

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.currentIndex != 6)
    {
        
        UITouch *touch = [[event allTouches] anyObject];
        CGPoint location = [touch locationInView:touch.view];
        
      //  NSLog(@"touch point: %@", NSStringFromCGPoint(location));
      //  location.y = location.y  ;
                     

        if (self.currentIndex == 0)
        {
            imagesArray[0] = location;
            imagesArray[1].y = location.y;
            imagesArray[2].x = location.x;
            locationUpperLeft = location;
            
        }else if( self.currentIndex == 1)
        {
            imagesArray[1] = location;
            imagesArray[0].y = location.y;
            imagesArray[3].x = location.x;
            locationUpperLeft.y = location.y;
            locationLowerRight.x = location.x;
            
        }else if (self.currentIndex == 2)
        {
            imagesArray[2] = location;
            imagesArray[0].x = location.x;
            imagesArray[3].y = location.y;
            locationLowerRight.y = location.y;
            locationUpperLeft.x = location.x;
            
            
        }else if(self.currentIndex  == 3)
        {
            
            imagesArray[3] = location;
            imagesArray[2].y = location.y;
            imagesArray[1].x = location.x;
            locationLowerRight = location;
            
        }
        //NSLog(@"%@", NSStringFromCGPoint(imagesArray[0]));
        [self.boxDrawView setPoints:imagesArray];
        [self.boxDrawView setNeedsDisplay];
        
    }    
    
}
-(void)drawRect
{

}


-(void)createPointString
{
    
    // had to modify the y value image scale factor 
    int upperLeftX = locationUpperLeft.x *self.imageScaleFactor;
    int upperLeftY = locationUpperLeft.y *self.imageScaleFactor * 1.13;
    int lowerRightX = locationLowerRight.x *self.imageScaleFactor;
    int lowerRightY = locationLowerRight.y *self.imageScaleFactor* 1.13;
    pointStringUpperLeft = [NSString stringWithFormat:@"{%i, %i}",upperLeftX,upperLeftY];
    pointStringLowerRight = [NSString stringWithFormat:@"{%i, %i}",lowerRightX, lowerRightY];

    [pointStringComplete autorelease];
    pointStringComplete = [[NSString stringWithFormat:@"%@%@",pointStringUpperLeft, pointStringLowerRight] retain];
    NSLog(@"pointString: ");
    NSLog(@"%@", pointStringComplete);
    
    
    
}

UIToolbar *toolbar;

-(void)viewDidLoad
{

    [super viewDidLoad];
    self.serverConnectionController = [ServerConnectionController alloc];
    
    // if settings allow
    [self.serverConnectionController initWithDefaultReceivers];

    imagesArray = malloc(sizeof(CGPoint)*4);
    imagesArray[0] = CGPointMake(100, 100);
    imagesArray[1] = CGPointMake(300, 100);
    imagesArray[2] = CGPointMake(100, 300);
    imagesArray[3] = CGPointMake(300, 300);
    
    locationLowerRight = imagesArray[3];
    locationUpperLeft = imagesArray[0];
    
    
    self.boxDrawView = [[BoxDrawView alloc] initWithFrame:CGRectMake(0, 45, 320, 415)];
    [self.view addSubview:self.boxDrawView];
    [self.boxDrawView setPoints:imagesArray];
    
    
    
    
    self.tracingPictureView.image = self.tracingPicture;
    
    self.imageScaleFactor = 1.5;
    

    
    

    


}


-(void)viewDidUnload
{
    self.serverConnectionController = nil;
    self.tracingPictureView = nil;
    self.cancelButton = nil;
    self.doneTracingButton = nil;
    self.LabelerText = nil;
    self.labelString = nil;
    self.boxDrawView  = nil;
    [super viewDidUnload];
    
}
-(void)dealloc
{
    NSLog(@"Why");
    [self.serverConnectionController release];
    [self.tracingPictureView release];
    [self.cancelButton release];
    [self.doneTracingButton release];
    [self.LabelerText release];
    [self.labelString release];
    [self.labelString release];
    [self.boxDrawView release];
    free(imagesArray);
    [super release];
    
    
}

-(void)setPicture:(UIImage*)picture
{
    
    self.tracingPicture = picture;
    self.tracingPictureView.image = picture;

}



#pragma mark -
#pragma mark tracing actions

-(IBAction)doneTracingAction:(id)sender
{
    
    NSLog(@"sendbutton hit");
    [self.serverConnectionController sendJPGtoServer:self.tracingPicture];
    

    
    
}
-(IBAction)cancelAction:(id)sender
{
    //upperLeft = nil;
    //lowerRight = nil;
    
    [self.delegate didHitCancel];
    
    
}
-(IBAction)touchPicture:(id)sender
{

    
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField*)theLabelerText
{
    [theLabelerText resignFirstResponder];
    self.labelString = theLabelerText.text;
    self.labelString = [self.labelString retain];

    
    return YES;
}


@end
