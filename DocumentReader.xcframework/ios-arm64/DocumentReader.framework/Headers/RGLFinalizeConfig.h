//
//  RGLFinalizeConfig.h
//  DocumentReader
//
//  Created by Raman on 5.12.25.
//  Copyright © 2025 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DocumentReader/RGLMacros.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(DocReader.FinalizeConfig)
@interface RGLFinalizeConfig : NSObject

@property (nonatomic, assign) BOOL rawImages;
@property (nonatomic, assign) BOOL video;
@property (nonatomic, assign) BOOL rfidSession;
@property (nonatomic, assign) BOOL mdlSession;

+ (instancetype)defaultParams;

RGL_EMPTY_INIT_UNAVAILABLE

@end

NS_ASSUME_NONNULL_END
