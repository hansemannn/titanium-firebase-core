# Firebase Core - Titanium Module
Use the native Firebase SDK in Axway Titanium. This repository is part of the [Titanium Firebase](https://github.com/hansemannn/titanium-firebase) project.

## Requirements
- [x] Titanium SDK 7.0.0+

## Download
- [x] [Stable release](https://github.com/hansemannn/titanium-firebase-core/releases)
- [x] [![gitTio](http://hans-knoechel.de/shields/shield-gittio.svg)](http://gitt.io/component/firebase.core)

## API's

### `FirebaseCore`

#### Methods

##### `configure() -> Boolean`

Configure Firebase without additional parameters.

Returns `false` if it was already configured or if there was an error. Calling `deleteInstanceId()` can be used to re-configure it.

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
| `applicationID` | String | Analytics | Android


##### `deleteInstanceId(callback)`

Delete the current `instanceId` (invalidating all tokens). See the [Firebase docs](https://firebase.google.com/docs/reference/android/com/google/firebase/iid/FirebaseInstanceId.html#deleteInstanceId()) for details.

The callback receives an object containing this fields:

| Key | Type | Description | Platform |
| - | - | - | - |
| `success` | Boolean | `true` if the deletion succeeded | *
| `error` | String | The localized error message | *

##### `deleteToken(authorizedEntity, scope, callback)`

Delete the token of the provided `authorizedEntity` and `scope`. See the [Firebase docs](https://firebase.google.com/docs/reference/android/com/google/firebase/iid/FirebaseInstanceId#deleteToken(java.lang.String,%20java.lang.String)) for details.

The callback receives an object containing this fields:

| Key | Type | Description | Platform |
| - | - | - | - |
| `success` | Boolean | `true` if the deletion succeeded | *
| `error` | String | The localized error message | *

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

## Legal

This module is Copyright (c) 2017-Present by Hans Knöchel. All Rights Reserved.
