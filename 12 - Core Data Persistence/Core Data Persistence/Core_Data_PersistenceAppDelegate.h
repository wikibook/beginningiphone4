//
//  Core_Data_PersistenceAppDelegate.m
//  Core Data Persistence
//
//  Created by Elisha on 11. 5. 12..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class PersistenceViewController;

@interface Core_Data_PersistenceAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    
@private
    NSManagedObjectContext *managedObjectContext_;
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
	
	PersistenceViewController *rootController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory;
- (void)saveContext;

@property (nonatomic, retain) IBOutlet PersistenceViewController
*rootController;

@end

