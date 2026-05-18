//
//  RGLBsi.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 5.02.26.
//  Copyright © 2026 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(DocReader.Bsi)
@interface RGLBsi : NSObject

/// When enabled, returns processing results in accordance with the BSI TR-03135 standard in addition to the existing processing results.
/// Type: Bool
@property(nonatomic, strong, nullable) NSNumber *generateResult;

- (instancetype)initWithJSON:(NSDictionary<NSString *, id> *)json;
- (NSDictionary<NSString *, id> *)toJSON;

@end

NS_ASSUME_NONNULL_END
