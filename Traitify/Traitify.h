//
//  Traitify.h
//  Traitify
//

#import <Foundation/Foundation.h>
#import "TraitifyDeck.h"
#import "TraitifyDeckBadge.h"
#import "TraitifyAssessment.h"
#import "TraitifySlide.h"
#import "TraitifyResult.h"
#import "TraitifyCareerMatch.h"
#import "TraitifyTrait.h"
#import "TraitifyType.h"
#import "TraitifyBlend.h"


typedef void(^ArrayBlock)(NSArray *array);
typedef void(^DictBlock)(NSDictionary *dict);
typedef void(^IdBlock)(id value);

@interface Traitify : NSObject

@property (strong) NSString *secretKey;
@property (assign) BOOL useTestingMode;

//Decks
- (void)listDecksComplete:(ArrayBlock)complete;


//Assessments
- (void)createAssessmentWithDeckID:(NSString *)deckID complete:(DictBlock)complete;


//Slides
- (void)listSlidesForAssessmentID:(NSString *)assessmentID complete:(ArrayBlock)complete;
- (void)updateSlide:(TraitifySlide *)slide
 forAssessmentID:(NSString *)assessmentID
		   response:(BOOL)response
		  timeTaken:(NSTimeInterval)timeTaken
		   complete:(ArrayBlock)complete;


//Results
- (void)getResultsForAssessmentID:(NSString *)assessmentID complete:(DictBlock)complete;


//Matches
- (void)careerMatchesForAssessmentID:(NSString *)assessmentID complete:(ArrayBlock)complete;

@end
