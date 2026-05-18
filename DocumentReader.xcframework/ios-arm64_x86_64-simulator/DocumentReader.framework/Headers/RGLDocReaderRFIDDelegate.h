#import <Foundation/Foundation.h>
#import <DocumentReader/RGLRFIDNotify.h>

@class RGLDocReader, RGLPAResourcesIssuer, RGLPKDCertificate, RGLTAChallenge;

@class RGLRFIDAccessControlPACE;
@class RGLRFIDAccessControlCA;

typedef void (^RGLRFIDCertificatesCallback)(NSArray <RGLPKDCertificate *> *certificates) NS_SWIFT_NAME(RFIDCertificatesCallback);

typedef void (^RGLRFIDAccessControlPACECallback)(RGLRFIDAccessControlPACE *accessControlPACE)
NS_SWIFT_NAME(RFIDAccessControlPACECallback);

typedef void (^RGLRFIDAccessControlCACallback)(RGLRFIDAccessControlCA *accessControlCA)
NS_SWIFT_NAME(RFIDAccessControlCACallback);

@protocol RGLDocReaderRFIDDelegate <NSObject>
@optional
- (void)onRequestPACertificatesWithSerial:(NSData *)serialNumber
                                   issuer:(RGLPAResourcesIssuer *)issuer
                                 callback:(RGLRFIDCertificatesCallback)callback;

- (void)onRequestTACertificatesWithKey:(NSString *)keyCAR
                                 callback:(RGLRFIDCertificatesCallback)callback;

- (void)onRequestTASignatureWithChallenge:(RGLTAChallenge *)challenge
                              callback:(void(^)(NSData *signature))callback;

- (void)didChipConnected;

- (void)didReceivedError:(RGLRFIDErrorCodes)errorCode;

/**
 * Called to select the CA option for Access Control.
 * @param options - array of options (RGLRFIDAccessControlCA)
 * @param callback - object RGLRFIDAccessControlCA from array of options
 */
- (void)onRequestCAProtocolWithOptions:(NSArray<RGLRFIDAccessControlCA *> * _Nonnull)options callback:(RGLRFIDAccessControlCACallback _Nonnull)callback
NS_SWIFT_NAME(onRequestCAProtocol(options:callback:));

/**
 * Called to select the PACE option for Access Control.
 * @param options - array of options (RGLRFIDAccessControlPACE)
 * @param callback - object RGLRFIDAccessControlPACE from array of options
 */
- (void)onRequestPACEProtocolWithOptions:(NSArray<RGLRFIDAccessControlPACE *> * _Nonnull)options callback:(RGLRFIDAccessControlPACECallback _Nonnull)callback
NS_SWIFT_NAME(onRequestPACEProtocol(options:callback:));

@end
