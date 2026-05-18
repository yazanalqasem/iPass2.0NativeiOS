//
//  RGLUIKitHelper.h
//  DocumentReader
//
//  Created by Igor on 6.11.25.
//  Copyright © 2025 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CALayer;

NS_ASSUME_NONNULL_BEGIN

@interface RGLCUIKitHelper : NSObject

+ (void)setDisableScreenshots:(BOOL)disable forLayer:(CALayer *)layer;

@end

NS_ASSUME_NONNULL_END
