# Firebase Core - Titanium Module
Use the native Firebase SDK in Axway Titanium. This repository is part of the [Titanium Firebase](https://github.com/hansemannn/titanium-firebase) project.

## Requirements
- [x] Titanium SDK 6.3.0+

## Download
- [x] [Stable release](https://github.com/hansemannn/titanium-firebase-core/releases)
- [x] [![gitTio](http://hans-knoechel.de/shields/shield-gittio.svg)](http://gitt.io/component/firebase.core)

## API's

### `FirebaseCore`

#### Methods

##### `configure()`

Configure Firebase without additional parameters.

##### `configure(parameters)`

Configure Firebase without configuration parameters.

| Name | Type | Component | Platform |
| - | - | - | - |
| `file`* | String | | *
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
| `applicationID` | String | Analytics | Android

\* By passing the `file` property, you can give a location to the Firebase plist file (usually named "GoogleService-Info.plist"), which contains all necessary properties for your Firebase project. This makes all other properties unnecessary. For Android: place the file in `/app/assets/android/` and pass just the filename.

## Example

```js
// Require the Firebase Core module
var FirebaseCore = require('firebase.core');

// Configure your Firebase API's (only required once for all)
FirebaseCore.configure({
  // Properties...
});
```

## Build
```js
cd [ios|android]
appc run -p [ios|android] --build-only
```

## Legal

This module is Copyright (c) 2017-Present by Hans Knöchel. All Rights Reserved.
