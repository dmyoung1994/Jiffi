//
//  JiffiNewsArticlesTableViewController.h
//  Jiffi
//
//  Created by Daniel Young on 2014-04-12.
//  Copyright (c) 2014 Jiffi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JiffiNewsArticlesTableViewController : UITableViewController
- (int)wordCount:(NSString *)word;
@property (nonatomic, strong) NSString *publisher;
@property (nonatomic) int numberOfArticles;
@end
