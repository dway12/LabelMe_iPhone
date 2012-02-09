//
//  BoxDrawView.m
//  LabelMe
//
//  Created by David Way on 1/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoxDrawView.h"

@implementation BoxDrawView

- (id)initWithFrame:(CGRect)frame   
{
    self = [super initWithFrame:frame   ];
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    
        [self setBackgroundColor:[UIColor clearColor]];
        


        

        
    }
    return self;
}


- (void)setPoints:(CGPoint*) array
{
    one = array[0];    
    two = array[1];
    three = array[2];
    four = array[3];
    
    
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    CGContextSetRGBStrokeColor(context, 255, 0, 0, 1.0);
    CGContextSetLineWidth(context, 20);
    
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, one.x, one.y); //start point
    CGContextAddLineToPoint(context, two.x, two.y);
    CGContextAddLineToPoint(context, four.x, four.y); 

    CGContextAddLineToPoint(context, three.x, three.y);
    
    CGContextClosePath(context); // close path
    
    CGContextSetLineWidth(context, 8.0); // this is set from now on until you explicitly change it
    
    CGContextStrokePath(context); // do actual stroking
    
    UIGraphicsEndImageContext();


    
    
}


@end
