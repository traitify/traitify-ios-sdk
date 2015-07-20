//
//  TraitifyDeck.h
//  Traitify
//

#import <Foundation/Foundation.h>

@interface TraitifyDeck : NSObject

@property (strong) NSString *deckID;
@property (strong) NSString *deckName;
@property (strong) NSString *deckDescription;
@property (strong) NSString *personalityGroup;
@property (strong) NSNumber *slideCount;
@property (strong) NSArray *badges;
@property (strong) NSString *exampleUsage;
@property (assign) BOOL validated;

+ (instancetype)deckWithDictionary:(NSDictionary *)jsonDict;

@end


/*
 {
 "id": "career-deck",
 "name": "Careers",
 "description": "Personalize work-related sites and applications with Traitify's Careers Assessment. The Careers deck offers developers rich data points including personality blend, types, traits and matching. Built for users including students, job-seekers, teams, human resources and leadership, Careers data can be used to enrich experiences, drive engagement and build more productive teams and work spaces.",
 "personality_group": "Careers II",
 "slide_count": 56,
 "badges": [
 {
 "image_small": "https://traitify-api.s3.amazonaws.com/badges/action-taker/flat/small",
 "image_medium": "https://traitify-api.s3.amazonaws.com/badges/action-taker/flat/medium",
 "image_large": "https://traitify-api.s3.amazonaws.com/badges/action-taker/flat/large",
 "font_color": "fff",
 "color_1": "ffa466",
 "color_2": "f79b5c",
 "color_3": "ea813b",
 "personality_type": "Action-Taker",
 "description": "'Action-Takers'...are hands-on doers.  They use manual and physical skills, working with technology or machinery to complete tasks.  Often there is an athletic aspect to their work.  They are handy, practical, systematic, applied, and 'down-to-earth.'  They are drawn to jobs that involve a specific skill-set and a concrete task.  They excel at solitary, goal-oriented work and 'getting the job done.'"
 },
 ...
 ]
 },
*/