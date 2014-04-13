//
//  MKCoreDataStoreFactory.h
//  MKPersistentQueue
//
//  Created by Marcin Kuptel on 13/04/2014.
//  Copyright (c) 2014 Marcin Kuptel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MKCoreDataStore;

@interface MKCoreDataStoreFactory : NSObject

+ (MKCoreDataStore*) coreDataStore;

@end
