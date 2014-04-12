//
//  Copyright 2011 Twilio. All rights reserved.
//
 
#import <Foundation/Foundation.h>

#import "TCDevice.h"
#import "TCConnection.h"

@interface MonkeyPhone : NSObject
{
@private
    TCDevice* _device;
    TCConnection* _connection;
}
-(void)connect;
-(void)disconnect;
@end
