//
//  SpritzActionSheetButton.h
//  HelloWorld-Spritz-SDK
//
//  Created by Alexander Mirson on 06/04/14.
//  Copyright (c) 2014 Alexander Mirson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpritzActionButton : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic) NSObject *tartget;
@property (nonatomic) SEL selector;

@end
