//
//  TraitifyTrait.h
//  Traitify
//

#import <Foundation/Foundation.h>

@interface TraitifyTrait : NSObject

@property (strong) NSString *traitName;
@property (strong) NSString *traitDefinition;
@property (strong) NSNumber *score;

+ (instancetype)traitWithDict:(NSDictionary *)jsonDict;
+ (NSArray *)traitsArrayWithArray:(NSArray *)jsonArray;

@end
