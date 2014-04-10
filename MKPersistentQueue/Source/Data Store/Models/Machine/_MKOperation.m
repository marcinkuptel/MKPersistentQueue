// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MKOperation.m instead.

#import "_MKOperation.h"

const struct MKOperationAttributes MKOperationAttributes = {
	.identifier = @"identifier",
	.priority = @"priority",
	.value = @"value",
};

const struct MKOperationRelationships MKOperationRelationships = {
	.repository = @"repository",
};

const struct MKOperationFetchedProperties MKOperationFetchedProperties = {
};

@implementation MKOperationID
@end

@implementation _MKOperation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MKOperation" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MKOperation";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MKOperation" inManagedObjectContext:moc_];
}

- (MKOperationID*)objectID {
	return (MKOperationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"priorityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"priority"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic identifier;






@dynamic priority;



- (int16_t)priorityValue {
	NSNumber *result = [self priority];
	return [result shortValue];
}

- (void)setPriorityValue:(int16_t)value_ {
	[self setPriority:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePriorityValue {
	NSNumber *result = [self primitivePriority];
	return [result shortValue];
}

- (void)setPrimitivePriorityValue:(int16_t)value_ {
	[self setPrimitivePriority:[NSNumber numberWithShort:value_]];
}





@dynamic value;






@dynamic repository;

	






@end
