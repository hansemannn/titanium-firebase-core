/**
 * titanium-firebase-core
 *
 * Created by Hans Knoechel
 * Copyright (c) 2020 by Hans Knöchel. All rights reserved.
 */

#import "TiModule.h"

@interface FirebaseCoreModule : TiModule

- (NSNumber *)configure:(id)arguments;

- (void)setLogLevel:(NSNumber *)logLevel;

- (void)fetchInstanceID:(id)callback;

- (void)deleteInstanceId:(id)callback;

- (void)deleteToken:(id)arguments;

@end
