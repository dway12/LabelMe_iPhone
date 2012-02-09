//
//  CreateAccountController.m
//  LabelMe
//
//  Created by David Way on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreateAccountController.h"

@implementation CreateAccountController

@synthesize delegate, backButton;


-(void)viewDidLoad
{
    
    
}

-(IBAction)didHitBackButton:(id)sender
{
    
    [self.delegate didHitBackFromCreatingAccount];
}

@end
