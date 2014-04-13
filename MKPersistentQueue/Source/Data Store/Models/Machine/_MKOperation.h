// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MKOperation.h instead.

#import <CoreData/CoreData.h>


extern const struct MKOperationAttributes {
	__unsafe_unretained NSString *identifier;
	__unsafe_unretained NSString *value;
} MKOperationAttributes;

extern const struct MKOperationRelationships {
	__unsafe_unretained NSString *repository;
} MKOperationRelationships;

extern const struct MKOperationFetchedProperties {
} MKOperationFetchedProperties;

@class MKRepository;




@interface MKOperationID : NSManagedObjectID {}
@end

@interface _MKOperation : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MKOperationID*)objectID;





@property (nonatomic, strong) NSString* identifier;



//- (BOOL)validateIdentifier:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* value;



//- (BOOL)validateValue:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) MKRepository *repository;

//- (BOOL)validateRepository:(id*)value_ error:(NSError**)error_;





@end

@interface _MKOperation (CoreDataGeneratedAccessors)

@end

@interface _MKOperation (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveIdentifier;
- (void)setPrimitiveIdentifier:(NSString*)value;




- (NSData*)primitiveValue;
- (void)setPrimitiveValue:(NSData*)value;





- (MKRepository*)primitiveRepository;
- (void)setPrimitiveRepository:(MKRepository*)value;


@end
