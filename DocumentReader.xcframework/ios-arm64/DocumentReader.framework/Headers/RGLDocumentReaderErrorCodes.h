//
//  RGLDocumentReaderErrorCodes.h
//  DocumentReader
//
//  Created by Serge Rylko on 5.02.26.
//  Copyright © 2026 Regula. All rights reserved.
//
#import <Foundation/Foundation.h>

extern _Nonnull NSErrorDomain const RGLDocumentReaderDomain;
/// Enum contains all possible error codes
typedef NS_ERROR_ENUM(RGLDocumentReaderDomain, RGLDocumentReaderErrorCode) {
  ///  A Core framework is absent.
  RGLDocumentReaderErrorCodeInitializationCoreAbsent = 0,

  /// The reader is not initialized or an unknown initialization error occured.
  RGLDocumentReaderErrorCodeInitializationFailed = 1,

  /// This scenario is not supported based on your license and Core framework capabilities.
  RGLDocumentReaderErrorCodeIncorrectScenario = 2,

  /// There are no results after recognition of camera frames.
  RGLDocumentReaderErrorCodeNoResult = 3,

  /// An error is encountered during database removal.
  RGLDocumentReaderErrorCodeRemoveDatabase = 4,

  /// An error is encountered during database download.
  RGLDocumentReaderErrorCodeFetchingDatabase = 5,

  /// An incorrect database ID.
  RGLDocumentReaderErrorCodeDbIdNotFound = 6,

  /// An incorrect database ID.
  RGLDocumentReaderErrorCodeDbDescriptionNotFound = 7,

  /// An error is encountered during database save on your device.
  RGLDocumentReaderErrorCodeSaveDb = 8,

  /// A database is corrupted.
  RGLDocumentReaderErrorCodeDownloadDbIncorrectChecksum = 9,

  /// A database is corrupted.
  RGLDocumentReaderErrorCodeDownloadDb = 10,

  /// Deprecated.
  RGLDocumentReaderErrorCodeCreationDb = 11,

  /// An RFID error.
  RGLDocumentReaderErrorCodeRfidError = 12,

  /// A license is absent or corrupted.
  RGLDocumentReaderErrorCodeLicenseAbsentOrCorrupted = 13,

  /// An invalid date, i.e. the license may be expired, or the date and time of set on the device doesn't correspond to reality.
  RGLDocumentReaderErrorCodeLicenseInvalidDate = 14,

  /// An invalid version.
  RGLDocumentReaderErrorCodeLicenseInvalidVersion = 15,

  /// An invalid device ID.
  RGLDocumentReaderErrorCodeLicenseInvalidDeviceID = 16,

  /// An invalid OS or application ID.
  RGLDocumentReaderErrorCodeLicenseInvalidSystemOrAppID = 17,

  /// There are no capabilities for this functionality in your license.
  RGLDocumentReaderErrorCodeLicenseNoCapabilities = 18,

  /// There are no authenticity capabilities in your license.
  RGLDocumentReaderErrorCodeLicenseNoAuthenticity = 19,

  /// An invalid URL of the video during its generating.
  RGLDocumentReaderErrorCodeRecordProcessInvalidOutputURL = 20,

  /// Something went wrong with online license processing.
  RGLDocumentReaderErrorCodeLicenseOnlineError = 21,

  /// db.dat is absent.
  RGLDocumentReaderErrorCodeNoNoDatabase = 22,

  /// db.dat is incorrect.
  RGLDocumentReaderErrorCodeDatabaseIncorrect = 23,

  /// Failed to set TCC params.
  RGLDocumentReaderErrorCodeSetTCCParamsFailed = 24,

  /// The operation failed due to RFID reading has already started.
  RGLDocumentReaderErrorCodeRFIDInProgress = 25,

  RGLDocumentReaderErrorCodeStartBackendProcessingFailed = 26,

  RGLDocumentReaderErrorCodeAddDataToPackageFailed = 27,

  RGLDocumentReaderErrorCodeFinalizePackageFailed = 28,

  /// The application doesn't have permission to use the camera.
  RGLDocumentReaderErrorCodeCameraNoPermission = 29,

  RGLDocumentReaderErrorCodeCameraNotAvailable = 30,

  /// The camera not supported in this scenario.
  RGLDocumentReaderErrorCodeCannotUseCameraInScenario = 40,

  /// The application doesn't have permission to use bluetooth.
  RGLDocumentReaderErrorCodeBluetoothNoPermission = 41,

  /// Wrong input while mDL processing.
  RGLDocumentReaderErrorCodeMDLWrongInput = 400,

  /// General mDL processing error.
  RGLDocumentReaderErrorCodeMDLProcessingError = 900
};
