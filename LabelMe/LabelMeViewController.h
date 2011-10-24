//
//  LabelMeViewController.h
//  LabelMe
//
//  Created by David Way on 9/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import "AnnotationViewController.h"


@interface LabelMeViewController : UIViewController <AnnotationViewControllerDelegate>
{
    

    AnnotationViewController *annotationViewController; //annotationView
    
    //home screen buttons

    UIButton *AnnotationButton;
    UIButton *Button2;
    UIButton *Button3;
    
    UIView  *LabelMeView;
}

@property (nonatomic, retain) AnnotationViewController *annotationViewController;

//home screen buttons
@property (nonatomic, retain) IBOutlet UIButton *AnnotationButton;
@property (nonatomic, retain) IBOutlet UIButton *Button2;
@property (nonatomic, retain) IBOutlet UIButton *Button3;
@property (nonatomic, retain) IBOutlet UIView *LabelMeView;

//home screen button actions
-(IBAction)annotationAction:(id)sender;
-(IBAction)Button2Action:(id)sender;
-(IBAction)Button3Action:(id)sender;




@end
