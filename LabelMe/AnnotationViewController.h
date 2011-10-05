//
//  AnnotationViewController.h
//  LabelMe
//
//  Created by David Way on 10/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AnnotationViewControllerDelegate;


@interface AnnotationViewController : UIViewController

@end


@protocol AnnotationViewControllerDelegate
-(void)didHitBack;
@end