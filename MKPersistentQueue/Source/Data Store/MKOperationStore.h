//
//  MKDataStore.h
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 11/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MKOperation;

@protocol MKOperationStore <NSObject>

- (NSError*) saveOperationWithIdentifier: (NSString*) identifier
                                priority: (NSUInteger) priority
                                   value: (NSData*) value;

- (MKOperation*) fetchOperationWithIdentifier: (NSString*) identifier
                                        error: (NSError**) error;

- (NSError*) removeOperationWithIdentifier: (NSString*) identifier;

- (NSArray*) fetchAllOperations: (NSError**) error;

@end
