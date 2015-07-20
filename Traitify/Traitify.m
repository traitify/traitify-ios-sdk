//
//  Traitify.m
//  Traitify
//

#import "Traitify.h"

@interface Traitify ()
@property (strong) NSURLSession *activeSession;
@end

@implementation Traitify

#pragma mark - Decks
- (void)listDecksComplete:(ArrayBlock)complete {
	[self getFromEndpoint:@"decks" complete:^(id value) {
		if (complete) {
			if (value) {
				complete(value);
			} else {
				complete(nil);
			}
		}
	}];
}


#pragma mark - Assessments
- (void)createAssessmentWithDeckID:(NSString *)deckID complete:(DictBlock)complete {
	[self postToEndpoint:@"assessments" withParameters:@{@"deck_id": deckID} complete:^(id value) {
		if (complete) {
			if (value) {
				complete(value);
			} else {
				complete(nil);
			}
		}
	}];
}


#pragma mark - Slides
- (void)listSlidesForAssessmentID:(NSString *)assessmentID complete:(ArrayBlock)complete {
	[self getFromEndpoint:[NSString stringWithFormat:@"assessments/%@/slides", assessmentID] complete:^(id value) {
		if (complete) {
			if (value) {
				complete(value);
			} else {
				complete(nil);
			}
		}
	}];
}

- (void)updateSlide:(TraitifySlide *)slide
	forAssessmentID:(NSString *)assessmentID
		   response:(BOOL)response
		  timeTaken:(NSTimeInterval)timeTaken
		   complete:(ArrayBlock)complete; {
	//timeTaken is in seconds, so convert to milliseconds
	NSTimeInterval timeInMS = timeTaken * 1000;
	NSDictionary *parameters = @{@"id": slide.slideID, @"response": response?@"true":@"false", @"time_taken": [NSString stringWithFormat:@"%0.0f", timeInMS]};
	[self putToEndpoint:[NSString stringWithFormat:@"assessments/%@/slides/%@", assessmentID, slide.slideID] withParameters:parameters complete:^(id value) {
		if (complete) {
			if (value) {
				complete(value);
			} else {
				complete(nil);
			}
		}
	}];
}


#pragma mark - Results
- (void)getResultsForAssessmentID:(NSString *)assessmentID complete:(DictBlock)complete {
	[self getFromEndpoint:[NSString stringWithFormat:@"assessments/%@?data=blend,types,traits,career_matches", assessmentID] complete:^(id value) {
		if (complete) {
			if (value) {
				complete(value);
			} else {
				complete(nil);
			}
		}
	}];
}


#pragma mark - Matches
- (void)careerMatchesForAssessmentID:(NSString *)assessmentID complete:(ArrayBlock)complete {
	[self getFromEndpoint:[NSString stringWithFormat:@"assessments/%@/matches/careers", assessmentID] complete:^(id value) {
		if (complete) {
			if (value) {
				complete(value);
			} else {
				complete(nil);
			}
		}
	}];
}


#pragma mark - Network methods
- (void)getFromEndpoint:(NSString *)endpoint complete:(IdBlock)complete {
	NSString *host = @"https://api.traitify.com/v1/";
	if (self.useTestingMode) {
		host = @"https://api-sandbox.traitify.com/v1/";
	}
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", host, endpoint]];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
	sessionConfig.HTTPAdditionalHeaders = @{@"Authorization": [NSString stringWithFormat:@"Basic %@:x", self.secretKey]};
	self.activeSession = [NSURLSession sessionWithConfiguration:sessionConfig];
	NSURLSessionDataTask *task = [self.activeSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		NSError *jsonError = nil;
		id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
		if (complete) {
			complete(jsonObject);
		}
	}];
	[task resume];
}

- (void)postToEndpoint:(NSString *)endpoint withParameters:(NSDictionary *)parameters complete:(IdBlock)complete {
	NSString *host = @"https://api.traitify.com/v1/";
	if (self.useTestingMode) {
		host = @"https://api-sandbox.traitify.com/v1/";
	}
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", host, endpoint]];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	request.HTTPMethod = @"POST";
	request.HTTPBody = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
	
	NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
	sessionConfig.HTTPAdditionalHeaders = @{@"Authorization": [NSString stringWithFormat:@"Basic %@:x", self.secretKey]};
	self.activeSession = [NSURLSession sessionWithConfiguration:sessionConfig];
	NSURLSessionDataTask *task = [self.activeSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		NSError *jsonError = nil;
		id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
		if (complete) {
			complete(jsonObject);
		}
	}];
	[task resume];
}

- (void)putToEndpoint:(NSString *)endpoint withParameters:(NSDictionary *)parameters complete:(IdBlock)complete {
	NSString *host = @"https://api.traitify.com/v1/";
	if (self.useTestingMode) {
		host = @"https://api-sandbox.traitify.com/v1/";
	}
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", host, endpoint]];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	request.HTTPMethod = @"PUT";
	request.HTTPBody = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
	
	NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
	sessionConfig.HTTPAdditionalHeaders = @{@"Authorization": [NSString stringWithFormat:@"Basic %@:x", self.secretKey]};
	self.activeSession = [NSURLSession sessionWithConfiguration:sessionConfig];
	NSURLSessionDataTask *task = [self.activeSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		NSError *jsonError = nil;
		id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
		if (complete) {
			complete(jsonObject);
		}
	}];
	[task resume];
}

@end
