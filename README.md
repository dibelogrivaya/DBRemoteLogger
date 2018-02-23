# DBRemoteLogger
A custom CocoaLumberjack logger for remote logging through Antenna

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

## Requirements

- iOS >= 8.0
- ARC

# License

DBRemoteLogger is available under the MIT license. See the LICENSE file for more info.
