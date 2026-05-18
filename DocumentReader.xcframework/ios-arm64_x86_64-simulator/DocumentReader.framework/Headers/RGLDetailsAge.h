//
//  RGLDetailsAge.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 26.11.25.
//  Copyright © 2025 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <DocumentReader/RGLMacros.h>
#import <DocumentReader/RGLCheckResult.h>

NS_ASSUME_NONNULL_BEGIN

/// Container for an details age scanning statuses.
NS_SWIFT_NAME(DetailsAge)
@interface RGLDetailsAge : NSObject

@property(nonatomic, readonly, strong, nullable) NSNumber *threshold;

@property(nonatomic, readonly, assign) RGLCheckResult overThreshold;

@property(nonatomic, readonly, assign) RGLCheckResult over18;

@property(nonatomic, readonly, assign) RGLCheckResult over21;

@property(nonatomic, readonly, assign) RGLCheckResult over25;

@property(nonatomic, readonly, assign) RGLCheckResult over65;

RGL_EMPTY_INIT_UNAVAILABLE

@end

NS_ASSUME_NONNULL_END
