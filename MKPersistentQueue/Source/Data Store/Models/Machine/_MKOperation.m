// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MKOperation.m instead.

#import "_MKOperation.h"

const struct MKOperationAttributes MKOperationAttributes = {
	.identifier = @"identifier",
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
	

	return keyPaths;
}




@dynamic identifier;






@dynamic value;






@dynamic repository;

	






@end
