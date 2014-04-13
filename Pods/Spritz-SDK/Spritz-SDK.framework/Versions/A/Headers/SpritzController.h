//
//  SpritzController.h
//
//  Created by Alexander Mirson on 1/30/13.
//  Copyright (c) 2013 Alexander Mirson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpritzSettings.h"
#import "SpritzView.h"

@protocol SpritzControllerDelegate;

@interface SpritzController : NSObject <SpritzSettingsDelegate>

@property (nonatomic, readonly, getter = hasStarted) BOOL started;
@property (nonatomic, readonly, getter = isPaused) BOOL paused;

/**
 *  SpirtzController init method. It takes a SpritzView object as reticle where the text will be spritzed.
 *
 *  @param aSpritzView A SpritzView object
 *  @param delegate    A delegate - only one method onCompleted is supported right now
 *
 *  @return an instance of the SpritzController object
 */
- (instancetype)initWithSpritzView:(SpritzView *)aSpritzView;

/**
 *  Add SpritzControllerDelegate
 *
 *  @param delegate A delegate, which will be added to array of SpritzController delegates
 */
- (void)addSpritzControllerDelegate:(id <SpritzControllerDelegate>)delegate;

/**
 *  Starts text spritzing
 *
 *  @param contenct a plain text or a preprocessed data (an array of words, specific falgs and word delays)
 */
- (void)startSpritzing:(id)content;

/**
 *  Stops text spritzing
 */
- (void)stop;

- (void)pause;
- (void)resume;
- (void)togglePause;

- (void)goBackASentence;
- (void)goBackToStart;

@end

@protocol SpritzControllerDelegate <NSObject>

- (void)onStart:(int)charPos wordPos:(int)wordPos timePos:(float)timePos speed:(int)speed;
- (void)onPause:(int)charPos wordPos:(int)wordPos timePos:(float)timePos speed:(int)speed;
- (void)onResume:(int)charPos wordPos:(int)wordPos timePos:(float)timePos speed:(int)speed;
- (void)onStop:(int)charPos wordPos:(int)wordPos timePos:(float)timePos speed:(int)speed;
- (void)onGoBackASentence:(int)charPos wordPos:(int)wordPos timePos:(float)timePos speed:(int)speed;
- (void)onGoBackToStart:(int)charPos wordPos:(int)wordPos timePos:(float)timePos speed:(int)speed;
- (void)onCompleted:(int)charPos wordPos:(int)wordPos timePos:(float)timePos speed:(int)speed;

@end
