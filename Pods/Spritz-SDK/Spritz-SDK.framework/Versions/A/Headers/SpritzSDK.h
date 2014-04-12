//
//  Spritz_SDK.h
//  Spritz-SDK
//
//  Created by Alexander Mirson on 29/12/13.
//  Copyright (c) 2013 Alexander Mirson. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SpritzDataStore.h"
#import "UserSettings+Logic.h"
#import "Content+Logic.h"
#import "NSDate+SpritzDateFormat.h"

#import "SpritzViewController.h"
#import "SpritzInlineView.h"
#import "SpritzView.h"
#import "SpritzActionButton.h"
#import "SpritzController.h"

#import "SpritzOAuth2Client.h"
#import "UIAlertView+SpritzClient.h"

#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"

@interface SpritzSDK : NSObject

+(void)setClientID:(NSString*)clientID clientSecret:(NSString*)clientSecret redirecURI:(NSString*)redirectURI;

@end
