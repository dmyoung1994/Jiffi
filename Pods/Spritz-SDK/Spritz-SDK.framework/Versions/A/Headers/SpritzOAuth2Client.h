//
//  SpritzOAuth2Client.h
//
//  Created by Rod Schmidt on 11/11/13.
//  Copyright (c) 2013 infiniteNIL. All rights reserved.
//

#import "AFNetworking.h"

typedef void (^SpritzOAuth2ClientCompletionBlock)(NSError *error);

@interface SpritzOAuth2Client : AFHTTPSessionManager

+ (SpritzOAuth2Client *)sharedOAuth2Client;

@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString *userAccessToken;
@property (nonatomic, strong) NSString *refreshToken;

- (void)setClientID:(NSString *)clientID clientSecret:(NSString *)clientSecret;

- (void)authenticateClient:(SpritzOAuth2ClientCompletionBlock)completion;
- (void)authenticateUser:(NSString *)username password:(NSString *)password completion:(SpritzOAuth2ClientCompletionBlock)completion;
- (void)authenticateGuestUser:(SpritzOAuth2ClientCompletionBlock)completion;
- (void)refreshUserAccessToken:(SpritzOAuth2ClientCompletionBlock)completion;

- (void)logout;

@end
