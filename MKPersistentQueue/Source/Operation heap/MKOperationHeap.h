//
//  MKOperationHeap.h
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 13/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKOperationStore.h"

@interface MKOperationHeap : NSObject

- (instancetype) initWithOperationStore: (id<MKOperationStore>) operationStore;

- (NSError*) addOperation: (NSOperation<NSCoding>*) operation
             withPriority: (NSUInteger) priority
                timestamp: (Timestamp) timestamp;

@end
