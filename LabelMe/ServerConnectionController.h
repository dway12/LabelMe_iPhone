//
//  ServerConnectionController.h
//  LabelMe
//
//  Created by David Way on 2/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerConnectionController : NSObject
{
    
    NSString* serverJPGReceiverURL;
    
}
+(void)sendJPGtoServer:(UIImage*)pictureToSend;
-(void)initWithDefaultReceivers;


@property (retain, readwrite) NSString* serverJPGReceiverURL;





@end
