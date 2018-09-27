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
  NSLog(@"[DEBUG] %@ loaded", self);
}

#pragma Public APIs

#define ADD_TO_OPTIONS_IF_SET(payload, property, options)                 \
  {                                                                       \
    if ([payload objectForKey:property] != nil) {                         \
      [options setValue:[payload objectForKey:property] forKey:property]; \
    }                                                                     \
  }

- (void)configure:(id)arguments
{
  if ([FIRApp defaultApp] != nil) {
    DebugLog(@"[DEBUG] The defaultApp of FirebaseCore has already been configured, skipping initialization.");
    return;
  }

  if (!arguments || [arguments count] == 0) {
    [FIRApp configure];
    return;
  }

  NSDictionary *payload = [arguments objectAtIndex:0];
  FIROptions *options = [FIROptions defaultOptions];

  NSString *name = [payload objectForKey:@"name"];
  NSString *file = [payload objectForKey:@"file"];
  NSString *googleAppID = [payload objectForKey:@"googleAppID"];
  NSString *GCMSenderID = [payload objectForKey:@"GCMSenderID"];

  // Check if plist file provided first
  if (file != nil) {
    if (![[file pathExtension] isEqualToString:@"plist"]) {
      NSLog(@"[ERROR] The \"file\" property has to include a .plist file, e.g. \"GoogleService-Info.plist\"");
    }
    options = [[FIROptions alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[file stringByDeletingPathExtension]
                                                                                         ofType:[file pathExtension]]];

    // Check for google-credentials next
  } else if (googleAppID != nil && GCMSenderID != nil) {
    NSString *path = [[NSBundle mainBundle] pathForResource:[file stringByDeletingPathExtension] ofType:[file pathExtension]];
    options = [[FIROptions alloc] initWithGoogleAppID:googleAppID
                                          GCMSenderID:GCMSenderID];

    // Try to set any other properties provided if nothing else works
  } else {
    ADD_TO_OPTIONS_IF_SET(payload, @"APIKey", options);
    ADD_TO_OPTIONS_IF_SET(payload, @"bundleID", options);
    ADD_TO_OPTIONS_IF_SET(payload, @"clientID", options);
    ADD_TO_OPTIONS_IF_SET(payload, @"trackingID", options);
    ADD_TO_OPTIONS_IF_SET(payload, @"projectID", options);
    ADD_TO_OPTIONS_IF_SET(payload, @"androidClientID", options);
    ADD_TO_OPTIONS_IF_SET(payload, @"databaseURL", options);
    ADD_TO_OPTIONS_IF_SET(payload, @"deepLinkURLScheme", options);
    ADD_TO_OPTIONS_IF_SET(payload, @"storageBucket", options);
  }

  if (name != nil) {
    [FIRApp configureWithName:name options:options];
    return;
  }

  [FIRApp configureWithOptions:options];
}

@end
