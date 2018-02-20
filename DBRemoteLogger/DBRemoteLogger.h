//
//  DBRemoteLogger.h
//  Example
//
//  Created by Diana Belogrivaya on 2/20/18.
//  Copyright © 2018 Diana Belogrivaya. All rights reserved.
//

#import <CocoaLumberjack/CocoaLumberjack.h>

@class Antenna;

extern DDLogLevel ddLogLevel;

@interface DBRemoteLogger : DDAbstractLogger <DDLogger>

- (instancetype)initWithAntenna:(Antenna *)antenna;
- (NSDictionary *)logPayloadFromLogMessage:(DDLogMessage *)logMessage;

@end
