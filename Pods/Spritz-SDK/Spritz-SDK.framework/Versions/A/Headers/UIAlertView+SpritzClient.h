//
//  UIAlertView+SpritzClient.h
//  SpritzNewsReader
//
//  Created by Rod Schmidt on 11/12/13.
//  Copyright (c) 2013 Spritz Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (SpritzClient)

+ (void)showSpritzAPIError:(NSError *)anError;

@end
