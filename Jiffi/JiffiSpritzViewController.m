//
//  JiffiSpritzViewController.m
//  Jiffi
//
//  Created by Daniel Young on 2014-04-12.
//  Copyright (c) 2014 Jiffi. All rights reserved.
//

#import "JiffiSpritzViewController.h"

@interface JiffiSpritzViewController () <SpritzControllerDelegate>
@property (weak, nonatomic) IBOutlet SpritzInlineView *spritzView;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation JiffiSpritzViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView.text = self.content;
    self.speedLabel.text = [NSString stringWithFormat:@"%d",(int)ceil(self.speedStepper.value)];
     self.speedStepper.value = [SpritzDataStore sharedStore].userSettings.wordsPerMinute;
    [self.spritzView addSpritzControllerDelegate:self];
    self.speedLabel.text = [NSString stringWithFormat:@"%d wpm",(int)ceil(self.speedStepper.value)];
    
}

- (IBAction)speedChanged:(id)sender {
    self.speedLabel.text = [NSString stringWithFormat:@"%d wpm",(int)ceil(self.speedStepper.value)];
    [SpritzDataStore sharedStore].userSettings.wordsPerMinute = self.speedStepper.value;
}


- (IBAction)startSpritz:(id)sender {
    //The SpritzViewController is self contained UIViewController that contains a SpritzInlineView and several utility controls. The startSpritzing method starts spritzing the passed in URL.
    if(![self.scrollView isHidden]){
        self.scrollView.hidden = YES;
    }
    SpritzController *controller = [self.spritzView valueForKey:@"_spritzController"];
    if (controller.paused) {
        [controller resume];
    } else {
        [self.spritzView startSpritzing:self.content sourceType:SourceFlagPlain speed:self.speedStepper.value];
    }
    
}

- (IBAction)pauseSpritz:(id)sender {
    SpritzController *controller = [self.spritzView valueForKey:@"_spritzController"];
    [controller pause];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onStart:(int)charPos wordPos:(int)wordPos timePos:(float)timePos speed:(int)speed{
    
}
- (void)onPause:(int)charPos wordPos:(int)wordPos timePos:(float)timePos speed:(int)speed{
    if([self.scrollView isHidden]){
        self.scrollView.hidden = NO;
    }
    
    NSArray *strings = [self.textView.text componentsSeparatedByString:@" "];
    NSInteger sum = 0;
    for (int i=0; i< wordPos; i++){
        sum += [[strings objectAtIndex:i] length];
    }
    
    sum += wordPos-1;
    
    NSMutableAttributedString *colorString = [[NSMutableAttributedString alloc] initWithString:self.textView.text];
    [colorString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, sum)];
    
    [self.textView setAttributedText:colorString];
    
}

- (void)onResume:(int)charPos wordPos:(int)wordPos timePos:(float)timePos speed:(int)speed{
    [self.spritzView startSpritzing:self.content sourceType:SourceFlagPlain speed:self.speedStepper.value];
    NSLog(@"wordPos: %d", wordPos);
    if(self.textView.selectedRange.length != 0) {
        NSString *newContent = [self.content substringWithRange:NSMakeRange(self.textView.selectedRange.location, self.textView.text.length-self.textView.selectedRange.location)];
        NSLog(@"Substring: %@", newContent);
        //[self.textView setText:newContent];
        [self.spritzView startSpritzing:newContent sourceType:SourceFlagPlain speed:self.speedStepper.value];
    }
}
- (void)onStop:(int)charPos wordPos:(int)wordPos timePos:(float)timePos speed:(int)speed{
    
}
- (void)onGoBackASentence:(int)charPos wordPos:(int)wordPos timePos:(float)timePos speed:(int)speed{
    
}
- (void)onGoBackToStart:(int)charPos wordPos:(int)wordPos timePos:(float)timePos speed:(int)speed{
    
}
- (void)onCompleted:(int)charPos wordPos:(int)wordPos timePos:(float)timePos speed:(int)speed{
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [seg   ue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
