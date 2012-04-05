//
//  Box.h
//  LabelMe_work
//
//  Created by David Way on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>

@interface Box : NSObject{
    CGPoint upperLeft;
    CGPoint lowerRigth;
    NSString *label;
    UIColor *color;
}

@property (retain, nonatomic) NSString *label;
@property (retain, nonatomic) UIColor *color;

-(int) setUpperLeft:(CGPoint ) point;
-(int) setLowerRight:(CGPoint ) point;
-(CGPoint) upperLeft;
-(CGPoint) lowerRight;
-(void) updatePoints:(CGPoint) start:(CGPoint) end;
-(void) updateUpperLeft:(CGPoint) start:(CGPoint) end;
-(void) updateLowerRight:(CGPoint) start:(CGPoint) end;

@end
