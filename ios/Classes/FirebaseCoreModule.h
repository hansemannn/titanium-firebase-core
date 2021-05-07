/**
 * titanium-firebase-core
 *
 * Created by Hans Knoechel
 * Copyright (c) 2017-present by Hans Knöchel. All rights reserved.
 */

#import "TiModule.h"

@interface FirebaseCoreModule : TiModule

- (NSNumber *)configure:(id)arguments;

- (void)setLogLevel:(NSNumber *)logLevel;

@end
