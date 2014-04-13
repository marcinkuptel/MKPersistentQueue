//
//  MKCoreDataStoreIntegrationTests.m
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 11/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import "MKCoreDataStore.h"
#import "MKCoreDataStoreFactory.h"
#import "MKOperation.h"
#import <Kiwi/Kiwi.h>

@interface TestOperation : NSOperation<NSCoding>

@end

@implementation TestOperation

#pragma mark - NSCoding

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end

SPEC_BEGIN(MKCoreDataStoreIntegrationTests)

describe(@"MKCoreDataStoreIntegration", ^{
   
    __block MKCoreDataStore *store;
    NSString *identifier = [[NSUUID UUID] UUIDString];
    
    beforeEach(^{
        store = [MKCoreDataStoreFactory coreDataStore];
    });
    
    context(@"when saving", ^{
        it(@"saves an operation successfully to CoreData", ^{
            
            NSString *testString = @"testString";
            NSData *testData = [testString dataUsingEncoding: NSUTF8StringEncoding];
            NSError *error = [store saveOperationWithIdentifier: identifier
                                                          value: testData];
            [[error should] beNil];
            
            NSError *fetchError = nil;
            MKOperation *operation = [store fetchOperationWithIdentifier: identifier
                                                                   error: &fetchError];
            
            [[fetchError should] beNil];
            [[operation should] beNonNil];
            [[operation.identifier should] equal: identifier];
            
            NSString *operationValue = [[NSString alloc] initWithData: operation.value
                                                             encoding: NSUTF8StringEncoding];
            [[operationValue should] equal: testString];
        });
        
        it(@"saves successfully 1000 operations", ^{
           
            for(int i = 0; i < 1000; i++){
             
                NSString *identifier = [[NSUUID UUID] UUIDString];
                NSData *data = [identifier dataUsingEncoding: NSUTF8StringEncoding];
                NSError *saveError = [store saveOperationWithIdentifier: identifier
                                                                  value: data];
                [[saveError should] beNil];
            }
        });
        
        it(@"saves multiple operations and fetches all of them correctly", ^{
           
            NSUInteger numOperations = 100;
            
            for(int i = 0; i < numOperations; i++){
                
                NSString *identifier = [[NSUUID UUID] UUIDString];
                TestOperation *operation = [[TestOperation alloc] init];
                NSData *data = [NSKeyedArchiver archivedDataWithRootObject: operation];
                NSError *saveError = [store saveOperationWithIdentifier: identifier
                                                                  value: data];
                [[saveError should] beNil];
            }
            
            NSError *fetchError = nil;
            NSArray *operations = [store fetchAllOperations: &fetchError];
            
            [[fetchError should] beNil];
            [[operations should] beNonNil];
            [[theValue([operations count]) should] equal: theValue(numOperations)];
            
        });
    });
    
    context(@"when removing", ^{
        it(@"removes an operation successfully", ^{
            NSString *testString = @"testString";
            NSData *testData = [testString dataUsingEncoding: NSUTF8StringEncoding];
            
            NSError *error = [store saveOperationWithIdentifier: identifier
                                                          value: testData];
            [[error should] beNil];
            
            NSError *removeError = [store removeOperationWithIdentifier: identifier];
            [[removeError should] beNil];
        });
        
        it(@"returns an error if operation does not exist", ^{
            NSError *removeError = [store removeOperationWithIdentifier: identifier];
            [[removeError should] beNonNil];
            [[theValue(removeError.code) should] equal: theValue(MKCoreDataStoreErrorOperationNotFound)];
        });
    });
});

SPEC_END
