//
//  LabelMeViewController.m
//  LabelMe
//
//  Created by David Way on 9/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LabelMeViewController.h"

@implementation LabelMeViewController


@synthesize AnnotationButton, Button2, Button3;

#pragma mark -
#pragma mark LabelMeViewController
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
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
