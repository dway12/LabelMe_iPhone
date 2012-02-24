//
//  ServerConnectionController.m
//  LabelMe
//
//  Created by David Way on 2/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ServerConnectionController.h"

@implementation ServerConnectionController

@synthesize serverJPGReceiverURL;


-(void)initWithDefaultReceivers
{
    
    self.serverJPGReceiverURL = @"http://people.csail.mit.edu/dway/ServerReceivers/file_upload.php";
    
}
    
+(void)sendJPGtoServer:(UIImage*)pictureToSend
{
    // send only the picture!!
    
    //NSLog(@"settingupRequest");
    //NSLog(@"pointStringComplete: %@", pointStringComplete);
    // NSLog(@"label text1: %@", labelText1);
   // NSLog(@"the size of the image is %f, %f", pictureToSend.size.width, pictureToSend.size.height);
    
    UIGraphicsBeginImageContext(CGSizeMake(480, 690));
    [pictureToSend drawInRect:CGRectMake(0, 0, 480, 690)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();    
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImageJPEGRepresentation(newImage, 1);
	// setting up the URL to post to
	NSString *urlString = @"http://people.csail.mit.edu/dway/ServerReceivers/file_upload.php";
	
	// setting up the request object now
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setTimeoutInterval:30.0];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    
    NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    //NSLog(@"start%@middle%@end.jpg", labelText1, pointStringComplete);
    
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"defaultJPG.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	// setting the body of the post to the reqeust
	[request setHTTPBody:body];
	
	// now lets make the connection to the web
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", returnString);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank you" 
                                                    message:@"Picture and label uploaded successfully!"
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles: nil];
    [alert show];
    [alert release];
    
    

}




@end
