//
//  RGLDocFeature.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 21.11.25.
//  Copyright © 2025 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RGLBytesData;

NS_ASSUME_NONNULL_BEGIN

@interface RGLDocFeature : NSObject

@property(nonatomic, strong, readonly, nullable) RGLBytesData *data;
@property(nonatomic, strong, readonly, nullable) NSNumber *type;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithJSON:(NSDictionary *)json;
+ (instancetype)initWithJSON:(NSDictionary *)json;
- (NSDictionary *)jsonDictionary;

@end

NS_ASSUME_NONNULL_END
