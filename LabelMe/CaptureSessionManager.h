//
//  CaptureSessionManager.h
//  LabelMe_work
//
//  Created by David Way on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreMedia/CoreMedia.h>
#import <AVFoundation/AVFoundation.h>


@interface CaptureSessionManager : NSObject {
    
}

@property (retain) AVCaptureVideoPreviewLayer *previewLayer;
@property (retain) AVCaptureSession *captureSession;

- (void)addVideoPreviewLayer;
- (void)addVideoInput;

@end