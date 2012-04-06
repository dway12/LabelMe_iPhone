//
//  Box.m
//  LabelMe_work
//
//  Created by David Way on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Box.h"
#import "Constants.h"

@implementation Box

@synthesize label,color;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        upperLeft = CGPointMake(0, 0 );
        lowerRigth = CGPointMake(150, 150);
        label= [NSString stringWithFormat:@""];
    }
    
    return self;
}
-(int) setUpperLeft:(CGPoint ) point{
    int corner=0;
    if (point.y<LINEWIDTH/2) {
        point.y=LINEWIDTH/2;
    }
    if (point.x<LINEWIDTH/2) {
        point.x=LINEWIDTH/2;
        
    }
    upperLeft = point;
    if ((upperLeft.x>lowerRigth.x)) {
        float copy;
        copy=upperLeft.x;
        upperLeft.x=lowerRigth.x;
        lowerRigth.x=copy;
        corner++;
    }
    if ((upperLeft.y>lowerRigth.y)) {
        float copy;
        copy=upperLeft.y;
        upperLeft.y=lowerRigth.y;
        lowerRigth.y=copy;
        corner+=2;
    }
    
    
    return corner;
    
    
}
-(int) setLowerRight:(CGPoint ) point{
    int corner=0;
    if (point.y>372-LINEWIDTH/2) {
        point.y=372-LINEWIDTH/2;
    }
    if (point.x>320-LINEWIDTH/2) {
        point.x=320-LINEWIDTH/2;
    }
    lowerRigth = point;
    
    if ((upperLeft.x>lowerRigth.x)) {
        float copy;
        copy=upperLeft.x;
        upperLeft.x=lowerRigth.x;
        lowerRigth.x=copy;
        corner++;
    }
    if ((upperLeft.y>lowerRigth.y)) {
        float copy;
        copy=upperLeft.y;
        upperLeft.y=lowerRigth.y;
        lowerRigth.y=copy;
        corner+=2;
    }
    
    
    return corner;
    
}

-(CGPoint) upperLeft{
    return upperLeft;
}
-(CGPoint) lowerRight{
    return lowerRigth;
}

-(void) updatePoints:(CGPoint) start:(CGPoint) end{
    if (upperLeft.y+end.y-start.y<LINEWIDTH/2) {
        end.y=LINEWIDTH/2-upperLeft.y+start.y;
        
    }
    if (lowerRigth.y+end.y-start.y>372-LINEWIDTH/2) {
        end.y=372-LINEWIDTH/2-lowerRigth.y+start.y;
        
        
    }
    if (upperLeft.x+end.x-start.x<LINEWIDTH/2) {
        end.x=LINEWIDTH/2-upperLeft.x+start.x;
        
    }
    if (lowerRigth.x+end.x-start.x>320-LINEWIDTH/2) {
        end.x=320-LINEWIDTH/2-lowerRigth.x+start.x;
        
    }
    
    
    
    
    upperLeft.x=upperLeft.x+end.x-start.x;
    upperLeft.y=upperLeft.y+end.y-start.y;
    lowerRigth.x=lowerRigth.x+end.x-start.x;
    lowerRigth.y=lowerRigth.y+end.y-start.y;
    /*if (upperLeft.y<LINEWIDTH/2) {
     upperLeft.y=LINEWIDTH/2;
     }
     if (lowerRigth.y>372-LINEWIDTH/2) {
     lowerRigth.y=372-LINEWIDTH/2;
     }
     if (upperLeft.x<LINEWIDTH/2) {
     upperLeft.x=LINEWIDTH/2;
     }
     if (lowerRigth.x>320-LINEWIDTH/2) {
     lowerRigth.x=320-LINEWIDTH/2;
     }*/
    
    
    
}
-(void) updateUpperLeft:(CGPoint) start:(CGPoint) end{
    upperLeft.x=upperLeft.x+end.x-start.x;
    upperLeft.y=upperLeft.y+end.y-start.y;
    if (upperLeft.y<LINEWIDTH/2) {
        upperLeft.y=LINEWIDTH/2;
    }
    if (upperLeft.x<LINEWIDTH/2) {
        upperLeft.x=LINEWIDTH/2;
    }
    if ((upperLeft.x>lowerRigth.x)) {
        float copy;
        copy=upperLeft.x;
        upperLeft.x=lowerRigth.x;
        lowerRigth.x=copy;
    }
    if ((upperLeft.y>lowerRigth.y)) {
        float copy;
        copy=upperLeft.y;
        upperLeft.y=lowerRigth.y;
        lowerRigth.y=copy;
    }
    
    
}
-(void) updateLowerRight:(CGPoint) start:(CGPoint) end{
    lowerRigth.x=lowerRigth.x+end.x-start.x;
    lowerRigth.y=lowerRigth.y+end.y-start.y;
    if (lowerRigth.y>372-LINEWIDTH/2) {
        lowerRigth.y=372-LINEWIDTH/2;
    }
    if (lowerRigth.x>320-LINEWIDTH/2) {
        lowerRigth.x=320-LINEWIDTH/2;
    }
    if ((upperLeft.x>lowerRigth.x)) {
        float copy;
        copy=upperLeft.x;
        upperLeft.x=lowerRigth.x;
        lowerRigth.x=copy;
    }
    if ((upperLeft.y>lowerRigth.y)) {
        float copy;
        copy=upperLeft.y;
        upperLeft.y=lowerRigth.y;
        lowerRigth.y=copy;
    }
    
}


@end