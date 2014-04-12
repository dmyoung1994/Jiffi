//
//  Copyright 2011 Twilio. All rights reserved.
//
 
#import <UIKit/UIKit.h>

@interface HelloMonkeyViewController : UIViewController
{
	UIButton* _dialButton;
	UIButton* _hangupButton;

	UITextField* _numberField;
}

@property (nonatomic, retain) IBOutlet UIButton* dialButton;
@property (nonatomic, retain) IBOutlet UIButton* hangupButton;
@property (nonatomic, retain) IBOutlet UITextField* numberField;

-(IBAction)dialButtonPressed:(id)sender;
-(IBAction)hangupButtonPressed:(id)sender;

@end

