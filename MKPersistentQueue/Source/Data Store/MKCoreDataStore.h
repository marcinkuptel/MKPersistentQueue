//
//  MKCoreDataStore.h
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 10/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "MKDataStore.h"

/**
 */
@interface MKCoreDataStore : NSObject<MKDataStore>

- (instancetype) initWithRepositoryName: (NSString*) repoName
                                context: (NSManagedObjectContext*) context;

- (NSError*) saveOperationWithIdentifier: (NSString*) identifier
                                priority: (NSUInteger) priority
                                   value: (NSData*) value;

@end
