//
//  MKPersistentQueue.m
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 10/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import "MKPersistentQueue.h"
#import "MKDataStore.h"

@interface MKPersistentQueue ()

@property (nonatomic, strong) id<MKDataStore> dataStore;

@end

@implementation MKPersistentQueue

+ (MKPersistentQueue*) queueWithName: (NSString*) name
{
    MKPersistentQueue *queue = [[MKPersistentQueue alloc] initWithDataStore: nil];
    return queue;
}

- (instancetype) initWithDataStore: (id<MKDataStore>) dataStore
{
    self = [super init];
    if (self) {
        _dataStore = dataStore;
    }
    return dataStore;
}

@end
