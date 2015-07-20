//
//  TraitifyBlend.h
//  Traitify
//

#import <Foundation/Foundation.h>

@class TraitifyType, TraitifyDeckBadge;

@interface TraitifyBlend : NSObject
@property (strong) NSString *blendName;
@property (strong) TraitifyType *type1;
@property (strong) TraitifyType *type2;
@property (strong) NSString *blendDescription;
@property (strong) NSArray *details;
@property (strong) NSArray *environments;
@property (strong) NSArray *famousPeople;
@property (strong) TraitifyDeckBadge *badge;

+ (instancetype)blendWithDict:(NSDictionary *)jsonDict;

@end
