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

@synthesize doneTracingButton, cancelButton, delegate, tracingPictureView, tracingPicture, originalTracingPicture, LabelerText, labelString, pointStringComplete, imageScaleFactor,    currentIndex, boxDrawView;

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint location = [touch locationInView:touch.view];
    
    currentIndex = 6;
    float dist = 1000000;
    float newdist;
    
    for (int i = 0; i<4 ;i++)
    {
        
        CGPoint tempPoint = imagesArray[i];
        newdist = sqrt( pow((location.x-tempPoint.x),2) + pow((location.y-tempPoint.y),2) );

        
        if (newdist<dist)
        {
            dist = newdist;
            currentIndex = i;
            
        }
        
    }
    
    NSLog(@"touch");

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (currentIndex != 6)
    {
        
        UITouch *touch = [[event allTouches] anyObject];
        CGPoint location = [touch locationInView:touch.view];
        
      //  NSLog(@"touch point: %@", NSStringFromCGPoint(location));
      //  location.y = location.y  ;
                     

        if (currentIndex == 0)
        {
            imagesArray[0] = location;
            imagesArray[1].y = location.y;
            imagesArray[2].x = location.x;
            locationUpperLeft = location;
            
        }else if( currentIndex == 1)
        {
            imagesArray[1] = location;
            imagesArray[0].y = location.y;
            imagesArray[3].x = location.x;
            locationUpperLeft.y = location.y;
            locationLowerRight.x = location.x;
            
        }else if (currentIndex == 2)
        {
            imagesArray[2] = location;
            imagesArray[0].x = location.x;
            imagesArray[3].y = location.y;
            locationLowerRight.y = location.y;
            locationUpperLeft.x = location.x;
            
            
        }else if(currentIndex  == 3)
        {
            
            imagesArray[3] = location;
            imagesArray[2].y = location.y;
            imagesArray[1].x = location.x;
            locationLowerRight = location;
            
        }
        //NSLog(@"%@", NSStringFromCGPoint(imagesArray[0]));
        [boxDrawView setPoints:imagesArray];
        [boxDrawView setNeedsDisplay];
        
    }    
    
}
-(void)drawRect
{

}

-(void)clearBox
{
    upperLeft = nil;
    lowerRight = nil;
    [self setPicture:originalTracingPicture];

}

-(void)createPointString
{
    
    // had to modify the y value image scale factor 
    int upperLeftX = locationUpperLeft.x *imageScaleFactor;
    int upperLeftY = locationUpperLeft.y *imageScaleFactor * 1.13;
    int lowerRightX = locationLowerRight.x *imageScaleFactor;
    int lowerRightY = locationLowerRight.y *imageScaleFactor* 1.13;
    pointStringUpperLeft = [NSString stringWithFormat:@"{%i, %i}",upperLeftX,upperLeftY];
    pointStringLowerRight = [NSString stringWithFormat:@"{%i, %i}",lowerRightX, lowerRightY];

    [pointStringComplete autorelease];
    pointStringComplete = [[NSString stringWithFormat:@"%@%@",pointStringUpperLeft, pointStringLowerRight] retain];
    NSLog(@"pointString: ");
    NSLog(@"%@", pointStringComplete);
    
    
    
}

-(void)viewDidLoad
{

    [super viewDidLoad];
    
    imagesArray = malloc(sizeof(CGPoint)*4);
    imagesArray[0] = CGPointMake(100, 100);
    imagesArray[1] = CGPointMake(300, 100);
    imagesArray[2] = CGPointMake(100, 300);
    imagesArray[3] = CGPointMake(300, 300);
    
    locationLowerRight = imagesArray[3];
    locationUpperLeft = imagesArray[0];
    
    
    boxDrawView = [[BoxDrawView alloc] initWithFrame:CGRectMake(0, 45, 320, 460)];
    [self.view addSubview:self.boxDrawView];
    [boxDrawView setPoints:imagesArray];
    
    
    
    
    self.tracingPictureView.image = tracingPicture;
    
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
    [labelString release];
    [boxDrawView release];
    free(imagesArray);
    [super release];
    
    
}
-(void)setOriginalPicture:(UIImage*)picture
{
    self->originalTracingPicture = picture;
    self->tracingPicture = picture;
    self.tracingPictureView.image = picture;
    NSLog(@"set ori pic");
    //self.boxDrawView.backgroundColor= [UIColor colorWithPatternImage:originalTracingPicture];

    
}
-(void)setPicture:(UIImage*)picture
{
    
    self->tracingPicture = picture;
    self.tracingPictureView.image = picture;

    NSLog(@"set picture");
}



#pragma mark -
#pragma mark tracing actions

-(IBAction)doneTracingAction:(id)sender
{
    
    [self createPointString];
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
    labelString = theLabelerText.text;
    
    labelString = [labelString retain];
    NSLog(@"'%@'", labelString);

    
    return YES;
}


@end
