//
//  Copyright 2011 Twilio. All rights reserved.
//
 
#import "HelloMonkeyViewController.h"
#import "HelloMonkeyAppDelegate.h"
#import "MonkeyPhone.h"

@implementation HelloMonkeyViewController

@synthesize dialButton = _dialButton;
@synthesize hangupButton = _hangupButton;
@synthesize numberField = _numberField;


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	// Limit to portrait for simplicity.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)viewDidUnload
{
	self.dialButton = nil;
	self.hangupButton = nil;
	self.numberField = nil;

	[super viewDidUnload];
}


-(IBAction)dialButtonPressed:(id)sender
{
    HelloMonkeyAppDelegate* appDelegate = (HelloMonkeyAppDelegate*)[UIApplication sharedApplication].delegate;
    MonkeyPhone* phone = appDelegate.phone;
    [phone connect];
}


-(IBAction)hangupButtonPressed:(id)sender
{
    HelloMonkeyAppDelegate* appDelegate = (HelloMonkeyAppDelegate*)[UIApplication sharedApplication].delegate;
    MonkeyPhone* phone = appDelegate.phone;
    [phone disconnect];
}


@end
