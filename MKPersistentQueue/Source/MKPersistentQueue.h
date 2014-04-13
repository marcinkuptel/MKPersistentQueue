//
//  MKPersistentQueue.h
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 10/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKOperationStore.h"

/**
 */
@interface MKPersistentQueue : NSObject

- (instancetype) initWithOperationStore: (id<MKOperationStore>) operationStore;



@end
