//
//  RGLDocumentRequestMDL.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 17.12.25.
//  Copyright © 2025 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DocumentReader/RGLMacros.h>

@class RGLNameSpaceMDL;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(DocReader.DocumentRequestMDL)
@interface RGLDocumentRequestMDL : NSObject

- (instancetype)initWithDocType:(NSString *)docType;
- (void)addNameSpace:(RGLNameSpaceMDL *)nameSpace;

@end

NS_ASSUME_NONNULL_END
