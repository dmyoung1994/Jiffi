//
//  NewsReaderDataStore.h
//  SpritzNewsReader
//
//  Created by Rod Schmidt on 11/13/13.
//  Copyright (c) 2013 Spritz Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserSettings+Logic.h"
#import "Content+Logic.h"

#import "SpritzSettings.h"

@class User;

@interface SpritzDataStore : NSObject

@property (nonatomic, weak) id<SpritzSettingsDelegate> delegate;

+ (SpritzDataStore *)sharedStore;

- (instancetype)init;
- (void)cleanup;

- (User *)user;
- (void)saveUser:(NSDictionary *)userDict;

- (UserSettings *)userSettings;
- (void)saveDefaultUserSettings:(SpritzSettings *)defaultUserSettings;
- (void)saveUserSettings:(NSDictionary *)userSettingsDict;

- (Content *)content;
- (void)saveContent:(NSDictionary *)contentDict;

@end
