//
//  DBRemoteLogger.m
//  Example
//
//  Created by Diana Belogrivaya on 2/20/18.
//  Copyright © 2018 Diana Belogrivaya. All rights reserved.
//

#import "DBRemoteLogger.h"

#import <Antenna/Antenna.h>
#import <CocoaLumberjack/CocoaLumberjack.h>
#import <CocoaLumberjack/DDLogMacros.h>

#ifdef DEBUG
DDLogLevel ddLogLevel = DDLogFlagVerbose | DDLogFlagDebug | DDLogFlagInfo | DDLogFlagWarning | DDLogFlagError;
#else
DDLogLevel ddLogLevel = DDLogFlagWarning | DDLogFlagError;
#endif

@implementation DBRemoteLogger

+ (void)addLoggerWithChannelUrlPath:(NSString *)urlPath useLifecycleNotifications:(BOOL)loggingNotifications {
    DBRemoteLogger *logger = [[[self class] alloc] initWithChannelUrlPath:urlPath
                                                useLifecycleNotifications:loggingNotifications];
    [DDLog addLogger:logger];
}

+ (void)addASLLogger {
    [DDLog addLogger:[DDASLLogger sharedInstance]];
}

+ (void)addTTYLogger {
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
}

- (instancetype)initWithChannelUrlPath:(NSString *)urlPath
             useLifecycleNotifications:(BOOL)loggingNotifications {
    if (self = [super init]) {
        [[Antenna sharedLogger] addChannelWithURL:[NSURL URLWithString:urlPath] method:@"POST"];
        if (loggingNotifications) {
            [[Antenna sharedLogger] startLoggingApplicationLifecycleNotifications];
        }
    }
    return self;
}

+ (void)removeLoggerChannels {
    DBRemoteLogger *remoteLogger = nil;
    for (id<DDLogger> logger in [DDLog allLoggers]) {
        if ([logger isKindOfClass:[self class]]) {
            remoteLogger = logger;
            break;
        }
    }
    if (remoteLogger != nil) {
        [DDLog removeLogger:remoteLogger];
    }
    
    [[Antenna sharedLogger] removeAllChannels];
    [[Antenna sharedLogger] stopLoggingAllNotifications];
}

+ (void)removeASLLogger {
    [DDLog removeLogger:[DDASLLogger sharedInstance]];
}

+ (void)removeTTYLogger {
    [DDLog removeLogger:[DDTTYLogger sharedInstance]];
}

#pragma mark - Log Payload

- (NSDictionary *)logPayloadFromLogMessage:(DDLogMessage *)logMessage {
    return @{
             @"fileName": logMessage.fileName,
             @"method": logMessage.function,
             @"timestamp": logMessage->_timestamp,
             @"level": @(logMessage->_level),
             @"flag": @(logMessage->_flag)
             };
}

#pragma mark - DDLogger

- (void)logMessage:(DDLogMessage *)logMessage {
    NSString *logString = logMessage->_message;
    
    if (self->_logFormatter) {
        logString = [self->_logFormatter formatLogMessage:logMessage];
    }
    
    if (logString) {
        NSDictionary *extraLogPayload = [self logPayloadFromLogMessage:logMessage];
        NSMutableDictionary *logPayload = [NSMutableDictionary dictionaryWithDictionary:extraLogPayload];
        logPayload[@"message"] = logString;
        
        [[Antenna sharedLogger] log:logPayload];
    }
}

@end

