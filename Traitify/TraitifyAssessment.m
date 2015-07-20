//
//  TraitifyAssessment.m
//  Traitify
//

#import "TraitifyAssessment.h"

@implementation TraitifyAssessment

+ (instancetype)assessmentWithDictionary:(NSDictionary *)jsonDict {
	if (!jsonDict) return nil;
	
	TraitifyAssessment *assessment = [[TraitifyAssessment alloc] init];
	assessment.assessmentID = jsonDict[@"id"];
	assessment.deckID = jsonDict[@"deck_id"];
	assessment.completedAt = jsonDict[@"completed_at"];
	assessment.createdAt = jsonDict[@"created_at"];
	
	return assessment;
}

@end
