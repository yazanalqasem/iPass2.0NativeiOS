//
//  RGLDeviceEngagement.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 10.09.25.
//  Copyright © 2025 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGLDocReader.h"

@class RGLDeviceRetrievalMethod;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(DocReader.DeviceEngagement)
@interface RGLDeviceEngagement : NSObject

@property (nonatomic, strong, nullable) NSArray<RGLDeviceRetrievalMethod *> *deviceRetrievalMethods;

- (NSDictionary<NSString *, id> *)toJSON;
- (instancetype)initWithJSON:(NSDictionary<NSString *, id> *)json;

@end

NS_ASSUME_NONNULL_END
