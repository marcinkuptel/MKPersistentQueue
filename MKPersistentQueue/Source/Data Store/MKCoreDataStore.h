//
//  MKCoreDataStore.h
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 10/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "MKOperationStore.h"

@class MKOperation;

typedef NS_ENUM(NSUInteger, MKCoreDataStoreError)
{
    MKCoreDataStoreErrorOperationNotFound = 2986
};

/**
 */
@interface MKCoreDataStore : NSObject<MKOperationStore>

- (instancetype) initWithRepositoryName: (NSString*) repoName
                                context: (NSManagedObjectContext*) context;

@end
