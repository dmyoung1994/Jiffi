//
//  UserSettings.h
//  Spritz-SDK
//
//  Created by Alexander Mirson on 07/02/14.
//  Copyright (c) 2014 Alexander Mirson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserSettings : NSManagedObject

@property (nonatomic, retain) NSDate * createdDate;
@property (nonatomic, retain) NSDate * modifiedDate;
@property (nonatomic, retain) NSNumber * db_rampUp;
@property (nonatomic, retain) NSNumber * db_rampUpDuration;
@property (nonatomic, retain) NSString * db_sweeperType;
@property (nonatomic, retain) NSString * userSettingsID;
@property (nonatomic, retain) NSData * db_wordDelays;
@property (nonatomic, retain) NSNumber * db_wordsPerMinute;

@end
