//
//  MKOperationHeap.m
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 13/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import "MKOperationHeap.h"

/**
 Binary heap callbacks required to create an instace
 of CFBinaryHeap.
 */

const void *PQRetain(CFAllocatorRef allocator, const void *ptr){
    return CFRetain(ptr);
}

void PQRelease(CFAllocatorRef allocator, const void *ptr){
    CFRelease(ptr);
}

CFComparisonResult PQCompare(const void *ptr1, const void *ptr2, void *unused){
    return (CFComparisonResult)[(__bridge id)ptr1 compare: (__bridge id)ptr2];
}

@interface MKOperationHeap ()

/**
 Repository object used to persit objects added
 to the queue.
 */
@property (nonatomic, strong) id<MKOperationStore> operationStore;

@end

@implementation MKOperationHeap{
    /** Binary heap used to implement a priority queue */
    CFBinaryHeapRef _binaryHeapRef;
}

- (instancetype) initWithOperationStore: (id<MKOperationStore>) operationStore
{
    self = [super init];
    if (self) {
        CFBinaryHeapCallBacks callBacks = {0, PQRetain, PQRelease, NULL, PQCompare};
        _binaryHeapRef = CFBinaryHeapCreate(NULL, 0, &callBacks, NULL);
        _operationStore = operationStore;
        //[self loadObjectsFromRepository: _repository];
    }
    return self;
}

- (void) dealloc
{
    CFRelease(_binaryHeapRef);
}

- (void) _loadOperationsFromStore: (id<MKOperationStore>) operationStore
{
    NSError *fetchError = nil;
    NSArray *operations = [self.operationStore fetchAllOperations: &fetchError];
}

@end
