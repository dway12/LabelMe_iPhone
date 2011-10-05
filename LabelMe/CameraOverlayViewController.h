//
//  CameraOverlayViewController.h
//  LabelMe
//
//  Created by David Way on 9/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CameraOverlayViewControllerDelegate; 



@interface CameraOverlayViewController : UIViewController

@end


@protocol CameraOverlayViewControllerDelegate
- (void)didTakePicture:(UIImage *)picture;
- (void)didFinishWithCamera;
@end