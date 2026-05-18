//
//  RGLDocumentReaderResultsStatus.h
//  DocumentReader
//
//  Created by Pavel Kondrashkov on 11/5/21.
//  Copyright © 2021 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <DocumentReader/RGLMacros.h>
#import <DocumentReader/RGLCheckResult.h>

NS_ASSUME_NONNULL_BEGIN

@class RGLOpticalStatus;
@class RGLDetailsAge;
@class RGLRFIDSessionDataStatus;

/// Provision of document verification status
NS_SWIFT_NAME(DocumentReaderResults.Status)
@interface RGLDocumentReaderResultsStatus : NSObject

/// Summary of all results.
@property(nonatomic, readonly, assign) RGLCheckResult overallStatus;

/// Summary of all optical results. The same value as `detailsOptical.overallStatus`
@property(nonatomic, readonly, assign) RGLCheckResult optical;

/// Container for an optical related scanning statuses.
@property(nonatomic, readonly, strong, nonnull) RGLOpticalStatus *detailsOptical;

/// Summary of all RFID results. Same as `detailsRFID.overallStatus`.
@property(nonatomic, readonly, assign) RGLCheckResult rfid;

/// Container for a RFID related scanning statuses.
@property(nonatomic, readonly, strong, nonnull) RGLRFIDSessionDataStatus *detailsRFID;

/// Comparison status for portrait in the document aganist live or external image.
@property(nonatomic, readonly, assign) RGLCheckResult portrait;

/// Verification status for document data against database.
@property(nonatomic, readonly, assign) RGLCheckResult stopList;

/// Summary of all age results.
@property(nonatomic, readonly, assign) RGLCheckResult age;

/// Container for an details age scanning statuses.
@property(nonatomic, readonly, strong, nonnull) RGLDetailsAge *detailsAge;

/// Summary of all mDL results.
@property(nonatomic, readonly, assign) RGLCheckResult mDL;

@property(nonatomic, readonly, assign) RGLCheckResult captureProcessIntegrity;

RGL_EMPTY_INIT_UNAVAILABLE

@end

NS_ASSUME_NONNULL_END
