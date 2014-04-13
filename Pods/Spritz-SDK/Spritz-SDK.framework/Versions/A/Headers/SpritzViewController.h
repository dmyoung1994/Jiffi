//
//  SpritzViewController.h
//  SpritzNewsReader
//
//  Created by Rod Schmidt on 11/15/13.
//  Copyright (c) 2013 Spritz Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSDynamicsDrawerViewController.h"

@protocol SpritzControllerDelegate;

/**
 *  defines two types of source
 */
typedef NS_OPTIONS(NSUInteger, SourceFlags) {
    /**
     *  Emtpy flag
     */
    SourceFlagNone			= 0,
    /**
     *  Plain text flag
     */
    SourceFlagPlain         = 1 << 0,
    /**
     *  URL text flag
     */
    SourceFlagURL			= 1 << 1,
    /**
     *  Mask
     */
    SourceFlagMask			= SourceFlagPlain | SourceFlagURL
};

/**
 *  SpritzViewControllerDelegate protocol; only spritzViewControllerDidFinish method is supported right now. The method will be invoked after the text spritzing is finished.
 */
@protocol SpritzViewControllerDelegate;

@interface SpritzViewController : UIViewController

@property (nonatomic, weak) id <SpritzViewControllerDelegate> delegate;

- (void)addSpritzControllerDelegate:(id<SpritzControllerDelegate>)delegate;

/**
 *  starts spritzing on the SpirtzViewController. Plain text or url are supported.
 *
 *  @param source     A plain text or an URI
 *  @param sourceType A source type
 */
- (void)startSpritzing:(NSString *)source sourceType:(SourceFlags)sourceType;
- (void)startSpritzing:(NSString *)source sourceType:(SourceFlags)sourceType speed:(NSInteger)speed;

@end

@protocol SpritzViewControllerDelegate <NSObject>

- (void)spritzViewControllerDidFinish:(SpritzViewController *)controller;

@end
