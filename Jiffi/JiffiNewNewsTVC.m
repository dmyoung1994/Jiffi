//
//  JiffiNewNewsTVC.m
//  Jiffi
//
//  Created by Daniel Young on 2014-04-12.
//  Copyright (c) 2014 Jiffi. All rights reserved.
//

#import "JiffiNewNewsTVC.h"

@interface JiffiNewNewsTVC ()

@end

@implementation JiffiNewNewsTVC

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
    [self fetchNewNews];
}

- (void) fetchNewNews {
    // NSURL *url = url to database to get sources
#warning Blocks main thread
    // NSData *jsonResults = [NSData dataWithContentsOfURL:url];
    //NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonResults options:0 error:NULL];
    // Parse through the dictionary then set the newsSource to be this array
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
