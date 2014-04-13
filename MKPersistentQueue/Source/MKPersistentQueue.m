//
//  MKPersistentQueue.m
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 10/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import "MKPersistentQueue.h"

@interface MKPersistentQueue ()

@property (nonatomic, strong) id<MKOperationStore> operationStore;

@end

@implementation MKPersistentQueue

- (instancetype) initWithOperationStore: (id<MKOperationStore>) operationStore
{
    self = [super init];
    if (self) {
        _operationStore = operationStore;
    }
    return self;
}

@end
