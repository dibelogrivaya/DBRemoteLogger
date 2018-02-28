# DBRemoteLogger
A custom CocoaLumberjack logger for remote logging through Antenna

[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg?style=flat)](https://github.com/dibelogrivaya/DBRemoteLogger)
[![Xcode](https://img.shields.io/badge/Xcode-8.0-blue.svg?style=flat)](https://developer.apple.com/xcode)
[![License](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat)](https://github.com/dibelogrivaya/DBRemoteLogger)

## Installation

```objc
source 'git@github.com:dibelogrivaya/db-specs.git'
pod "DBRemoteLogger" 
```

## Usage

```objc
[DBRemoteLogger addLoggerWithChannelUrlPath:@"http://localhost:3000/logs" useLifecycleNotifications:YES];
DDLogInfo(@"Started using logging");
```
