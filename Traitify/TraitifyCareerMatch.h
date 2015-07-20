//
//  TraitifyCareerMatch.h
//  Traitify
//

#import <Foundation/Foundation.h>

@interface TraitifyCareerMatch : NSObject
@property (strong) NSDictionary *career;
@property (strong) NSNumber *score;

+ (instancetype)careerMatchWithDictionary:(NSDictionary *)jsonDict;
+ (NSArray *)careerMatchesArrayWithArray:(NSArray *)jsonArray;

@end
