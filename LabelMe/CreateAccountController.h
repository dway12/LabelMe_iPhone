//
//  CreateAccountController.h
//  LabelMe
//
//  Created by David Way on 2/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CreateAccountControllerDelegate;

@interface CreateAccountController : UIViewController 

{
    id <CreateAccountControllerDelegate> delegate;
    
    IBOutlet UIButton *backButton;
    
}


@property (nonatomic, assign) id <CreateAccountControllerDelegate> delegate;
@property (nonatomic, assign) IBOutlet UIButton *backButton;


-(IBAction)didHitBackButton:(id)sender;
@end

@protocol CreateAccountControllerDelegate
-(void)didHitBackFromCreatingAccount;

@end