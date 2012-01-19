//
//  LabelMeViewController.m
//  LabelMe
//
//  Created by David Way on 9/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LabelMeViewController.h"

@implementation LabelMeViewController


@synthesize AnnotationButton, Button2, Button3, annotationViewController, LabelMeView;

#pragma mark -
#pragma mark LabelMeViewController

-(void)viewDidLoad
{
    self.annotationViewController = 
            [[[AnnotationViewController alloc] initWithNibName:@"AnnotationView" bundle:nil] autorelease];
    
    self.annotationViewController.delegate = self;
    
}
-(void)viewDidUnload
{
    self.LabelMeView = nil;
    self.AnnotationButton = nil;
    self.Button2 = nil;
    self.Button3 = nil;
    self.annotationViewController = nil;
}



-(void)dealloc
{
    [annotationViewController release];
    [LabelMeView release];
    [AnnotationButton release];
    [Button3 release];
    [Button2 release];
    [super dealloc];
    
    
}
-(IBAction)annotationAction:(id)sender
{
    [self presentModalViewController:annotationViewController animated:YES];

    
    
}
-(IBAction)Button2Action:(id)sender
{
    
    
}
-(IBAction)Button3Action:(id)sender
{
    
    
}


#pragma mark -
#pragma mark AnnotationViewDelegate
-(void)didHitBack
{
    
    [self dismissModalViewControllerAnimated:YES];
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
