//
//  JiffiNewsTVC.m
//  Jiffi
//
//  Created by Daniel Young on 2014-04-12.
//  Copyright (c) 2014 Jiffi. All rights reserved.
//

#import "JiffiTVC.h"
#import "JiffiNewsArticlesTableViewController.h"

@interface JiffiTVC ()
@property (nonatomic) int articles;
@end

@implementation JiffiTVC

- (id)initWithStyle:(UITableViewStyle)style
{
        self = [super initWithStyle:style];
        if (self) {
                // Custom initialization
            }
        return self;
    }

- (void)setNewsSources:(NSArray *)newsSources {
        _newsSources = newsSources;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad
{
        [super viewDidLoad];
    self.newsSources = @[@"The Guardian"];
    [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:87.0/255.0 blue:68.0/255.0 alpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
        // Uncomment the following line to preserve selection between presentations.
        // self.clearsSelectionOnViewWillAppear = NO;
    
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    }

- (void)didReceiveMemoryWarning
{
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

#pragma mark - UITableView Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
        // Return the number of sections.
        return 1;
    }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        // Return the number of rows in the section.
        return [self.newsSources count];
    }


- (int)getNumberOfArticles {
    NSString *urlString = @"http://retailigence.info/pinterest/jiffi/getCount.php?publisher=guardian";
    NSURL *myURL = [NSURL URLWithString:urlString];
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:nil];
    return [string intValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        NSString *cellName = @"NewsSource";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
        // Configure the cell...
        NSString *source = self.newsSources[indexPath.row];
        self.articles = [self getNumberOfArticles];
        cell.textLabel.text = source;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d articles", self.articles];
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
    if([segue.identifier isEqualToString:@"news"]){
        if([[segue destinationViewController] isKindOfClass:[JiffiNewsArticlesTableViewController class]]) {
            JiffiNewsArticlesTableViewController *ctrl = (JiffiNewsArticlesTableViewController *)[segue destinationViewController];
            ctrl.publisher = @"guardian";
            ctrl.numberOfArticles = self.articles;
        }
        
    }
}


@end