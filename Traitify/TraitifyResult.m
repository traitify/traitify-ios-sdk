//
//  TraitifyResult.m
//  Traitify
//

#import "TraitifyResult.h"
#import "TraitifyBlend.h"
#import "TraitifyType.h"
#import "TraitifyTrait.h"
#import "TraitifyCareerMatch.h"


@implementation TraitifyResult

+ (instancetype)resultFromDictionary:(NSDictionary *)jsonDict {
	if (!jsonDict) return nil;
	
	TraitifyResult *result = [[TraitifyResult alloc] init];
	result.resultID = jsonDict[@"id"];
	result.deckID = jsonDict[@"deck_id"];
	result.completedAt = jsonDict[@"completed_at"];
	result.createdAt = jsonDict[@"created_at"];
	result.personalityBlend = [TraitifyBlend blendWithDict:jsonDict[@"personality_blend"]];
	result.personalityTypes = [TraitifyType typesArrayWithArray:jsonDict[@"personality_types"]];
	result.personalityTraits = [TraitifyTrait traitsArrayWithArray:jsonDict[@"personality_traits"]];
	result.careerMatches = [TraitifyCareerMatch careerMatchesArrayWithArray:jsonDict[@"career_matches"]];
	
	return result;
}

@end
