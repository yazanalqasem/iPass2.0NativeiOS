//
//  eLDS_ParsingNotificationCodes.h
//  DocumentReader
//
//  Created by EnumGenerater on 18/2/2022
//  Copyright © 2022 Regula. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, eLDS_ParsingNotificationCodes) {
  ntfLDS_ASN_Certificate_IncorrectVersion = 0x90000001,
  ntfLDS_ASN_Certificate_NonMatchingSignatureAlgorithm = 0x90000002,
  ntfLDS_ASN_Certificate_IncorrectTimeCoding = 0x90000003,
  ntfLDS_ASN_Certificate_IncorrectUseOfGeneralizedTime = 0x90000004,
  ntfLDS_ASN_Certificate_EmptyIssuer = 0x90000005,
  ntfLDS_ASN_Certificate_EmptySubject = 0x90000006,
  ntfLDS_ASN_Certificate_UnsupportedCriticalExtension = 0x90000008,
  ntfLDS_ASN_Certificate_ForcedDefaultCSCARole = 0x9000000E,
  ntfLDS_ASN_Certificate_ForcedDefaultDSRole = 0x9000000F,
  ntfLDS_ASN_Certificate_IncorrectIssuerSubjectDS = 0x90000010,
  ntfLDS_ASN_Certificate_DuplicatingExtensions = 0x90000017,
  ntfLDS_ICAO_Certificate_Version_Missed = 0x90000200,
  ntfLDS_ICAO_Certificate_Version_Incorrect = 0x90000201,
  ntfLDS_ICAO_Certificate_Issuer_Country_Missed = 0x90000202,
  ntfLDS_ICAO_Certificate_Issuer_CommonName_Missed = 0x90000203,
  ntfLDS_ICAO_Certificate_Issuer_CountryNonCompliant = 0x90000204,
  ntfLDS_ICAO_Certificate_Subject_Country_Missed = 0x90000205,
  ntfLDS_ICAO_Certificate_Subject_CommonName_Missed = 0x90000206,
  ntfLDS_ICAO_Certificate_Subject_CountryNonCompliant = 0x90000207,
  ntfLDS_ICAO_Certificate_UsingNonCompliantData = 0x90000208,
  ntfLDS_ICAO_Certificate_UnsupportedSignatureAlgorithm = 0x90000209,
  ntfLDS_ICAO_Certificate_UnsupportedPublicKeyAlgorithm = 0x9000020A,
  ntfLDS_ICAO_Certificate_MissedExtensions = 0x9000020B,
  ntfLDS_ICAO_Certificate_Validity = 0x9000020C,
  ntfLDS_ICAO_Certificate_Ext_UsingNonCompliantData = 0x9000020D,
  ntfLDS_ICAO_Certificate_Ext_KeyUsage_Missed = 0x9000020E,
  ntfLDS_ICAO_Certificate_Ext_KeyUsage_NotCritical = 0x9000020F,
  ntfLDS_ICAO_Certificate_Ext_KeyUsage_IncorrectData = 0x90000210,
  ntfLDS_ICAO_Certificate_Ext_BasicC_Missed = 0x90000211,
  ntfLDS_ICAO_Certificate_Ext_BasicC_IncorrectUsage1 = 0x90000212,
  ntfLDS_ICAO_Certificate_Ext_BasicC_IncorrectUsage2 = 0x90000213,
  ntfLDS_ICAO_Certificate_Ext_BasicC_NotCritical = 0x90000214,
  ntfLDS_ICAO_Certificate_Ext_BasicC_IncorrectData = 0x90000215,
  ntfLDS_ICAO_Certificate_Ext_BasicC_PathLenC_Missed = 0x90000216,
  ntfLDS_ICAO_Certificate_Ext_BasicC_PathLenC_Incorrect = 0x90000217,
  ntfLDS_ICAO_Certificate_Ext_ExtKeyUsage_NotCritical = 0x90000218,
  ntfLDS_ICAO_Certificate_Ext_ExtKeyUsage_IncorrectUsage = 0x90000219,
  ntfLDS_ICAO_Certificate_Ext_ExtKeyUsage_IncorrectData = 0x9000021A,
  ntfLDS_ICAO_Certificate_Ext_AuthKeyID_Missed = 0x9000021B,
  ntfLDS_ICAO_Certificate_Ext_AuthKeyID_IncorrectData = 0x9000021C,
  ntfLDS_ICAO_Certificate_Ext_AuthKeyID_KeyID_Missed = 0x9000021D,
  ntfLDS_ICAO_Certificate_Ext_SubjectKeyID_Missed = 0x9000021E,
  ntfLDS_ICAO_Certificate_Ext_SubjectKeyID_IncorrectData = 0x9000021F,
  ntfLDS_ICAO_Certificate_Ext_PrivateKeyUP_Missed = 0x90000220,
  ntfLDS_ICAO_Certificate_Ext_PrivateKeyUP_IncorrectData = 0x90000221,
  ntfLDS_ICAO_Certificate_Ext_PrivateKeyUP_Empty = 0x90000222,
  ntfLDS_ICAO_Certificate_Ext_SubjectAltName_Missed = 0x90000223,
  ntfLDS_ICAO_Certificate_Ext_SubjectAltName_IncorrectData = 0x90000224,
  ntfLDS_ICAO_Certificate_Ext_SubjectAltName_Empty = 0x90000225,
  ntfLDS_ICAO_Certificate_Ext_SubjectAltName_NonCompliant = 0x90000226,
  ntfLDS_ICAO_Certificate_Ext_SubjectAltName_Critical = 0x90000228,
  ntfLDS_ICAO_Certificate_Ext_SubjectAltName_DN_Empty = 0x90000229,
  ntfLDS_ICAO_Certificate_Ext_SubjectAltName_DN_Incorrect = 0x9000022A,
  ntfLDS_ICAO_Certificate_Ext_SubjectAltName_DN_NonCompliant = 0x9000022B,
  ntfLDS_ICAO_Certificate_Ext_IssuerAltName_Missed = 0x9000022C,
  ntfLDS_ICAO_Certificate_Ext_IssuerAltName_IncorrectData = 0x9000022D,
  ntfLDS_ICAO_Certificate_Ext_IssuerAltName_Empty = 0x9000022E,
  ntfLDS_ICAO_Certificate_Ext_IssuerAltName_NonCompliant = 0x9000022F,
  ntfLDS_ICAO_Certificate_Ext_IssuerAltName_Critical = 0x90000231,
  ntfLDS_ICAO_Certificate_Ext_IssuerAltName_DN_Empty = 0x90000232,
  ntfLDS_ICAO_Certificate_Ext_IssuerAltName_DN_Incorrect = 0x90000233,
  ntfLDS_ICAO_Certificate_Ext_IssuerAltName_DN_NonCompliant = 0x90000234,
  ntfLDS_ICAO_Certificate_Ext_DocTypeList_Missed = 0x90000235,
  ntfLDS_ICAO_Certificate_Ext_DocTypeList_IncorrectData = 0x90000236,
  ntfLDS_ICAO_Certificate_Ext_DocTypeList_Version = 0x90000237,
  ntfLDS_ICAO_Certificate_Ext_DocTypeList_DocTypes = 0x90000238,
  ntfLDS_ICAO_Certificate_Ext_DocTypeList_DocTypes_Empty = 0x90000239,
  ntfLDS_ICAO_Certificate_Ext_CertPolicies_IncorrectData = 0x9000023A,
  ntfLDS_ICAO_Certificate_Ext_CertPolicies_Empty = 0x9000023B,
  ntfLDS_ICAO_Certificate_Ext_CertPolicies_PolicyID_Missed = 0x9000023C,
  ntfLDS_ICAO_Certificate_Ext_CRLDistPoint_Missed = 0x9000023D,
  ntfLDS_ICAO_Certificate_Ext_CRLDistPoint_IncorrectData = 0x9000023E,
  ntfLDS_ICAO_Certificate_Ext_CRLDistPoint_Empty = 0x9000023F,
  ntfLDS_ICAO_Certificate_Ext_CRLDistPoint_PointMissed = 0x90000240,
  ntfLDS_ICAO_Certificate_SN_NonCompliant = 0x90000241,
  ntfLDS_ICAO_Certificate_Issuer_SN_NonCompliant = 0x90000242,
  ntfLDS_ICAO_Certificate_Subject_SN_NonCompliant = 0x90000243,
  ntfLDS_ICAO_Certificate_Issuer_AttributeNonCompliant = 0x90000244,
  ntfLDS_ICAO_Certificate_Subject_AttributeNonCompliant = 0x90000245,
  ntfLDS_ICAO_Certificate_IssuerSubject_Country_NonMatching = 0x90000246,
  ntfLDS_ICAO_Certificate_Ext_CSCA_AltNames_NonMatching = 0x90000247,
  ntfLDS_ICAO_Certificate_Ext_NameChange_IncorrectData = 0x90000248,
  ntfLDS_ICAO_Certificate_Ext_NameChange_NonCompliant = 0x90000249,
  ntfLDS_ICAO_Certificate_Ext_NameChange_Critical = 0x9000024A,
  ntfLDS_ICAO_Certificate_Ext_DocTypeList_NonCompliant = 0x9000024B,
  ntfLDS_ICAO_Certificate_Ext_DocTypeList_Critical = 0x9000024C,
  ntfLDS_ICAO_Certificate_Ext_Optional_Critical = 0x9000024D,
  ntfLDS_ICAO_Certificate_Subject_NonCompliant = 0x9000024E,
  ntfLDS_ICAO_Certificate_Subject_CommonNameNonCompliant = 0x9000024F,
  ntfLDS_ICAO_COM_LDS_Version_Incorrect = 0x90000020,
  ntfLDS_ICAO_COM_LDS_Version_Missing = 0x90000021,
  ntfLDS_ICAO_COM_Unicode_Version_Incorrect = 0x90000022,
  ntfLDS_ICAO_COM_Unicode_Version_Missing = 0x90000023,
  ntfLDS_ICAO_COM_DGPM_Incorrect = 0x90000024,
  ntfLDS_ICAO_COM_DGPM_Missing = 0x90000025,
  ntfLDS_ICAO_COM_DGPM_Unexpected = 0x90000026,
  ntfLDS_ICAO_Application_LDSVersion_Unsupported = 0x90000030,
  ntfLDS_ICAO_Application_UnicodeVersion_Unsupported = 0x90000031,
  ntfLDS_ICAO_Application_LDSVersion_Inconsistent = 0x90000032,
  ntfLDS_ICAO_Application_UnicodeVersion_Inconsistent = 0x90000033,
  ntfLDS_ASN_SignedData_OID_Incorrect = 0x90000100,
  ntfLDS_ASN_SignedData_Version_Incorrect = 0x900001A0,
  ntfLDS_ASN_SignedData_ContentOID_Incorrect = 0x900001A1,
  ntfLDS_ICAO_SignedData_Version_Incorrect = 0x90000101,
  ntfLDS_ICAO_SignedData_DigestAlgorithms_Empty = 0x90000102,
  ntfLDS_ICAO_SignedData_DigestAlgorithms_Unsupported = 0x90000103,
  ntfLDS_ICAO_SignedData_SignerInfos_MultipleEntries = 0x90000109,
  ntfLDS_ICAO_SignedData_Certificates_Missed = 0x900001B0,
  ntfLDS_ICAO_SignedData_Certificates_Empty = 0x900001B1,
  ntfLDS_ICAO_SignedData_CRLs_IncorrectUsage = 0x900001B2,
  ntfLDS_ICAO_LDSObject_IncorrectContentOID = 0x90000104,
  ntfLDS_ICAO_LDSObject_DGNumber_Incorrect = 0x90000105,
  ntfLDS_ICAO_LDSObject_DGHash_Missing = 0x90000106,
  ntfLDS_ICAO_LDSObject_DGHash_Extra = 0x90000107,
  ntfLDS_ICAO_LDSObject_Version_Incorrect = 0x90000108,
  ntfLDS_ICAO_MasterList_Version_Incorrect = 0x900001C0,
  ntfLDS_ICAO_DeviationList_Version_Incorrect = 0x900001C8,
  ntfLDS_BSI_DefectList_Version_Incorrect = 0x900001D0,
  ntfLDS_BSI_BlackList_Version_Incorrect = 0x900001D8,
  ntfLDS_ASN_SignerInfo_Version_Incorrect = 0x9000010A,
  ntfLDS_ASN_SignerInfo_SID_IncorrectChoice = 0x9000010B,
  ntfLDS_ASN_SignerInfo_SID_DigestAlgorithmNotListed = 0x9000010C,
  ntfLDS_ASN_SignerInfo_MessageDigestAttr_Missing = 0x9000010D,
  ntfLDS_ASN_SignerInfo_MessageDigestAttr_Data = 0x9000010E,
  ntfLDS_ASN_SignerInfo_MessageDigestAttr_Value = 0x9000010F,
  ntfLDS_ASN_SignerInfo_ContentTypeAttr_Missing = 0x90000110,
  ntfLDS_ASN_SignerInfo_ContentTypeAttr_Data = 0x90000111,
  ntfLDS_ASN_SignerInfo_ContentTypeAttr_Value = 0x90000112,
  ntfLDS_ASN_SignerInfo_SigningTimeAttr_Missing = 0x9000011B,
  ntfLDS_ASN_SignerInfo_SigningTimeAttr_Data = 0x9000011C,
  ntfLDS_ASN_SignerInfo_SigningTimeAttr_Value = 0x9000011D,
  ntfLDS_ASN_SignerInfo_ListContentDescriptionAttr_Missing = 0x9000011E,
  ntfLDS_ASN_SignerInfo_ListContentDescriptionAttr_Data = 0x9000011F,
  ntfLDS_Auth_SignerInfo_Certificate_Validity = 0x90000115,
  ntfLDS_Auth_SignerInfo_Certificate_RootIsNotTrusted = 0x90000116,
  ntfLDS_Auth_SignerInfo_Certificate_CantFindCSCA = 0x90000117,
  ntfLDS_Auth_SignerInfo_Certificate_Revoked = 0x90000118,
  ntfLDS_Auth_SignerInfo_Certificate_SignatureInvalid = 0x90000119,
  ntfLDS_UnsupportedImageFormat = 0x9000011A,
  ntfLDS_MRZ_DocumentType_Unknown = 0x00022008,
  ntfLDS_MRZ_IssuingState_SyntaxError = 0x00022009,
  ntfLDS_MRZ_Name_IsVoid = 0x0002200A,
  ntfLDS_MRZ_Number_IncorrectChecksum = 0x0002200D,
  ntfLDS_MRZ_Nationality_SyntaxError = 0x0002200E,
  ntfLDS_MRZ_DOB_SyntaxError = 0x0002200F,
  ntfLDS_MRZ_DOB_Error = 0x00022010,
  ntfLDS_MRZ_DOB_IncorrectChecksum = 0x00022011,
  ntfLDS_MRZ_Sex_Incorrect = 0x00022012,
  ntfLDS_MRZ_DOE_SyntaxError = 0x00022013,
  ntfLDS_MRZ_DOE_Error = 0x00022014,
  ntfLDS_MRZ_DOE_IncorrectChecksum = 0x00022015,
  ntfLDS_MRZ_OptionalData_IncorrectChecksum = 0x00022016,
  ntfLDS_MRZ_IncorrectChecksum = 0x00022017,
  ntfLDS_MRZ_Incorrect = 0x00022018,
  ntfLDS_Biometrics_FormatOwner_Missing = 0x90010000,
  ntfLDS_Biometrics_FormatOwner_Incorrect = 0x90020000,
  ntfLDS_Biometrics_FormatType_Missing = 0x90030000,
  ntfLDS_Biometrics_FormatType_Incorrect = 0x90040000,
  ntfLDS_Biometrics_Type_Incorrect = 0x90050000,
  ntfLDS_Biometrics_SubType_Missing = 0x90060000,
  ntfLDS_Biometrics_SubType_Incorrect = 0x90070000,
  ntfLDS_Biometrics_BDB_Image_Missing = 0x90080000,
  ntfLDS_Biometrics_BDB_FormatID_Incorrect = 0x90090000,
  ntfLDS_Biometrics_BDB_Version_Incorrect = 0x900A0000,
  ntfLDS_Biometrics_BDB_DataLength_Incorrect = 0x900B0000,
  ntfLDS_Biometrics_BDB_Data_Gender = 0x90100000,
  ntfLDS_Biometrics_BDB_Data_EyeColor = 0x90110000,
  ntfLDS_Biometrics_BDB_Data_HairColor = 0x90120000,
  ntfLDS_Biometrics_BDB_Data_PoseAngle_Yaw = 0x90130000,
  ntfLDS_Biometrics_BDB_Data_PoseAngle_Pitch = 0x90140000,
  ntfLDS_Biometrics_BDB_Data_PoseAngle_Roll = 0x90150000,
  ntfLDS_Biometrics_BDB_Data_PoseAngleU_Yaw = 0x90160000,
  ntfLDS_Biometrics_BDB_Data_PoseAngleU_Pitch = 0x90170000,
  ntfLDS_Biometrics_BDB_Data_PoseAngleU_Roll = 0x90180000,
  ntfLDS_Biometrics_BDB_Data_FaceImageType = 0x90190000,
  ntfLDS_Biometrics_BDB_Data_ImageDataType = 0x901A0000,
  ntfLDS_SI_PACE_Info_UnsupportedStdParameters = 0x91000000,
  ntfLDS_SI_PACE_Info_DeprecatedVersion = 0x91000001,
  ntfLDS_SI_PACE_DomainParams_UsingStdRef = 0x91000002,
  ntfLDS_SI_PACE_DomainParams_UnsupportedAlgorithm = 0x91000003,
  ntfLDS_SI_CA_Info_IncorrectVersion = 0x91000004,
  ntfLDS_SI_CA_PublicKey_UnsupportedAlgorithm = 0x91000005,
  ntfLDS_SI_CA_DomainParams_UnsupportedAlgorithm = 0x91000006,
  ntfLDS_SI_TA_Info_IncorrectVersion = 0x91000007,
  ntfLDS_SI_TA_Info_FileIDForVersion2 = 0x91000008,
  ntfLDS_SI_eIDSecurity_UnsupportedDigestAlgorithm = 0x91000009,
  ntfLDS_SI_RI_Info_IncorrectVersion = 0x9100000A,
  ntfLDS_SI_RI_DomainParams_UnsupportedAlgorithm = 0x9100000B,
  ntfLDS_SI_AA_Info_IncorrectVersion = 0x9100000C,
  ntfLDS_SI_AA_Info_UnsupportedAlgorithm = 0x9100000D,
  ntfLDS_SI_AA_Info_InconsistentAlgorithmReference = 0x9100000E,
  ntfLDS_SI_Storage_PACE_Info_NotAvailable = 0x91000100,
  ntfLDS_SI_Storage_PACE_Info_NoStdParameters = 0x91000101,
  ntfLDS_SI_Storage_PACE_Info_NoMatchingDomainParams = 0x91000102,
  ntfLDS_SI_Storage_CA_Info_NotAvailable = 0x91000103,
  ntfLDS_SI_Storage_CA_DomainParams_NoRequiredOption = 0x91000104,
  ntfLDS_SI_Storage_CA_DomainParams_NotAvailable = 0x91000105,
  ntfLDS_SI_Storage_CA_AnonymousInfos = 0x91000106,
  ntfLDS_SI_Storage_CA_Info_NoMatchingDomainParams = 0x91000107,
  ntfLDS_SI_Storage_CA_Info_NoMatchingPublicKey = 0x91000108,
  ntfLDS_SI_Storage_CA_IncorrectInfosQuantity = 0x91000109,
  ntfLDS_SI_Storage_TA_Info_NotAvailable = 0x9100010A,
  ntfLDS_SI_Storage_CardInfoLocator_MultipleEntries = 0x9100010B,
  ntfLDS_SI_Storage_eIDSecurityInfo_MultipleEntries = 0x9100010C,
  ntfLDS_SI_Storage_PrivilegedTI_MultipleEntries = 0x9100010D,
  ntfLDS_SI_Storage_PrivilegedTI_IncorrectUsage = 0x9100010E,
  ntfLDS_SI_Storage_RI_DomainParams_MultipleEntries = 0x9100010F,
  ntfLDS_SI_Storage_PACEInfos_NonConsistant = 0x91000110,
  ntfLDS_CVCertificate_Profile_IncorrectVersion = 0x91000201,
  ntfLDS_CVCertificate_Validity = 0x91000202,
  ntfLDS_CVCertificate_NonCVCADomainParameters = 0x91000203,
  ntfLDS_CV_Certificate_PrivateKey_IncorrectVersion = 0x91000204,
  ntfLDS_TA_PACEStaticBindingUsed = 0x91000300,
  ntfLDS_Auth_MLSignerInfo_Certificate_Validity = 0x92000115,
  ntfLDS_Auth_MLSignerInfo_Certificate_RootIsNotTrusted = 0x92000116,
  ntfLDS_Auth_MLSignerInfo_Certificate_CantFindCSCA = 0x92000117,
  ntfLDS_Auth_MLSignerInfo_Certificate_Revoked = 0x92000118,
  ntfLDS_Auth_MLSignerInfo_Certificate_SignatureInvalid = 0x92000119,
  ntfLDS_ICAO_Certificate_Chain_Country_NonMatching = 0x90000250,
  ntfLDS_ICAO_Certificate_VisualMrz_Country_NonMatching = 0x90000251,
  ntfLDS_MRZ_CountryCode_VisualMrz_NonMatching = 0x00022019,
  ntfLDS_ICAO_Certificate_MRZ_Country_NonMatching = 0x90000252,
} NS_SWIFT_NAME(eLDS_ParsingNotificationCodes);

FOUNDATION_EXPORT NSString *eLDS_ParsingNotificationCodesGetStringValue(eLDS_ParsingNotificationCodes type) CF_SWIFT_NAME(getter:eLDS_ParsingNotificationCodes.stringValue(self:));

NS_ASSUME_NONNULL_END