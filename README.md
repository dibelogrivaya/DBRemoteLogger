# DBRemoteLogger
A custom CocoaLumberjack logger for remote logging through Antenna

## Installation

```objc
source 'git@github.com:dibelogrivaya/db-specs.git'
pod "DBRemoteLogger" 
```

## Usage

* Import `DBRemoteLogger.h` in your view.

```objc
    [[Antenna sharedLogger] addChannelWithURL:[NSURL URLWithString:@"http://localhost:3000/logs"] method:@"POST"];
    [[Antenna sharedLogger] startLoggingApplicationLifecycleNotifications];
    
    DBRemoteLogger *logger = [[DBRemoteLogger alloc] initWithAntenna:[Antenna sharedLogger]];
    [DDLog addLogger:logger];
    
    DDLogInfo(@"Test message");
```

## Requirements

- iOS >= 8.0
- ARC

# License

DBRemoteLogger is available under the MIT license. See the LICENSE file for more info.
