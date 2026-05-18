//
//  RGLMDLEnums.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 19.12.25.
//  Copyright © 2025 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>

/// Enum contains data retrieval types
typedef NS_ENUM(NSInteger, RGLeMDLDeviceRetrieval) {
  RGLeMDLDeviceRetrievalNFC = 1,
  RGLeMDLDeviceRetrievalBLE = 2
} NS_SWIFT_NAME(eMDLDeviceRetrieval);

/// Enum contains device engagement types
typedef NS_ENUM(NSInteger, RGLeMDLDeviceEngagement) {
  RGLeMDLDeviceEngagementQR = 0,
  RGLeMDLDeviceEngagementNFC = 1
} NS_SWIFT_NAME(eMDLDeviceEngagement);

/// Defines the data retention intent for mDL (Mobile Driver's License) field reading operations.
typedef NS_ENUM(NSInteger, RGLeMDLIntentToRetain) {
  /// Field will be read from the mDL but the verifier does NOT intend to retain the data.
  RGLeMDLIntentToRetainFalse = 0,
  /// Field will be read from the mDL and the verifier intends to retain the data.
  RGLeMDLIntentToRetainTrue = 1,
} NS_SWIFT_NAME(eMDLIntentToRetain);

/// mDL DocRequestPreset
typedef NS_ENUM(NSInteger, RGLeMDLDocRequestPreset) {
  RGLeMDLDocRequestPresetAll = 0,
  RGLeMDLDocRequestPresetAge = 1,
  RGLeMDLDocRequestPresetSrandardID = 2,
  RGLeMDLDocRequestPresetTravel = 3,
  RGLeMDLDocRequestPresetDriversLicense = 4,
} NS_SWIFT_NAME(eMDLDocRequestPreset);
