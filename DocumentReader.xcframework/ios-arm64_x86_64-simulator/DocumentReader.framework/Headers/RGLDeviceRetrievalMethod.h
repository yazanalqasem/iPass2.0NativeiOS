//
//  RGLDeviceRetrievalMethod.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 10.09.25.
//  Copyright © 2025 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGLDocReader.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(DocReader.DeviceRetrievalMethod)
@interface RGLDeviceRetrievalMethod : NSObject

@property (nonatomic, assign) RGLeMDLDeviceRetrieval type;
@property (nonatomic, strong, nullable) NSNumber *version;
@property (nonatomic, strong, nullable) NSNumber *cmdMaxLength;
@property (nonatomic, strong, nullable) NSNumber *respMaxLength;
@property (nonatomic, strong, nullable) NSNumber *clientModeSupport;
@property (nonatomic, strong, nullable) NSString *clientModeUUID;
@property (nonatomic, strong, nullable) NSNumber *serverModeSupport;
@property (nonatomic, strong, nullable) NSString *serverModeUUID;

- (NSDictionary<NSString *, id> *)toJSON;
- (instancetype)initWithJSON:(NSDictionary<NSString *, id> *)json;

@end

NS_ASSUME_NONNULL_END
