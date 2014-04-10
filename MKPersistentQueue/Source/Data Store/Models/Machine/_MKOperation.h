// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MKOperation.h instead.

#import <CoreData/CoreData.h>


extern const struct MKOperationAttributes {
	 NSString *identifier;
	 NSString *priority;
	 NSString *value;
} MKOperationAttributes;

extern const struct MKOperationRelationships {
	 NSString *repository;
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





@property (nonatomic, retain) NSString* identifier;



//- (BOOL)validateIdentifier:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSNumber* priority;



@property int16_t priorityValue;
- (int16_t)priorityValue;
- (void)setPriorityValue:(int16_t)value_;

//- (BOOL)validatePriority:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSData* value;



//- (BOOL)validateValue:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) MKRepository *repository;

//- (BOOL)validateRepository:(id*)value_ error:(NSError**)error_;





@end

@interface _MKOperation (CoreDataGeneratedAccessors)

@end

@interface _MKOperation (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveIdentifier;
- (void)setPrimitiveIdentifier:(NSString*)value;




- (NSNumber*)primitivePriority;
- (void)setPrimitivePriority:(NSNumber*)value;

- (int16_t)primitivePriorityValue;
- (void)setPrimitivePriorityValue:(int16_t)value_;




- (NSData*)primitiveValue;
- (void)setPrimitiveValue:(NSData*)value;





- (MKRepository*)primitiveRepository;
- (void)setPrimitiveRepository:(MKRepository*)value;


@end
