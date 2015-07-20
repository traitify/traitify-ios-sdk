//
//  TraitifyTrait.m
//  Traitify
//

#import "TraitifyTrait.h"

@implementation TraitifyTrait

+ (instancetype)traitWithDict:(NSDictionary *)jsonDict {
	if (!jsonDict) return nil;
	
	TraitifyTrait *trait = [[TraitifyTrait alloc] init];
	trait.traitName = jsonDict[@"name"];
	trait.traitDefinition = jsonDict[@"definition"];
	trait.score = jsonDict[@"score"];
	return trait;
}

+ (NSArray *)traitsArrayWithArray:(NSArray *)jsonArray {
	NSMutableArray *array = [NSMutableArray array];
	for (NSDictionary *dict in jsonArray) {
		TraitifyTrait *trait = [self traitWithDict:dict];
		[array addObject:trait];
	}
	if (array.count) {
		return [array copy];
	} else {
		return nil;
	}
}

@end
