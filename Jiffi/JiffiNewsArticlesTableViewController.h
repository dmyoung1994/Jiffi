//
//  JiffiNewsArticlesTableViewController.h
//  Jiffi
//
//  Created by Daniel Young on 2014-04-12.
//  Copyright (c) 2014 Jiffi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JiffiNewsArticlesTableViewController : UITableViewController
@property (nonatomic, strong) NSDictionary *articlesDictionary;
@property (nonatomic, strong) NSArray *articlesArray;
- (int)wordCount:(NSString *)word;
@end
