//
//  TraitifyType.m
//  Traitify
//

#import "TraitifyType.h"
#import "TraitifyDeckBadge.h"

@implementation TraitifyType

+ (instancetype)typeWithDict:(NSDictionary *)jsonDict {
	if (!jsonDict) return nil;
	NSDictionary *typeDict = jsonDict[@"personality_type"];
	
	TraitifyType *type = [[TraitifyType alloc] init];
	type.typeName = typeDict[@"name"];
	type.typeDescription = typeDict[@"description"];
	type.shortDesc = typeDict[@"short_desc"];
	type.keywords = typeDict[@"keywords"];
	type.environments = typeDict[@"environments"];
	type.famousPeople = typeDict[@"famous_people"];
	type.badge = [TraitifyDeckBadge deckBadgeWithDictionary:typeDict[@"badge"]];
	type.score = jsonDict[@"score"];
	return type;
}

+ (NSArray *)typesArrayWithArray:(NSArray *)jsonArray {
	NSMutableArray *array = [NSMutableArray array];
	for (NSDictionary *dict in jsonArray) {
		TraitifyType *type = [self typeWithDict:dict];
		[array addObject:type];
	}
	if (array.count) {
		return [array copy];
	} else {
		return nil;
	}
}

@end
