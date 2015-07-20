//
//  TraitifyDeckBadge.h
//  Traitify
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TraitifyDeckBadge : NSObject

@property (strong) NSURL *imageSmallURL;
@property (strong) NSURL *imageMediumURL;
@property (strong) NSURL *imageLargeURL;
@property (strong) UIColor *fontColor;
@property (strong) UIColor *color1;
@property (strong) UIColor *color2;
@property (strong) UIColor *color3;
@property (strong) NSString *personalityType;
@property (strong) NSString *badgeDescription;

+ (instancetype)deckBadgeWithDictionary:(NSDictionary *)jsonDict;

@end

/*
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
 }
*/
