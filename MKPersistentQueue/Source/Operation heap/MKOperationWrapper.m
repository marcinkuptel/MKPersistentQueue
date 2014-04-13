//
//  MKOperationWrapper.m
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 13/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import "MKOperationWrapper.h"

@interface MKOperationWrapper ()

@property (nonatomic, strong) NSOperation<NSCoding> *operation;

@end

@implementation MKOperationWrapper

- (instancetype) initWithOperation:(NSOperation<NSCoding> *)operation
{
    self = [super init];
    if (self) {
        _operation = operation;
    }
    return self;
}

#pragma mark - Comparable

- (NSComparisonResult) compare:(id)object
{
    MKOperationWrapper *other = (MKOperationWrapper*)object;
    if (self.priority == other.priority) {
        if (self.timestamp < other.timestamp) {
            return NSOrderedAscending;
        }else if(self.timestamp > other.timestamp){
            return NSOrderedDescending;
        }else{
            return NSOrderedSame;
        }
    }
    else if(self.priority < other.priority) return NSOrderedAscending;
    else return NSOrderedDescending;
}

#pragma mark - NSCoding

NSString * const kIdentifierKey         = @"identifier";
NSString * const kEncapsulatedObjectKey = @"encapsulatedObject";
NSString * const kTimestampKey          = @"timestamp";
NSString * const kPriorityKey           = @"priority";

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject: self.identifier       forKey: kIdentifierKey];
    [aCoder encodeObject: self.operation        forKey: kEncapsulatedObjectKey];
    [aCoder encodeObject:@(self.timestamp)      forKey: kTimestampKey];
    [aCoder encodeInt: self.priority            forKey: kPriorityKey];
}


- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
        _identifier = [aDecoder decodeObjectForKey: kIdentifierKey];
        _operation = [aDecoder decodeObjectForKey: kEncapsulatedObjectKey];
        _timestamp = [[aDecoder decodeObjectForKey: kTimestampKey] unsignedLongLongValue];
        _priority = [aDecoder decodeIntForKey: kPriorityKey];
    }
    return self;
}

@end
