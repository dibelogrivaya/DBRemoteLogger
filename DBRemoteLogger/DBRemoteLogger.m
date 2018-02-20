//
//  DBRemoteLogger.m
//  Example
//
//  Created by Diana Belogrivaya on 2/20/18.
//  Copyright © 2018 Diana Belogrivaya. All rights reserved.
//

#import "DBRemoteLogger.h"

#import <Antenna/Antenna.h>

#ifdef DEBUG
DDLogLevel ddLogLevel = DDLogFlagVerbose | DDLogFlagDebug | DDLogFlagInfo | DDLogFlagWarning | DDLogFlagError;
#else
DDLogLevel ddLogLevel = DDLogFlagWarning | DDLogFlagError;
#endif

@interface DBRemoteLogger ()

@property (nonatomic, strong) Antenna *antenna;

@end

@implementation DBRemoteLogger

- (instancetype)initWithAntenna:(Antenna *)antenna {
    self = [super init];
    if (!self) { return nil; }
    
    self.antenna = antenna;
    
    return self;
}

- (instancetype)init {
    return [self initWithAntenna:[Antenna sharedLogger]];
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
        
        [self.antenna log:logPayload];
    }
}

@end

