// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MKRepository.m instead.

#import "_MKRepository.h"

const struct MKRepositoryAttributes MKRepositoryAttributes = {
	.name = @"name",
};

const struct MKRepositoryRelationships MKRepositoryRelationships = {
	.operations = @"operations",
};

const struct MKRepositoryFetchedProperties MKRepositoryFetchedProperties = {
};

@implementation MKRepositoryID
@end

@implementation _MKRepository

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MKRepository" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MKRepository";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MKRepository" inManagedObjectContext:moc_];
}

- (MKRepositoryID*)objectID {
	return (MKRepositoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic operations;

	
- (NSMutableSet*)operationsSet {
	[self willAccessValueForKey:@"operations"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"operations"];
  
	[self didAccessValueForKey:@"operations"];
	return result;
}
	






@end
