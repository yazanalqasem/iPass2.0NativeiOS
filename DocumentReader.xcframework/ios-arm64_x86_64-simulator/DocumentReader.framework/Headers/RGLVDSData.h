//
//  RGLVDSData.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 21.11.25.
//  Copyright © 2025 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DocumentReader/RGLMacros.h>

@class RGLBytesData;
@class RGLCertificateChain;
@class RGLDocFeature;

NS_ASSUME_NONNULL_BEGIN

/// Visible Digital Seal.
NS_SWIFT_NAME(VDSData)
@interface RGLVDSData : NSObject

@property(nonatomic, readonly, assign) NSInteger type;

@property(nonatomic, readonly, assign) NSInteger docType;

@property(nonatomic, readonly, assign) NSInteger featureRef;

/// Visible Digital Seal use case version.
@property(nonatomic, readonly, assign) NSInteger version;

@property(nonatomic, readonly, strong, nullable) NSString *certificate;

/// Three letter code identifying the issuing state or organization.
@property(nonatomic, readonly, strong, nullable) NSString *issuingCountry;

@property(nonatomic, readonly, strong, nullable) NSString *docIssueDate;

/// The binary data of the verified digital signature.
@property(nonatomic, readonly, strong, nullable) RGLBytesData *signature;

@property(nonatomic, readonly, strong, nullable) NSString *signatureDate;

@property(nonatomic, readonly, strong, nullable) NSString *signer;

/// The certificate chain, used for the digital signature verification.
@property(nonatomic, readonly, strong, nonnull) NSArray<RGLCertificateChain *> *certificateChain;

/// The doc features.
@property(nonatomic, readonly, strong, nonnull) NSArray<RGLDocFeature *> *docFeatures;

/// The list of remarks occured during the scanning procedure.
///
/// Each element is a `NSNumber` containing a `NSUInteger`, that belongs to the `enum eLDS_ParsingErrorCodes` or the `enum eLDS_ParsingNotificationCodes`.
@property(nonatomic, readonly, strong, nonnull) NSArray<NSNumber *> *notifications;

RGL_EMPTY_INIT_UNAVAILABLE

@end

NS_ASSUME_NONNULL_END
