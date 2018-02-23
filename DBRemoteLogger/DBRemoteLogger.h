//
//  DBRemoteLogger.h
//  Example
//
//  Created by Diana Belogrivaya on 2/20/18.
//  Copyright © 2018 Diana Belogrivaya. All rights reserved.
//

#import <CocoaLumberjack/CocoaLumberjack.h>

FOUNDATION_EXPORT DDLogLevel ddLogLevel;

@interface DBRemoteLogger : DDAbstractLogger <DDLogger>

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/**
 * Antenna logger.
 **/
+ (void)addLoggerWithChannelUrlPath:(NSString *)urlPath
          useLifecycleNotifications:(BOOL)loggingNotifications;
+ (void)removeLoggerChannels;

/**
 * Logger for the Apple System Log facility.
 **/
+ (void)addASLLogger;
+ (void)removeASLLogger;

/**
 * Logger for Terminal output or Xcode console output,
 * depending on where you are running your code.
 **/
+ (void)addTTYLogger;
+ (void)removeTTYLogger;

@end
