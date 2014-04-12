//
//  Content.h
//  Spritz-SDK
//
//  Created by Alexander Mirson on 30/03/14.
//  Copyright (c) 2014 Alexander Mirson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Content : NSManagedObject

@property (nonatomic, retain) NSString * contentID;
@property (nonatomic, retain) NSDate * createdDate;
@property (nonatomic, retain) NSNumber * db_duration;
@property (nonatomic, retain) NSDate * lastRetrievedDate;
@property (nonatomic, retain) NSString * locale;
@property (nonatomic, retain) NSDate * modifiedDate;
@property (nonatomic, retain) NSString * plainText;
@property (nonatomic, retain) NSString * containerFormat;
@property (nonatomic, retain) NSData * db_spritzableTextData;
@property (nonatomic, retain) NSData * db_spritzableAttributeData;

@end
