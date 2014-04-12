//
//  Copyright 2011 Twilio. All rights reserved.
//
 
#import <UIKit/UIKit.h>

@class HelloMonkeyViewController;
@class MonkeyPhone;

@interface HelloMonkeyAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow* _window;
    HelloMonkeyViewController* _viewController;
	
	MonkeyPhone* _phone;
}

@property (nonatomic, retain) IBOutlet UIWindow* window;
@property (nonatomic, retain) IBOutlet HelloMonkeyViewController* viewController;
@property (nonatomic, retain) MonkeyPhone* phone;

@end

