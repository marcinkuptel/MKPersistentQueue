// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MKRepository.h instead.

#import <CoreData/CoreData.h>


extern const struct MKRepositoryAttributes {
	__unsafe_unretained NSString *name;
} MKRepositoryAttributes;

extern const struct MKRepositoryRelationships {
	__unsafe_unretained NSString *operations;
} MKRepositoryRelationships;

extern const struct MKRepositoryFetchedProperties {
} MKRepositoryFetchedProperties;

@class MKOperation;



@interface MKRepositoryID : NSManagedObjectID {}
@end

@interface _MKRepository : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MKRepositoryID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *operations;

- (NSMutableSet*)operationsSet;





@end

@interface _MKRepository (CoreDataGeneratedAccessors)

- (void)addOperations:(NSSet*)value_;
- (void)removeOperations:(NSSet*)value_;
- (void)addOperationsObject:(MKOperation*)value_;
- (void)removeOperationsObject:(MKOperation*)value_;

@end

@interface _MKRepository (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveOperations;
- (void)setPrimitiveOperations:(NSMutableSet*)value;


@end
