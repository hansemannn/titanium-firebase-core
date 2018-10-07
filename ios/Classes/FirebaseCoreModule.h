/**
 * titanium-firebase-core
 *
 * Created by Hans Knoechel
 * Copyright (c) 2017 Axway Appcelerator. All rights reserved.
 */

#import "TiModule.h"

@interface FirebaseCoreModule : TiModule {
}

- (void)configure:(id)arguments;

- (void)deleteInstanceId:(id)callback;

- (void)deleteToken:(id)arguments;

@end
