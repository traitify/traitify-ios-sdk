//
//  TraitifyType.h
//  Traitify
//

#import <Foundation/Foundation.h>

@class TraitifyDeckBadge;


@interface TraitifyType : NSObject
@property (strong) NSString *typeName;
@property (strong) NSString *typeDescription;
@property (strong) NSString *shortDesc;
@property (strong) NSString *keywords;
@property (strong) NSArray *environments;
@property (strong) NSArray *famousPeople;
@property (strong) TraitifyDeckBadge *badge;
@property (strong) NSNumber *score;

+ (instancetype)typeWithDict:(NSDictionary *)jsonDict;
+ (NSArray *)typesArrayWithArray:(NSArray *)jsonArray;

@end
