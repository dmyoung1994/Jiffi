//
//  JiffiSpritzViewController.h
//  Jiffi
//
//  Created by Daniel Young on 2014-04-12.
//  Copyright (c) 2014 Jiffi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Spritz-SDK/SpritzSDK.h>

@interface JiffiSpritzViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIStepper *speedStepper;
@property (nonatomic, strong) NSString *articleTitle;
@property (strong, nonatomic) IBOutlet UITextView *scrollView;
@property (nonatomic, strong) NSString *content;
@property (strong, nonatomic) IBOutlet UILabel *speedLabel;
@end
