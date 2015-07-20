//
//  TraitifyBlend.m
//  Traitify
//

#import "TraitifyBlend.h"
#import "TraitifyType.h"
#import "TraitifyDeckBadge.h"


@implementation TraitifyBlend

+ (instancetype)blendWithDict:(NSDictionary *)jsonDict {
	if (!jsonDict) return nil;
	
	TraitifyBlend *blend = [[TraitifyBlend alloc] init];
	blend.blendName = jsonDict[@"blend_name"];
	blend.type1 = [TraitifyType typeWithDict:jsonDict[@"type_1"]];
	blend.type2 = [TraitifyType typeWithDict:jsonDict[@"type_2"]];
	blend.blendDescription = jsonDict[@"description"];
	blend.details = jsonDict[@"details"];
	blend.environments = jsonDict[@"environments"];
	blend.famousPeople = jsonDict[@"famous_people"];
	blend.badge = jsonDict[@"badge"];
	return blend;
}

@end
