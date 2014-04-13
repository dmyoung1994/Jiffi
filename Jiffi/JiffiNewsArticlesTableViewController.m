//
//  JiffiNewsArticlesTableViewController.m
//  Jiffi
//
//  Created by Daniel Young on 2014-04-12.
//  Copyright (c) 2014 Jiffi. All rights reserved.
//

#import "JiffiNewsArticlesTableViewController.h"
#import "JiffiSpritzViewController.h"

@interface JiffiNewsArticlesTableViewController ()

@property (nonatomic, strong) NSArray *articlesDictionary;
@property (nonatomic, strong) NSMutableArray *contents;
@end

@implementation JiffiNewsArticlesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (NSArray *)getArticles {
    NSString *urlString = [NSString stringWithFormat:@"http://retailigence.info/pinterest/jiffi/getTT.php?publisher=%@", self.publisher];
    NSURL *myURL = [NSURL URLWithString:urlString];
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:nil];
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    return json[@"Pins"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.articlesDictionary = [self getArticles];
    self.contents = [[NSMutableArray alloc] init];

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

- (int) wordCount:(NSString *)word{
    int count = 0;
    NSMutableArray *array = (NSMutableArray *)[word componentsSeparatedByString:@" "];
    [array removeObject:@""]; // This removes all objects like @""
    count = [array count];
    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
   // NSLog(@"%d", [self.articlesArray count]);
    return self.numberOfArticles;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellName = @"articleTag";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *articleDictionary = [self.articlesDictionary objectAtIndex:indexPath.row];
    NSString *articleName = articleDictionary[@"Title"];
    NSString *articleContents = articleDictionary[@"Content"];
    [self.contents addObject: articleContents];
    int count = [self wordCount:articleContents];
    NSString *wc = [NSString stringWithFormat:@"%i", count];
    cell.textLabel.text = articleName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ words", wc];
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"Spritz"]){
        if([[segue destinationViewController] isKindOfClass:[JiffiSpritzViewController class]]) {
            JiffiSpritzViewController *ctrl = [segue destinationViewController];
            UITableViewCell *cell = (UITableViewCell*)sender;
            NSString *title = cell.textLabel.text;
            NSString *content = [self.contents objectAtIndex:[self.tableView indexPathForSelectedRow].row];
            ctrl.content = content;
            ctrl.articleTitle = title;
        }
        
    }
    
}


@end
