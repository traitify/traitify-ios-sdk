//
//  TraitifyDeck.m
//  Traitify
//

#import "TraitifyDeck.h"
#import "TraitifyDeckBadge.h"


@implementation TraitifyDeck

+ (instancetype)deckWithDictionary:(NSDictionary *)jsonDict {
	if (!jsonDict) return nil;
	
	TraitifyDeck *deck = [[TraitifyDeck alloc] init];
	deck.deckID = jsonDict[@"id"];
	deck.deckName = jsonDict[@"name"];
	deck.deckDescription = jsonDict[@"description"];
	deck.personalityGroup = jsonDict[@"personality_group"];
	deck.slideCount = jsonDict[@"slide_count"];
	
	NSMutableArray *badges = [NSMutableArray array];
	for (NSDictionary *badgeDict in jsonDict[@"badges"]) {
		TraitifyDeckBadge *badge = [TraitifyDeckBadge deckBadgeWithDictionary:badgeDict];
		[badges addObject:badge];
	}
	deck.badges = [badges copy];
	
	return deck;
}

@end
