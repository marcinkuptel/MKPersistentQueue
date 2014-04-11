//
//  MKCoreDataStore.m
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 10/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import "MKCoreDataStore.h"
#import "MKRepository.h"
#import "MKOperation.h"

@interface MKCoreDataStore ()

@property (nonatomic, copy) NSString *repositoryName;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) MKRepository *repository;

@end

@implementation MKCoreDataStore

- (instancetype) initWithRepositoryName: (NSString*) repoName
                                context: (NSManagedObjectContext*) context
{
    self = [super init];
    if (self) {
        _repositoryName = [repoName copy];
        _context = context;
        _repository = [self _loadRepositoryWithName: repoName];
    }
    return self;
}

- (NSError*) saveOperationWithIdentifier: (NSString *)identifier
                                priority: (NSUInteger)priority
                                   value: (NSData *)value
{
    __block NSError *error = nil;
    [self.context performBlockAndWait:^{
        MKOperation *operation = [self _operationWithIdentifier: identifier];
        if (!operation) {
            operation = [NSEntityDescription insertNewObjectForEntityForName: @"MKOperation"
                                                      inManagedObjectContext: self.context];
        }
        
        operation.identifier = identifier;
        operation.priority = @(priority);
        operation.value = value;
        
        NSError *saveError = nil;
        [self.context save: &saveError];
        error = saveError;
    }];
    return error;
}

#pragma mark - Private

- (MKOperation*) _operationWithIdentifier: (NSString*) identifier
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"identifier = %@", identifier];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName: @"MKOperation"];
    request.fetchLimit = 1;
    request.predicate = predicate;
    
    NSError *fetchError = nil;
    NSArray *operations = [self.context executeFetchRequest: request
                                                      error: &fetchError];
    
    if (fetchError) {
        NSAssert1(NO, @"Could not fetch operation. Error: %@", fetchError);
    }
    
    NSAssert([operations count] <= 1, @"Wrong number of operations: %d", [operations count]);
    
    return [operations lastObject];
}

- (MKRepository*) _loadRepositoryWithName: (NSString*) repoName
{
    __block MKRepository *repository = nil;
    [self.context performBlockAndWait:^{
        
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName: @"MKRepository"];
        
        NSError *error = nil;
        NSArray *repositories = [self.context executeFetchRequest: request
                                                            error: &error];
        if (error) {
            NSAssert1(NO, @"Could not fetch repository. Error: %@", error);
        }
        
        NSAssert([repositories count] < 2, @"Invalid number of repositories!");
        
        if ([repositories count] == 1) {
            repository = [repositories lastObject];
        }else{
            repository = [NSEntityDescription insertNewObjectForEntityForName: @"MKRepository"
                                                       inManagedObjectContext: self.context];
            repository.name = repoName;
            
            NSError *saveError = nil;
            [self.context save: &saveError];
            if (saveError) {
                NSAssert(NO, @"Could not save context. Error: %@", saveError);
            }
        }
    }];
    return repository;
}

@end
