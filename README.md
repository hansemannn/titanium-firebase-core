# Firebase Core - Titanium Module
Use the native Firebase SDK in Axway Titanium. This repository is part of the [Titanium Firebase](https://github.com/hansemannn/titanium-firebase) project.

## Requirements
- [x] Titanium SDK 6.2.0 or later

## Download
- [x] [Stable release](https://github.com/hansemannn/titanium-firebase-core/releases)
- [x] [![gitTio](http://hans-knoechel.de/shields/shield-gittio.svg)](http://gitt.io/component/firebase.core)

## API's

### `FirebaseCore`

#### Methods

##### `configure()`

#### `configure(parameters)`

Optionally, you can pass parameters to the `configure` method. Either pass a config plist in the  `file` property,
pass your Google-ID's (`googleAppID` and `GCMSenderID`) or sub-set of the following properties:


  iOS & Android:
  - `APIKey` (String) - Auth
  - `projectID` (String)
  - `databaseURL` (String) - Real Time Database
  - `storageBucket` (String) - Storage Bucket


  iOS only:
  - `bundleID` (String)
  - `clientID` (String)
  - `trackingID` (String)
  - `androidClientID` (String)
  - `deepLinkURLScheme` (String)


  Android only:
  - `applicationID` (String) - Analytics

## Example
```js
// Require the Firebase Core module
var FirebaseCore = require('firebase.core');

// Configure your Firebase API's (only required once for all)
FirebaseCore.configure();
```

## Build
```js
cd ios
appc ti build -p ios --build-only
```

## Legal

This module is Copyright (c) 2017-Present by Appcelerator, Inc. All Rights Reserved. 
Usage of this module is subject to the Terms of Service agreement with Appcelerator, Inc.  
