//
// Copyright (c) 2016-present, Facebook, Inc.
// All rights reserved.
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree. An additional grant
// of patent rights can be found in the PATENTS file in the same directory.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XYJSROpCode)
{
    XYJSROpCodeTextFrame = 0x1,
    XYJSROpCodeBinaryFrame = 0x2,
    // 3-7 reserved.
    XYJSROpCodeConnectionClose = 0x8,
    XYJSROpCodePing = 0x9,
    XYJSROpCodePong = 0xA,
    // B-F reserved.
};

/**
 Default buffer size that is used for reading/writing to streams.
 */
extern size_t XYJSRDefaultBufferSize(void);
