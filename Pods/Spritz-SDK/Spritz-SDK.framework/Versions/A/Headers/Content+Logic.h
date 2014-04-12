//
//  Conten+Logic.h
//  Spritz-SDK
//
//  Created by Alexander Mirson on 05/02/14.
//  Copyright (c) 2014 Alexander Mirson. All rights reserved.
//

#import "Content.h"
#import <CoreGraphics/CoreGraphics.h>

@interface Content (Logic)

@property (nonatomic, readonly) NSArray *spritzableTextData;
@property (nonatomic, readonly) NSArray *spritzableAttributeData;
@property (nonatomic, readonly) CGFloat duration;

- (void)updateFromJSON:(NSDictionary *)contentDict;

@end
