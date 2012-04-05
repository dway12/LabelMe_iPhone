//
//  TagView.m
//  LabelMe_work
//
//  Created by David Way on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//
//  AnnotationView.m
//  AnnotationTool
//
//  Created by Dolores Blanco Almazán on 27/03/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TagView.h"
#import "Constants.h"

@implementation TagView

@synthesize  dictionaryBox;


- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];//colorWithRed:1 green:1 blue:1 alpha:0.6]];
        selectedBox=0;
        move=NO;
        size=NO;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //CGContextSetRGBStrokeColor(context, 255, 0, 0, 1);
    CGContextSetLineWidth(context, LINEWIDTH);
    //NSLog(@"El rectangulo seleccionado es: %d",selectedBox);
    //NSLog(@"La cuenta es: %d",[dictionaryBox count]);
    
    for (int i= 0; i<[dictionaryBox count]; i++) {
        if (i==selectedBox) {
            continue;
        }
        [self drawBox:context:[dictionaryBox objectForKey:[NSString stringWithFormat:@"%d",i]]];
    }
    if (selectedBox!=-1) {
        [self drawSelectedBox:context:[dictionaryBox objectForKey:[NSString stringWithFormat:@"%d",selectedBox]]];
    }
    
    UIGraphicsEndImageContext();
    
    
}



-(void) drawSelectedBox:(CGContextRef ) context:(Box *) box1{
    
    CGPoint upperRight = CGPointMake([box1 lowerRight].x, [box1 upperLeft].y);
    CGPoint lowerLeft = CGPointMake([box1 upperLeft].x, [box1 lowerRight].y);
    CGRect rect = CGRectMake([box1 upperLeft].x, [box1 upperLeft].y, [box1 lowerRight].x-[box1 upperLeft].x, [box1 lowerRight].y-[box1 upperLeft].y);
    
    //[[UIColor clearColor] setFill];
    //UIRectFill( rect );
    CGContextSetStrokeColorWithColor(context, box1.color.CGColor);
    //CGContextBeginPath(context);
    CGContextStrokeRect(context, rect );
    
    CGContextStrokeEllipseInRect(context, CGRectMake([box1 upperLeft].x-LINEWIDTH, [box1 upperLeft].y-LINEWIDTH, 2*LINEWIDTH, 2*LINEWIDTH));
    CGContextStrokeEllipseInRect(context, CGRectMake([box1 lowerRight].x-LINEWIDTH, [box1 lowerRight].y-LINEWIDTH, 2*LINEWIDTH, 2*LINEWIDTH));
    CGContextStrokeEllipseInRect(context, CGRectMake(upperRight.x-LINEWIDTH, upperRight.y-LINEWIDTH, 2*LINEWIDTH, 2*LINEWIDTH));
    CGContextStrokeEllipseInRect(context, CGRectMake(lowerLeft.x-LINEWIDTH, lowerLeft.y-LINEWIDTH, 2*LINEWIDTH, 2*LINEWIDTH));
    
    CGContextSetRGBStrokeColor(context, 255, 255, 255, 1);
    CGContextSetLineWidth(context, 1);
    CGContextStrokeEllipseInRect(context, CGRectMake([box1 upperLeft].x-1.5*LINEWIDTH, [box1 upperLeft].y-1.5*LINEWIDTH, 3*LINEWIDTH, 3*LINEWIDTH));
    CGContextStrokeEllipseInRect(context, CGRectMake([box1 lowerRight].x-1.5*LINEWIDTH, [box1 lowerRight].y-1.5*LINEWIDTH, 3*LINEWIDTH, 3*LINEWIDTH));
    CGContextStrokeEllipseInRect(context, CGRectMake(upperRight.x-1.5*LINEWIDTH, upperRight.y-1.5*LINEWIDTH, 3*LINEWIDTH, 3*LINEWIDTH));
    CGContextStrokeEllipseInRect(context, CGRectMake(lowerLeft.x-1.5*LINEWIDTH, lowerLeft.y-1.5*LINEWIDTH, 3*LINEWIDTH, 3*LINEWIDTH));
    
    
    
    
    
    
    
    
}

