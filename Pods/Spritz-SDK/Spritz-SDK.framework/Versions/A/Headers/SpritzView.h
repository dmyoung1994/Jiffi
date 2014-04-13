//
//  SpritzView.h
//  Spritz 2
//
//  Created by Alexander Mirson on 1/20/13.
//  Copyright (c) 2013 Alexander Mirson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpritzSettings.h"

@class TimedWord;

@interface SpritzView : UIView

@property (nonatomic, strong) TimedWord *word;
@property (nonatomic) BOOL countdown;
@property (nonatomic) SweeperFlags sweeperType;
@property (nonatomic) CGFloat ratio;
@property (nonatomic) NSInteger wordsPerMinute;

@property (nonatomic) int fontSize;

- (instancetype)initWithFrame:(CGRect)frame focusXPosition:(CGFloat)xPosition focusHeight:(CGFloat)height;

@end
