//
//  RGLDocumentRequest18013MDL.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 16.09.25.
//  Copyright © 2025 Regula. All rights reserved.
//

#import <DocumentReader/DocumentReader.h>
#import <DocumentReader/RGLNameSpaceMDL.h>
#import <DocumentReader/RGLDocumentRequestMDL.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(DocReader.DocumentRequest18013MDL)
@interface RGLDocumentRequest18013MDL : RGLDocumentRequestMDL

@property (nonatomic, assign) RGLeMDLIntentToRetain familyName;
@property (nonatomic, assign) RGLeMDLIntentToRetain givenName;
@property (nonatomic, assign) RGLeMDLIntentToRetain birthDate;
@property (nonatomic, assign) RGLeMDLIntentToRetain issueDate;
@property (nonatomic, assign) RGLeMDLIntentToRetain expiryDate;
@property (nonatomic, assign) RGLeMDLIntentToRetain issuingCountry;
@property (nonatomic, assign) RGLeMDLIntentToRetain issuingAuthority;
@property (nonatomic, assign) RGLeMDLIntentToRetain documentNumber;
@property (nonatomic, assign) RGLeMDLIntentToRetain portrait;
@property (nonatomic, assign) RGLeMDLIntentToRetain drivingPrivileges;
@property (nonatomic, assign) RGLeMDLIntentToRetain unDistinguishingSign;
@property (nonatomic, assign) RGLeMDLIntentToRetain administrativeNumber;
@property (nonatomic, assign) RGLeMDLIntentToRetain sex;
@property (nonatomic, assign) RGLeMDLIntentToRetain height;
@property (nonatomic, assign) RGLeMDLIntentToRetain weight;
@property (nonatomic, assign) RGLeMDLIntentToRetain eyeColour;
@property (nonatomic, assign) RGLeMDLIntentToRetain hairColour;
@property (nonatomic, assign) RGLeMDLIntentToRetain birthPlace;
@property (nonatomic, assign) RGLeMDLIntentToRetain residentAddress;
@property (nonatomic, assign) RGLeMDLIntentToRetain portraitCaptureDate;
@property (nonatomic, assign) RGLeMDLIntentToRetain ageInYears;
@property (nonatomic, assign) RGLeMDLIntentToRetain ageBirthYear;
@property (nonatomic, assign) RGLeMDLIntentToRetain ageOver18;
@property (nonatomic, assign) RGLeMDLIntentToRetain issuingJurisdiction;
@property (nonatomic, assign) RGLeMDLIntentToRetain nationality;
@property (nonatomic, assign) RGLeMDLIntentToRetain residentCity;
@property (nonatomic, assign) RGLeMDLIntentToRetain residentState;
@property (nonatomic, assign) RGLeMDLIntentToRetain residentPostalCode;
@property (nonatomic, assign) RGLeMDLIntentToRetain residentCountry;
@property (nonatomic, assign) RGLeMDLIntentToRetain biometricTemplateFace;
@property (nonatomic, assign) RGLeMDLIntentToRetain biometricTemplateIris;
@property (nonatomic, assign) RGLeMDLIntentToRetain biometricTemplateFinger;
@property (nonatomic, assign) RGLeMDLIntentToRetain biometricTemplateSignatureSign;
@property (nonatomic, assign) RGLeMDLIntentToRetain familyNameNationalCharacter;
@property (nonatomic, assign) RGLeMDLIntentToRetain givenNameNationalCharacter;
@property (nonatomic, assign) RGLeMDLIntentToRetain signatureUsualMark;

/// Configures all mDL fields for non-retentive reading
/// Set all to RGLeMDLIntentToRetainFalse
- (void)disableIntentToRetainValues;

/// Configures all fields for reading with data retention
/// Set all to RGLeMDLIntentToRetainTrue
- (void)enableIntentToRetainValues;

@end

NS_ASSUME_NONNULL_END
