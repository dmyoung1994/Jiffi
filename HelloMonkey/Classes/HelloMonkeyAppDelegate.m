//
//  Copyright 2011 Twilio. All rights reserved.
//
 
#import "HelloMonkeyAppDelegate.h"
#import "HelloMonkeyViewController.h"
#import "MonkeyPhone.h"

@implementation HelloMonkeyAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize phone = _phone;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{    
    // Set the view controller as the window's root view controller and display.
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
	
	self.phone = [[[MonkeyPhone alloc] init] autorelease];
	
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {

}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {

}


- (void)dealloc 
{
    [_viewController release];
    [_window release];
	
	[_phone release];
	
    [super dealloc];
}


@end
