//
//  TraitifySlide.m
//  Traitify
//

#import "TraitifySlide.h"
#import <UIKit/UIKit.h>


@implementation TraitifySlide

+ (instancetype)slideFromDictionary:(NSDictionary *)jsonDict {
	if (!jsonDict) return nil;
	
	TraitifySlide *slide = [[TraitifySlide alloc] init];
	slide.slideID = jsonDict[@"id"];
	slide.position = jsonDict[@"position"];
	slide.caption = jsonDict[@"caption"];
	slide.imageDesktop = [NSURL URLWithString:jsonDict[@"image_desktop"]];
	slide.imageDesktopRetina = [NSURL URLWithString:jsonDict[@"image_desktop_retina"]];
	slide.response = jsonDict[@"response"] ? YES : NO;
	slide.timeTaken = jsonDict[@"time_taken"];
	slide.completedAt = jsonDict[@"completed_at"];
	slide.createdAt = jsonDict[@"created_at"];
	slide.focusX = jsonDict[@"focus_x"];
	slide.focusY = jsonDict[@"focus_y"];
	
	return slide;
}

- (void)downloadImageComplete:(void (^)(UIImage *))complete {
	NSURLRequest *request = [NSURLRequest requestWithURL:self.imageDesktop];
	NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
	NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
	NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		if (data) {
			UIImage *image = [UIImage imageWithData:data];
			complete(image);
		} else {
			complete(nil);
		}
	}];
	[task resume];
}
- (void)downloadRetinaImageComplete:(void (^)(UIImage *))complete {
	NSURLRequest *request = [NSURLRequest requestWithURL:self.imageDesktopRetina];
	NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
	NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
	NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		if (data) {
			UIImage *image = [UIImage imageWithData:data];
			complete(image);
		} else {
			complete(nil);
		}
	}];
	[task resume];
}

@end
