//
//  UserSettings+UserSettings_Logic.h
//  Spritz-SDK
//
//  Created by Alexander Mirson on 05/02/14.
//  Copyright (c) 2014 Alexander Mirson. All rights reserved.
//

#import "UserSettings.h"
#import "SpritzSettings.h"

@interface UserSettings (Logic)

@property (nonatomic) BOOL rampUp;
@property (nonatomic) SweeperFlags sweeperType;
@property (nonatomic) CGFloat rampUpDuration;
@property (nonatomic) NSArray *wordDelays;
@property (nonatomic) NSUInteger wordsPerMinute;

- (void)updateFromDefaultSettings:(SpritzSettings *)spritzSettings;

- (void)updateFromJSON:(NSDictionary *)userSettingsDict;

- (NSDictionary *)JSONDictionary;

@end
