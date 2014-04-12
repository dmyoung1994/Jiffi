//
//  SpritzConnector.h
//  Spritz-SDK
//
//  Created by Alexander Mirson on 26/02/14.
//  Copyright (c) 2014 Alexander Mirson. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Notification to notify all available listeners (broadcast)
 */
extern NSString *spritzConnectorDidAuthentificateNotification;

@interface SpritzConnector : NSObject

@property (nonatomic, strong) NSString *clientID;
@property (nonatomic, strong) NSString *clientSecret;
@property (nonatomic, strong) NSString *redirectURI;

/**
 *  Creates an instance of the SpirtzConnector class
 *
 *  @return SpritzConnector object
 */
+ (SpritzConnector *)sharedConnector;

/**
 *  Sets up a data store stack. It must be set up at the beggining to ensure a proper work of the Spritz framework
 */
- (void)setUpDataStore;

/**
 *  Authentificate client to retrieve data from the server. ClientID and clientSecret must be provided by the delegate. Otherwise default values will be used.
 */
- (void)authenticateClient;

@end


