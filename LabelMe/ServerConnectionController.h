//
//  ServerConnectionController.h
//  LabelMe
//
//  Created by David Way on 2/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ServerConnectionController : NSObject <NSStreamDelegate>
{
    
    NSString* serverJPGReceiverURL;
    
    NSURLConnection *           _connection;
    NSData *                    _bodyPrefixData;
    NSInputStream *             _fileStream;
    NSData *                    _bodySuffixData;
    NSOutputStream *            _producerStream;
    NSInputStream *             _consumerStream;
    const uint8_t *             _buffer;
    uint8_t *                   _bufferOnHeap;
    size_t                      _bufferOffset;
    size_t                      _bufferLimit;
    
    NSData *                    _dataToSend;
    
}


-(void)sendJPGtoServer:(UIImage*)pictureToSend;
-(void)initWithDefaultReceivers;


@property (retain, retain) NSString* serverJPGReceiverURL;





@end
