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

#import "NSURLRequest+XYJSRWebSocket.h"
#import "NSURLRequest+XYJSRWebSocketPrivate.h"

// Required for object file to always be linked.
void import_NSURLRequest_XYJSRWebSocket() { }

NS_ASSUME_NONNULL_BEGIN

static NSString *const XYJSRSSLPinnnedCertificatesKey = @"SocketRocket_SSLPinnedCertificates";

@implementation NSURLRequest (SRWebSocket)

- (nullable NSArray *)XYJSR_SSLPinnedCertificates
{
    return nil;
}

@end

@implementation NSMutableURLRequest (SRWebSocket)

- (void)setXYJSR_SSLPinnedCertificates:(nullable NSArray *)SR_SSLPinnedCertificates
{
    [NSException raise:NSInvalidArgumentException
                format:@"Using pinned certificates is neither secure nor supported in SocketRocket, "
                        "and leads to security issues. Please use a proper, trust chain validated certificate."];
}

@end

NS_ASSUME_NONNULL_END
