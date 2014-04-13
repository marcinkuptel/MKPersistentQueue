//
//  MKCoreDataContextFactory.m
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 13/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import "MKCoreDataContextFactory.h"
#import <CoreData/CoreData.h>

@implementation MKCoreDataContextFactory

+ (NSManagedObjectContext*) contextWithCoordinator: (NSPersistentStoreCoordinator*) coordinator
{
    NSParameterAssert(coordinator);
    
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSPrivateQueueConcurrencyType];
    context.persistentStoreCoordinator = coordinator;
    return context;
}

@end
