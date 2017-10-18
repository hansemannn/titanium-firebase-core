/**
 * titanium-firebase-core
 *
 * Created by Hans Knoechel
 * Copyright (c) 2017 Axway Appcelerator. All rights reserved.
 */

#import <FirebaseCore/FirebaseCore.h>

#import "FirebaseCoreModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation FirebaseCoreModule

#pragma mark Internal

- (id)moduleGUID
{
	return @"67251823-11de-4439-8150-56cad62a55eb";
}

- (NSString *)moduleId
{
	return @"firebase.core";
}

#pragma mark Lifecycle

- (void)startup
{
	[super startup];
	NSLog(@"[DEBUG] %@ loaded",self);
}

#pragma Public APIs

- (void)configure:(id)arguments
{
  if (!arguments || [arguments count] == 0) {
    [FIRApp configure];
    return;
  }
  
  // TODO: Expose options
  __unused NSDictionary *options = [arguments objectAtIndex:0];
  [FIRApp configureWithOptions:FIROptions.defaultOptions];
}

@end
