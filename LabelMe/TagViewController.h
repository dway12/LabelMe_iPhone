//
//  TagViewController.h
//  LabelMe_work
//
//  Created by David Way on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TagView.h"
#import "Box.h"

@interface AnnotationToolViewController : UIViewController{
    
    IBOutlet TagView *annotationView;
    NSMutableDictionary *dictionaryBox;
    IBOutlet UITextField *label;
    
    IBOutlet UIBarButtonItem *addButton;
    IBOutlet UIBarButtonItem *deleteButton;
    
    NSArray *colorArray;
    
    BOOL move;
    BOOL size;
    BOOL keyboardVisible;
    
    CGPoint firstLocation;
    int selectedBox;
    int corner;
    int numLabels;
}
@property (retain, nonatomic) IBOutlet TagView *annotationView;
@property (retain, nonatomic) NSArray *colorArray;

@property (retain, nonatomic) NSMutableDictionary *dictionaryBox;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *deleteButton;

@property (retain, nonatomic) IBOutlet UITextField *label;


-(IBAction)addAction:(id)sender;
-(IBAction)labelFinish:(id)sender;
-(IBAction)labelAction:(id)sender;
-(IBAction)deleteAction:(id)sender;



@end
