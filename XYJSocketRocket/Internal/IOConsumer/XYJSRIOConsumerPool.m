//
// Copyright 2012 Square Inc.
// Portions Copyright (c) 2016-present, Facebook, Inc.
//
// All rights reserved.
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree. An additional grant
// of patent rights can be found in the PATENTS file in the same directory.
//

#import "XYJSRIOConsumerPool.h"

@implementation XYJSRIOConsumerPool {
    NSUInteger _poolSize;
    NSMutableArray<XYJSRIOConsumer *> *_bufferedConsumers;
}

- (instancetype)initWithBufferCapacity:(NSUInteger)poolSize;
{
    self = [super init];
    if (self) {
        _poolSize = poolSize;
        _bufferedConsumers = [NSMutableArray arrayWithCapacity:poolSize];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithBufferCapacity:8];
}

- (XYJSRIOConsumer *)consumerWithScanner:(stream_scanner)scanner
                              handler:(data_callback)handler
                          bytesNeeded:(size_t)bytesNeeded
                   readToCurrentFrame:(BOOL)readToCurrentFrame
                          unmaskBytes:(BOOL)unmaskBytes
{
    XYJSRIOConsumer *consumer = nil;
    if (_bufferedConsumers.count) {
        consumer = [_bufferedConsumers lastObject];
        [_bufferedConsumers removeLastObject];
    } else {
        consumer = [[XYJSRIOConsumer alloc] init];
    }

    [consumer resetWithScanner:scanner
                       handler:handler
                   bytesNeeded:bytesNeeded
            readToCurrentFrame:readToCurrentFrame
                   unmaskBytes:unmaskBytes];

    return consumer;
}

- (void)returnConsumer:(XYJSRIOConsumer *)consumer;
{
    if (_bufferedConsumers.count < _poolSize) {
        [_bufferedConsumers addObject:consumer];
    }
}

@end
