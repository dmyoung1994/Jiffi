//
//  JiffiSportsTableViewController.m
//  Jiffi
//
//  Created by Daniel Young on 2014-04-12.
//  Copyright (c) 2014 Jiffi. All rights reserved.
//

#import "JiffiSportsTableViewController.h"
#import "JiffiNewsArticlesTableViewController.h"

@interface JiffiSportsTableViewController ()
@property (nonatomic) int articles;
@end

@implementation JiffiSportsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.sportsNews = @[@"ESPN"];
    [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:87.0/255.0 blue:68.0/255.0 alpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (int)getNumberOfArticles {
    NSString *urlString = @"http://retailigence.info/pinterest/jiffi/getCount.php?publisher=espn";
    NSURL *myURL = [NSURL URLWithString:urlString];
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:nil];
    return [string intValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.sportsNews count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSString *cellName = @"SportsSource";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName
                                                            forIndexPath:indexPath];
    
    cell.textLabel.text = self.sportsNews[indexPath.row];
    self.articles = [self getNumberOfArticles];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d articles", self.articles];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"sports"]){
        if([[segue destinationViewController] isKindOfClass:[JiffiNewsArticlesTableViewController class]]) {
            JiffiNewsArticlesTableViewController *ctrl = (JiffiNewsArticlesTableViewController *)[segue destinationViewController];
            ctrl.publisher = @"espn";
            ctrl.numberOfArticles = self.articles;
        }
        
    }
}


@end
