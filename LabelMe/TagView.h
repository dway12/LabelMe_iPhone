//
//  TagView.h
//  LabelMe_work
//
//  Created by David Way on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Box.h"

@interface TagView : UIView{
    NSMutableDictionary *dictionaryBox;
    
    CGPoint firstLocation;
    int selectedBox;
    BOOL move;
    BOOL size;
}

@property (nonatomic, retain) NSMutableDictionary *dictionaryBox;

-(void) setSelectedBox:(int) i;
-(int) SelectedBox;
-(void) drawBox:(CGContextRef ) context:(Box *) box;
-(void) drawSelectedBox:(CGContextRef ) context:(Box *) box;


@end