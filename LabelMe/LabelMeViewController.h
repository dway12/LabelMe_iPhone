//
//  LabelMeViewController.h
//  LabelMe
//
//  Created by David Way on 9/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>

#import <AnnotationViewController.h>

@interface LabelMeViewController : UIViewController <AnnotationViewControllerDelegate>
{
    
    
    AnnotationViewController *annotationViewController; //annotationView
}

@property (nonatomic, retain) AnnotationViewController *annotationViewController;

//home screen buttons
-(IBAction)annotationAction:(id)sender;

@end
