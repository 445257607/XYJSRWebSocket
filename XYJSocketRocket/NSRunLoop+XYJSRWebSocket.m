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

#import "NSRunLoop+XYJSRWebSocket.h"
#import "NSRunLoop+XYJSRWebSocketPrivate.h"

#import "XYJSRRunLoopThread.h"

// Required for object file to always be linked.
void import_NSRunLoop_XYJSRWebSocket() { }

@implementation NSRunLoop (SRWebSocket)

+ (NSRunLoop *)XYJSR_networkRunLoop
{
    return [XYJSRRunLoopThread sharedThread].runLoop;
}

@end
