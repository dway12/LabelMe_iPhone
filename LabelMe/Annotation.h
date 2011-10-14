//
//  Annotation.h
//  LabelMe
//
//  Created by David Way on 10/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AnnotationViewControllerDelegate;


@interface Annotation : UIViewController <UINavigationControllerDelegate>

@end

@protocol AnnotationViewControllerDelegate
-(void)didHitBack;
@end