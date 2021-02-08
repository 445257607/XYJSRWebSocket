//
// Copyright (c) 2016-present, Facebook, Inc.
// All rights reserved.
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree. An additional grant
// of patent rights can be found in the PATENTS file in the same directory.
//

#import "XYJSRError.h"

#import "XYJSRWebSocket.h"

NS_ASSUME_NONNULL_BEGIN

NSError *XYJSRErrorWithDomainCodeDescription(NSString *domain, NSInteger code, NSString *description)
{
    return [NSError errorWithDomain:domain code:code userInfo:@{ NSLocalizedDescriptionKey: description }];
}

NSError *XYJSRErrorWithCodeDescription(NSInteger code, NSString *description)
{
    return XYJSRErrorWithDomainCodeDescription(XYJSRWebSocketErrorDomain, code, description);
}

NSError *XYJSRErrorWithCodeDescriptionUnderlyingError(NSInteger code, NSString *description, NSError *underlyingError)
{
    return [NSError errorWithDomain:XYJSRWebSocketErrorDomain
                               code:code
                           userInfo:@{ NSLocalizedDescriptionKey: description,
                                       NSUnderlyingErrorKey: underlyingError }];
}

NSError *XYJSRHTTPErrorWithCodeDescription(NSInteger httpCode, NSInteger errorCode, NSString *description)
{
    return [NSError errorWithDomain:XYJSRWebSocketErrorDomain
                               code:errorCode
                           userInfo:@{ NSLocalizedDescriptionKey: description,
                                       XYJSRHTTPResponseErrorKey: @(httpCode) }];
}

NS_ASSUME_NONNULL_END
