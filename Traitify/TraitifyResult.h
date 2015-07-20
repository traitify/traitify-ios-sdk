//
//  TraitifyResult.h
//  Traitify
//

#import <Foundation/Foundation.h>

@class TraitifyBlend;

@interface TraitifyResult : NSObject

@property (strong) NSString *resultID;
@property (strong) NSString *deckID;
@property (strong) NSNumber *completedAt;
@property (strong) NSNumber *createdAt;
@property (strong) TraitifyBlend *personalityBlend;
@property (strong) NSArray *personalityTypes;
@property (strong) NSArray *personalityTraits;
@property (strong) NSArray *careerMatches;

+ (instancetype)resultFromDictionary:(NSDictionary *)jsonDict;

@end

/*
 "id": "7c3f284b-a4f3-408c-83b6-e6ba5f8f9d88",
 "deck_id": "career-deck",
 "completed_at": 1414091517133,
 "created_at": 1414091516266,
 "personality_blend": {...},
 "personality_types": [...],
 "personality_traits": [...],
 "career_matches": [...]
 */

