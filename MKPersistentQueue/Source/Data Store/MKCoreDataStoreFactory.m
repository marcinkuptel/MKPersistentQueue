//
//  MKCoreDataStoreFactory.m
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 13/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import "MKCoreDataStoreFactory.h"
#import "MKCoreDataStore.h"
#import "MKCoreDataContextFactory.h"
#import "MKPersistentStoreCoordinatorFactory.h"

NSString * const kRepositoryName = @"defaultRepository";
NSString * const kModelName = @"MKDataStoreModel";

@implementation MKCoreDataStoreFactory

+ (MKCoreDataStore*) coreDataStore
{
    NSPersistentStoreCoordinator *coordinator =
    [MKPersistentStoreCoordinatorFactory persistentStoreCoordinatorWithModelName: kModelName
                                                                        storeURL: [self _storeURL]];
    NSManagedObjectContext *context = [MKCoreDataContextFactory contextWithCoordinator: coordinator];
    
    MKCoreDataStore *coreDataStore = [[MKCoreDataStore alloc] initWithRepositoryName: kRepositoryName
                                                                             context: context];
    return coreDataStore;
}

+ (NSURL*) _storeURL
{
    return [[self applicationDocumentsDirectory] URLByAppendingPathComponent: kModelName];
}

/**
 Returns the URL to the application's Documents directory.
 */
+ (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
