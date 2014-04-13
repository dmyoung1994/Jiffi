//
//  NSDate+SpritzDateFormat.h
//  SpritzNewsReader
//
//  Created by Rod Schmidt on 11/13/13.
//  Copyright (c) 2013 Spritz Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SpritzDateFormat)

+ (NSDateFormatter *)spritzDateFormatter;
+ (NSDate *)dateFromSpritzJSONDate:(NSString *)dateString;
+ (NSString *)nowAsISO8601Date;

- (NSString *)asISO8601Date;

@end
