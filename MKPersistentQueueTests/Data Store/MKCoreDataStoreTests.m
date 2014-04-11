//
//  MKCoreDataStoreTests.m
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 11/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import "MKCoreDataStore.h"
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
       
        beforeEach(^{
            store = [[MKCoreDataStore alloc] initWithRepositoryName: repoName
                                                            context: contextMock];
        });
        
        it(@"saves via context and returns error if one occurred", ^{
            
            [NSEntityDescription stub: @selector(insertNewObjectForEntityForName:inManagedObjectContext:)
                            andReturn: nil];
            
            NSString *identifier = [[NSUUID UUID] UUIDString];
            NSUInteger priority = 5;
            NSData *value = [NSData data];
            
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
            
            
            KWCaptureSpy *performBlockSpy = [contextMock captureArgument: @selector(performBlockAndWait:)
                                                                 atIndex: 0];
            
            NSError *error = [store saveOperationWithIdentifier: identifier
                                                       priority: priority
                                                          value: value];
            
            void(^block)() = performBlockSpy.argument;
            block();

            [[error should] beNonNil];
        });
        
        it(@"saves via context and returns no error if none occurred", ^{
            
        });
        
    });
    
});

SPEC_END
