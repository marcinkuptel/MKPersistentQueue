//
//  MKCoreDataStoreTests.m
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 11/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import "MKCoreDataStore.h"
#import "MKOperation.h"
#import <Kiwi/Kiwi.h>

SPEC_BEGIN(MKCoreDataStoreTests)

describe(@"MKCoreDataStore", ^{
   
    __block MKCoreDataStore *store;
    __block id contextMock;
    NSString *repoName = @"repoName";
    
    beforeEach(^{
        contextMock = [NSManagedObjectContext nullMock];
    });
    
    context(@"when initialising", ^{
        it(@"loads a repo if one exists", ^{
            
            [[contextMock should] receive: @selector(performBlockAndWait:)];
            [[contextMock should] receive: @selector(executeFetchRequest:error:) andReturn: @[@(1)]];
            [[contextMock shouldNot] receive: @selector(save:)];
            KWCaptureSpy *performBlockSpy = [contextMock captureArgument: @selector(performBlockAndWait:)
                                                                 atIndex: 0];
            
            store = [[MKCoreDataStore alloc] initWithRepositoryName: repoName
                                                            context: contextMock];
            
            void(^block)(void) = performBlockSpy.argument;
            block();
            
        });
        
        it(@"creates a repo if it does not exist", ^{
            [NSEntityDescription stub: @selector(insertNewObjectForEntityForName:inManagedObjectContext:)
                            andReturn: nil];
            [[contextMock should] receive: @selector(performBlockAndWait:)];
            [[contextMock should] receive: @selector(executeFetchRequest:error:) andReturn: @[]];
            [[contextMock should] receive: @selector(save:)];
            KWCaptureSpy *performBlockSpy = [contextMock captureArgument: @selector(performBlockAndWait:)
                                                                 atIndex: 0];
            
            store = [[MKCoreDataStore alloc] initWithRepositoryName: repoName
                                                            context: contextMock];
            
            void(^block)(void) = performBlockSpy.argument;
            block();
        });
    });
    
    context(@"when saving", ^{
       
        __block NSString *identifier;
        __block NSUInteger priority;
        __block NSData *value;
        
        beforeEach(^{
            value = [NSData data];
            identifier = [[NSUUID UUID] UUIDString];
            priority = 5;
            store = [[MKCoreDataStore alloc] initWithRepositoryName: repoName
                                                            context: contextMock];
        });
        
        it(@"saves via context and returns error if one occurred", ^{
            
            [NSEntityDescription stub: @selector(insertNewObjectForEntityForName:inManagedObjectContext:)
                            andReturn: nil];
            
            [contextMock stub: @selector(save:) withBlock:^id(NSArray *params) {
                NSValue * errVal = params[0];
                NSError * __autoreleasing * errPtr = (NSError * __autoreleasing *)[errVal pointerValue];
                NSLog(@"Pointer2: %p", errPtr);
                if(errPtr){
                    *errPtr = [NSError errorWithDomain: @"MKCoreDataStoreTests"
                                                  code: 1
                                              userInfo: nil];
                }
                return nil;
            }];
            
            [contextMock stub: @selector(performBlockAndWait:)
                    withBlock:^id(NSArray *params) {
                        void(^block)() = params[0];
                        block();
                        return nil;
                    }];
            
            [[contextMock should] receive: @selector(performBlockAndWait:)];
            
            NSError *error = [store saveOperationWithIdentifier: identifier
                                                       priority: priority
                                                          value: value];

            [[error should] beNonNil];
        });
        
        it(@"saves via context and returns no error if none occurred", ^{
            
            [NSEntityDescription stub: @selector(insertNewObjectForEntityForName:inManagedObjectContext:)
                            andReturn: nil];
            
            [contextMock stub: @selector(performBlockAndWait:)
                    withBlock:^id(NSArray *params) {
                        void(^block)() = params[0];
                        block();
                        return nil;
                    }];
            
            [[contextMock should] receive: @selector(performBlockAndWait:)];
            
            NSError *error = [store saveOperationWithIdentifier: identifier
                                                       priority: priority
                                                          value: value];
            
            [[error should] beNil];
        });
    });
    
    context(@"when fetching", ^{
        
        __block NSString *identifier;
        
        beforeEach(^{
            identifier = [[NSUUID UUID] UUIDString];
            store = [[MKCoreDataStore alloc] initWithRepositoryName: repoName
                                                            context: contextMock];
            [contextMock stub: @selector(performBlockAndWait:)
                    withBlock:^id(NSArray *params) {
                        void(^block)() = params[0];
                        block();
                        return nil;
                    }];
        });
        
        it(@"returns an object if it exists", ^{
            
            [[contextMock should] receive: @selector(performBlockAndWait:)];
            
            [contextMock stub: @selector(executeFetchRequest:error:)
                    withBlock:^id(NSArray *params) {
                        return @[[MKOperation mock]];
                    }];
            
            NSError *error = nil;
            MKOperation *operation = [store fetchOperationWithIdentifier: identifier
                                                                   error: &error];
            
            [[operation should] beNonNil];
            [[error should] beNil];
        });
        
        it(@"return an error if the object does not exist", ^{
            [[contextMock should] receive: @selector(performBlockAndWait:)];
            
            [contextMock stub: @selector(executeFetchRequest:error:)
                    withBlock:^id(NSArray *params) {
                        NSValue * errVal = params[1];
                        NSError * __autoreleasing * errPtr = (NSError * __autoreleasing *)[errVal pointerValue];
                        NSLog(@"Pointer2: %p", errPtr);
                        if(errPtr){
                            *errPtr = [NSError errorWithDomain: @"MKCoreDataStoreTests"
                                                          code: 1
                                                      userInfo: nil];
                        }
                        return nil;
                    }];
            
            NSError *error = nil;
            MKOperation *operation = [store fetchOperationWithIdentifier: identifier
                                                                   error: &error];
            
            [[operation should] beNil];
            [[error should] beNonNil];
        });
    });
    
    context(@"when removing an operation", ^{
        
    });
});

SPEC_END
