//
//  InlineSpritzViewController.h
//  HelloWorld-Spritz-SDK
//
//  Created by Alexander Mirson on 05/04/14.
//  Copyright (c) 2014 Alexander Mirson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpritzViewController.h"

@protocol SpritzControllerDelegate;

@interface SpritzInlineView : UIView

@property (nonatomic, readonly) bool isCompleted;

- (void)addSpritzControllerDelegate:(id<SpritzControllerDelegate>)delegate;
- (void)addSpritzActionSheetButtons:(NSArray *)buttons;

- (void)startSpritzing:(NSString *)source sourceType:(SourceFlags)sourceType;
- (void)startSpritzing:(NSString *)source sourceType:(SourceFlags)sourceType speed:(NSInteger)speed;

- (void)backButtonPressed;
- (void)rewindButtonPressed;
- (void)playButtonPressed;

@end
