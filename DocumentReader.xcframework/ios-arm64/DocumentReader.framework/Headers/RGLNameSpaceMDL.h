//
//  RGLNameSpaceMDL.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 17.12.25.
//  Copyright © 2025 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGLDocReader.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(DocReader.NameSpaceMDL)
@interface RGLNameSpaceMDL : NSObject

@property (nonatomic, strong, readonly) NSString *name;

RGL_EMPTY_INIT_UNAVAILABLE

- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;
- (void)addField:(NSString *)name intentToRetain:(RGLeMDLIntentToRetain)value;

@end

NS_ASSUME_NONNULL_END
