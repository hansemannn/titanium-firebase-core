# Firebase Core - Titanium Module
Use the native Firebase SDK in Axway Titanium. This repository is part of the [Titanium Firebase](https://github.com/hansemannn/titanium-firebase) project. This module is <strong>required for iOS but not needed anymore for Android</strong>. Since Ti 9.0.0 gradle will automatically read the configuration (see [Firebase-Core](https://github.com/hansemannn/titanium-firebase#installation))

## Supporting this effort

The whole Firebase support in Titanium is developed and maintained by the community (`@hansemannn` and `@m1ga`). To keep
this project maintained and be able to use the latest Firebase SDK's, please see the "Sponsor" button of this repository,
thank you!

## Requirements
- [x] Titanium SDK 10.0.0+

## Download
- [x] [Stable release](https://github.com/hansemannn/titanium-firebase-core/releases)
- [x] [![gitTio](http://hans-knoechel.de/shields/shield-gittio.svg)](http://gitt.io/component/firebase.core)

## Installation

Read the [Firebase-Core](https://github.com/hansemannn/titanium-firebase#installation) install part if you set up a new project.

## API's

### `FirebaseCore`

#### Methods

##### `configure() -> Boolean`

Configure Firebase without additional parameters.

Returns `false` if it was already configured or if there was an error.

##### `configure(parameters)`

Configure Firebase with configuration parameters:

| Name | Type | Component | Platform |
| - | - | - | - |
| `file` | String | | *

By passing the `file` property, you can give a location to the Firebase plist file (usually named "GoogleService-Info.plist"), which contains all necessary properties for your Firebase project. This makes all other properties unnecessary. For Android: place the file in `/app/assets/android/` and pass just the filename.

Or you can configure Firebase without a file by passing these parameters:

| Name | Type | Component | Platform |
| - | - | - | - |
| `googleAppID` | String | | *
| `GCMSenderID` | String | Cloud Messaging | *
| `APIKey` | String | Auth | *
| `projectID` | String | | *
| `databaseURL` | String | Real Time Database | *
| `storageBucket` | String | Storage Bucket | *
| `bundleID` | String | | iOS
| `clientID` | String | | iOS
| `trackingID` | String | | iOS
| `androidClientID` | String | | iOS
| `deepLinkURLScheme` | String | | iOS
| `logLevel` | `LOG_LEVEL_* [ERROR\|WARNING\|NOTICE\|INFO\|DEBUG]` | | iOS
| `applicationID` | String | Analytics | Android

## Examples

```js
// Require the Firebase Core module
var FirebaseCore = require('firebase.core');

// Configure your Firebase API's (only required once for all)

FirebaseCore.configure();	// default google-services.json/GoogleService-Info.plist will be used

// alternative way:

FirebaseCore.configure({
  APIKey: "AIYasZBtfJh..........",
  projectID: "test-12345",
  storageBucket: "test-12345.appspot.com",
  applicationID: "1:12345678890:android:abc123efg456"
});

// alternative way:
FirebaseCore.configure({
  file: "filename.json"
});
```

## Build
```js
cd [ios|android]
appc run -p [ios|android] --build-only
```

## iOS notes

If you are also using [Ti.GoogleSignIn](https://github.com/hansemannn/titanium-google-signin) you will probably
have a `duplicate symbols` error. Both `Ti.GoogleSignIn` and this module share some common dependencies.
In order to solve this conflict, remove the *GTMSessionFetcher.framework* and *GoogleToolboxForMac.framework* files
from `<YOUR_PROJECT_DIR>/modules/iphone/firebase.core/<VERSION>/platform` and rebuild your app.

## Android notes

check [firebase-core](https://github.com/hansemannn/titanium-firebase#%EF%B8%8F-android-notes) for more information.

## Legal

This module is Copyright (c) 2017-Present by Hans Knöchel. All Rights Reserved.
