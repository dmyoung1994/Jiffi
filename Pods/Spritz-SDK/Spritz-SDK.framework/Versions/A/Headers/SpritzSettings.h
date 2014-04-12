//
//  SpritzSettings.h
//  Spritz-SDK
//
//  Created by Alexander Mirson on 01/01/14.
//  Copyright (c) 2014 Alexander Mirson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef NS_OPTIONS(NSUInteger, SweeperFlags) {
    SweeperFlagNone			= 0,
    SweeperFlagRampUp       = 1 << 0,
    SweeperFlagSweeper		= 1 << 1,
	SweeperFlagMask			= SweeperFlagRampUp | SweeperFlagSweeper
};

@protocol SpritzSettingsDelegate;

@interface SpritzSettings : NSObject

@property (nonatomic) BOOL rampUp;
@property (nonatomic) SweeperFlags sweeperType;
@property (nonatomic) CGFloat rampUpDuration;
@property (nonatomic) NSArray *wordDelays;
@property (nonatomic) NSUInteger wordsPerMinute;

+ (SpritzSettings *)sharedSpritzSettings;

@end

@protocol SpritzSettingsDelegate <NSObject>

- (void)onSettingsChanged;

@end
