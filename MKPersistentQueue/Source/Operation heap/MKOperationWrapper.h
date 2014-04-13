//
//  MKOperationWrapper.h
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 13/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKOperationWrapper : NSObject<NSCoding>

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, assign) Timestamp timestamp;
@property (nonatomic, assign) NSInteger priority;

- (instancetype) initWithOperation: (NSOperation<NSCoding>*) operation;

@end

