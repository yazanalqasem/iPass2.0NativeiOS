//
//  RGLDataRetrieval.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 11.09.25.
//  Copyright © 2025 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGLDocReader.h"

@class RGLDocumentRequestMDL;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(DocReader.DataRetrieval)
@interface RGLDataRetrieval : NSObject

@property (nonatomic, strong) NSArray<RGLDocumentRequestMDL *> *requests;

RGL_EMPTY_INIT_UNAVAILABLE

- (instancetype)initWithDeviceRetrieval:(RGLeMDLDeviceRetrieval)deviceRetrieval NS_DESIGNATED_INITIALIZER;
- (void)setDocRequestPreset:(RGLeMDLDocRequestPreset)docRequestPreset
             intentToRetain:(RGLeMDLIntentToRetain)intentToRetain;

@end

NS_ASSUME_NONNULL_END
