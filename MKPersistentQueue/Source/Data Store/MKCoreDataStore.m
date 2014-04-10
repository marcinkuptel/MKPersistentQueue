//
//  MKCoreDataStore.m
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 10/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import "MKCoreDataStore.h"

@interface MKCoreDataStore ()

@property (nonatomic, copy) NSString *repositoryName;

@end

@implementation MKCoreDataStore

- (instancetype) initWithRepositoryName: (NSString*) repoName
{
    self = [super init];
    if (self) {
        _repositoryName = [repoName copy];
    }
    return self;
}

@end
