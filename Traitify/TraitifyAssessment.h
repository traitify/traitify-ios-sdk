//
//  TraitifyAssessment.h
//  Traitify
//

#import <Foundation/Foundation.h>

@interface TraitifyAssessment : NSObject

@property (strong) NSString *assessmentID;
@property (strong) NSString *deckID;
@property (strong) NSNumber *completedAt;
@property (strong) NSNumber *createdAt;

+ (instancetype)assessmentWithDictionary:(NSDictionary *)jsonDict;

@end


/*
 {
 "id": "acff3436-2801-4b13-90b3-25eeeceffba9",
 "deck_id": "career-deck",
 "completed_at": null,
 "created_at": 1394655449646
 }
*/