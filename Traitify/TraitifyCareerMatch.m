//
//  TraitifyCareerMatch.m
//  Traitify
//

#import "TraitifyCareerMatch.h"

@implementation TraitifyCareerMatch

+ (instancetype)careerMatchWithDictionary:(NSDictionary *)jsonDict {
	if (!jsonDict) return nil;
	
	TraitifyCareerMatch *careerMatch = [[TraitifyCareerMatch alloc] init];
	careerMatch.career = jsonDict[@"career"];
	careerMatch.score = jsonDict[@"score"];
	
	return careerMatch;
}

+ (NSArray *)careerMatchesArrayWithArray:(NSArray *)jsonArray {
	NSMutableArray *array = [NSMutableArray array];
	for (NSDictionary *dict in jsonArray) {
		TraitifyCareerMatch *cm = [self careerMatchWithDictionary:dict];
		[array addObject:cm];
	}
	if (array.count) {
		return [array copy];
	} else {
		return nil;
	}
}

@end
