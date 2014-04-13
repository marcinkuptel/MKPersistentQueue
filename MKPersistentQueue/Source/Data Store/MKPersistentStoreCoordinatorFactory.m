//
//  MKPersistentStoreCoordinatorFactory.m
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 13/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import "MKPersistentStoreCoordinatorFactory.h"

@implementation MKPersistentStoreCoordinatorFactory

+ (NSPersistentStoreCoordinator*) persistentStoreCoordinatorWithModelName: (NSString*) modelName
                                                                 storeURL: (NSURL*) storeURL
{
#if !defined(TESTING)
    NSManagedObjectModel *model = [self managedObjectModelWithBundle: [self bundle]
                                                           modelName: modelName];
#else
    NSManagedObjectModel *model =
    [self managedObjectModelWithBundle: [NSBundle bundleForClass: NSClassFromString(@"MKCoreDataStoreTests")]
                             modelName: modelName];
#endif
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinatorWithStoreURL: storeURL model: model];
    return coordinator;
}

/**
 Method returning the aproppriate store type.
 Using an "in-memory" store type makes it much easier to perform unit testing.
 
 @return Store type to be used by DataStore
 */
+ (NSString*) storeType
{
    NSString *storeType = nil;
    
#if defined(TESTING)
    storeType = NSInMemoryStoreType;
#else
    storeType = NSSQLiteStoreType;
#endif
    
    return storeType;
}


/**
 Method returning the aproppriate bundle.
 Returning the main bundle while running tests would cause
 an error.
 
 @return Bundle for the current target.
 */
+ (NSBundle*) bundle
{
    NSBundle *bundle = nil;
    
#if defined(TESTING)
    bundle = [NSBundle bundleForClass: NSClassFromString(@"MKCoreDataStoreTests")];
#else
    bundle = [NSBundle mainBundle];
#endif
    
    return bundle;
}


#pragma mark - Core Data stack


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
+ (NSManagedObjectModel *)managedObjectModelWithBundle: (NSBundle*) bundle
                                             modelName: (NSString*) modelName
{
    NSURL *modelURL = [bundle URLForResource: modelName
                               withExtension: @"momd"];
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
+ (NSPersistentStoreCoordinator *)persistentStoreCoordinatorWithStoreURL: (NSURL*) storeURL
                                                                   model: (NSManagedObjectModel*) model
{
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: model];
    
    NSError *error = nil;
    NSString *storeType = [self storeType];
    if (![coordinator addPersistentStoreWithType: storeType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return coordinator;
}


@end
