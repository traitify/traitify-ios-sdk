//
//  TraitifySlide.h
//  Traitify
//

#import <Foundation/Foundation.h>

@class UIImage;

@interface TraitifySlide : NSObject

@property (strong) NSString *slideID;
@property (strong) NSNumber *position;
@property (strong) NSString *caption;
@property (strong) NSURL *imageDesktop;
@property (strong) NSURL *imageDesktopRetina;
@property (assign) BOOL response;
@property (strong) NSNumber *timeTaken;
@property (strong) NSNumber *completedAt;
@property (strong) NSNumber *createdAt;
@property (strong) NSNumber *focusX;
@property (strong) NSNumber *focusY;

+ (instancetype)slideFromDictionary:(NSDictionary *)jsonDict;
- (void)downloadImageComplete:(void (^)(UIImage *))complete;
- (void)downloadRetinaImageComplete:(void (^)(UIImage *))complete;

@end

/*
 {
 "id": "b93af357-0cd7-494e-b436-c67313c0fab6",
 "position": 1,
 "caption": "Using a Microscope ",
 "image_desktop": "https://traitify-api.s3.amazonaws.com/slides/b93af357-0cd7-494e-b436-c67313c0fab6/desktop",
 "image_desktop_retina": "https://traitify-api.s3.amazonaws.com/slides/b93af357-0cd7-494e-b436-c67313c0fab6/desktop_retina",
 "response": null,
 "time_taken": null,
 "completed_at": null,
 "created_at": 1414091516995,
 "focus_x": 62,
 "focus_y": 47
 },
*/