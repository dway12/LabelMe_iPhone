//
//  LabelMeAppDelegate.h
//  LabelMe
//
//  Created by David Way on 9/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabelMeViewController.h"

@interface LabelMeAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
    LabelMeViewController *labelMeViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LabelMeViewController *labelMeViewController;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
