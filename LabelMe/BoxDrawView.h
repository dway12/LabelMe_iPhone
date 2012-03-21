//
//  BoxDrawView.h
//  LabelMe
//
//  Created by David Way on 1/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoxDrawView : UIView
{
@private
    CGPoint one;
    CGPoint two;
    CGPoint three;
    CGPoint four;
    
    CGPoint *myPoints;
    
    
}


-(void)setPoints:(CGPoint *) array;

@end