-(void) drawBox:(CGContextRef ) context:(Box *) box1{
    
    //CGPoint upperRight = CGPointMake(, [box1 upperLeft].y);
    //CGPoint lowerLeft = CGPointMake([box1 upperLeft].x, [box1 lowerRight].y);
    
    
    CGContextSetStrokeColorWithColor(context, box1.color.CGColor);
    
    CGContextBeginPath(context);
    CGContextAddRect(context, CGRectMake([box1 upperLeft].x, [box1 upperLeft].y, [box1 lowerRight].x-[box1 upperLeft].x, [box1 lowerRight].y-[box1 upperLeft].y) );
    /*CGContextMoveToPoint(context, [box1 upperLeft].x, [box1 upperLeft].y);
     CGContextAddLineToPoint(context, upperRight.x, upperRight.y);
     CGContextAddLineToPoint(context, [box1 lowerRight].x, [box1 lowerRight].y);
     CGContextAddLineToPoint(context, lowerLeft.x, lowerLeft.y);
     CGContextAddLineToPoint(context, [box1 upperLeft].x, [box1 upperLeft].y);*/
    CGContextClosePath(context);
    CGContextStrokePath(context);
    
    
    
}
-(void) setSelectedBox:(int) i{
    selectedBox = i;
}

/*-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
 UITouch *touch = [[event allTouches] anyObject];
 CGPoint location = [touch locationInView:touch.view];
 Box *currentBox = [dictionaryBox objectForKey:[NSString stringWithFormat:@"%d",selectedBox]];
 if (!(CGRectContainsPoint(CGRectMake([currentBox upperLeft].x-7.5, [currentBox upperLeft].y-7.5, [currentBox lowerRight].x-[currentBox upperLeft].x+15, [currentBox lowerRight].y-[currentBox upperLeft].y+15) , location))) {
 NSLog(@"No he tocado el rectangulo selecionado!");
 NSLog(@"La cuenta es: %d",[dictionaryBox count]);
 int num = [dictionaryBox count];
 for (int i= 0; (i<num); i++){
 if (i!=selectedBox) {
 currentBox = [dictionaryBox objectForKey:[NSString stringWithFormat:@"%d",i]];
 if (CGRectContainsPoint(CGRectMake([currentBox upperLeft].x-7.5, [currentBox upperLeft].y-7.5, [currentBox lowerRight].x-[currentBox upperLeft].x+15, [currentBox lowerRight].y-[currentBox upperLeft].y+15) , location)) {
 selectedBox = i;    
 NSLog(@"He tocado el rectangulo %d!",i);
 break;
 }
 
 }        
 if (i==num-1) {
 NSLog(@"No he tocado ninguno");
 selectedBox=-1;
 return;
 }
 
 }
 }
 if (CGRectContainsPoint(CGRectInset(CGRectMake([currentBox upperLeft].x, [currentBox upperLeft].y, [currentBox lowerRight].x-[currentBox upperLeft].x, [currentBox lowerRight].y-[currentBox upperLeft].y),7.5,7.5) , location)) {
 NSLog(@"He tocado dentro del rectangulo selecionado!");
 move=YES;
 firstLocation = location;
 
 }
 else
 {
 size=YES;
 firstLocation = location;
 NSLog(@"He tocado los bordes!");
 }
 
 
 
 
 
 
 }
 -(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
 UITouch *touch = [[event allTouches] anyObject];
 CGPoint location = [touch locationInView:touch.view];
 Box *currentBox = [dictionaryBox objectForKey:[NSString stringWithFormat:@"%d",selectedBox]];
 if (move) {
 [currentBox updatePoints:firstLocation :location];
 [dictionaryBox setObject:currentBox forKey:[NSString stringWithFormat:@"%d",selectedBox]];
 
 }
 
 else if (size){
 if ((CGRectContainsPoint(CGRectMake([currentBox upperLeft].x-7.5, [currentBox upperLeft].y-7.5,[currentBox lowerRight].x-[currentBox upperLeft].x+15,15 ),firstLocation))| (CGRectContainsPoint(CGRectMake([currentBox upperLeft].x-7.5, [currentBox upperLeft].y-7.5,15,[currentBox lowerRight].y-[currentBox upperLeft].y+15) ,firstLocation))) {
 [currentBox updateUpperLeft:firstLocation :location];
 //NSLog(@"He tocado arriba o izquierda");
 }
 else{
 [currentBox updateLowerRight:firstLocation :location];
 //NSLog(@"He tocado abajo o derecha");
 
 }
 
 }
 
 firstLocation=location;
 [self setNeedsDisplay];
 }
 -(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
 move=NO;
 size=NO;
 [self setNeedsDisplay];
 }  */
-(int) SelectedBox{
    return selectedBox;
}


-(void) dealloc{
    [dictionaryBox release];
    [super dealloc];
    
}

@end
